<?php

class GroupbuyApp extends StorebaseApp
{

    var $_groupbuy_mod;
    var $_goods_mod;
    var $_visitor;
    var $_groupgoods_mod;

    function __construct()
    {
        $this->GroupbuyApp();
    }

    function GroupbuyApp()
    {
        $this->_groupgoods_mod = &m('group_goods');
        $this->_groupbuy_mod = &m('groupbuy');
        $this->_goods_mod = &m('goods');

        parent::__construct();
        $this->_visitor = $this->visitor->info;
    }

    function index()
    {
        $id = empty($_GET['id']) ? 0 : intval($_GET['id']);
        if (!$id)
        {
            $this->show_warning('no_such_groupbuy');
            return false;
        }
        // �Ź���Ϣ
        $group = $this->_groupbuy_mod->get(array(
            'conditions' => 'group_id=' . $id . ' AND gb.state<>' . GROUP_PENDING,
            'join' => 'belong_store',
            'fields' => 'gb.*,s.owner_name'
        ));

        if (empty($group))
        {
            $this->show_warning('no_such_groupbuy');
            return;
        }

        // �Ź���Ʒ��Ϣ
        $goods = $this->_query_goods_info($group['goods_id']);

        if (!IS_POST)
        {
            $data['views'] = $group['views'] + 1; // �����
            if ($group['end_time'] < gmtime() && $group['state'] == GROUP_ON)
            {
                $group['state'] = GROUP_END; // �����Ź�

                /* ֪ͨ���� */
                $content = get_msg('toseller_groupbuy_end_notify', array('cancel_days' => GROUP_CANCEL_INTERVAL));
                $this->_groupbuy_mod->sys_notice(
                    $id,
                    array('seller'),
                    '',
                    $content,
                    array('msg')
                );
            }
            else if ($group['end_time'] + GROUP_CANCEL_INTERVAL * 3600 * 24 < gmtime() && $group['state'] == GROUP_END)
            {
                $group['state'] = GROUP_CANCELED; // ȡ���Ź�

                /* ֪ͨ��Һ�վ�� */
                $content = get_msg('tobuyer_group_auto_cancel_notify', array('cancel_days' => GROUP_CANCEL_INTERVAL,'url' => SITE_URL . '/' . url("app=groupbuy&id=$id")));
                $this->_groupbuy_mod->sys_notice(
                    $id,
                    array('admin','buyer'),
                    '',
                    $content,
                    array('msg')
                );
            }
            $data['state'] = $group['state'];
            $this->_groupbuy_mod->edit($id,$data);
            // ������
            $group['quantity'] = $this->_groupbuy_mod->get_join_quantity($id);
            // ����
            $group['left_quantity'] = $group['min_quantity'] - $group['quantity'];
            $group['left_per'] = 100 - intval(100 * $group['quantity'] / $group['min_quantity']);
            $group['left_per'] < 0 && $group['left_per'] = 0;
            // ״̬����
            $group['state_desc'] = $this->_get_state_desc($group['state'], $group['end_time']);
            // �Ź����۸�
            $group['spec_price'] = unserialize($group['spec_price']);
            // ��ִ�в���
            $group['ican'] = $this->_ican($group['group_id'], $group['state'], $group['store_id']);
            // ���ż�¼
            $groupbuy_log_mod =& m('groupbuy_log');
            $join_list = $groupbuy_log_mod->find(array(
                'conditions' => "group_id = '$id' AND pay_status = 1",
                'fields' => "user_name",
            ));

            // ������Ϣ
            $this->set_store($group['store_id']);
            $store = $this->get_store_data();


            // ��ǰλ��
            $this->_curlocal(array(
                array(
                    'text' => Lang::get('groupbuy'),
                    'url' => url('app=search&act=groupbuy')
                ),
                array(
                    'text' => $group['group_name'],
                )
            ));
            // �Ź���ѯ����
            $data = $this->_get_groupbuy_qa($id);
            if (Conf::get('captcha_status.goodsqa'))
            {
                $this->assign('captcha', 1);
            }

            $this->assign('email',      $data['email']);
            $this->assign('page_info',  $data['page_info']);
            $this->assign('qa_info',    $data['qa_info']);
            /* ҳ����� */
            $this->_config_seo('title', $group['group_name'] . ' - ' .Lang::get('groupbuy') . ' - ' . Conf::get('site_title'));
            $this->_import_resource();
            $this->assign('store', $store);
            $this->assign('goods', $goods);
            $this->assign('group', $group);
            $this->assign('guest_comment_enable', Conf::get('guest_comment'));
            $this->assign('join_list', $join_list);
            $this->display('groupbuy.index.html');
        }
        else
        {
                if (isset($_POST['join']))
                {
                    $quantity = intval($_POST['quantity']);
                    if ($quantity == 0)
                    {
                        $this->show_warning('fill_quantity');
                        return;
                    }
                    if ($group['max_per_user'] > 0 && $quantity > $group['max_per_user'])
                    {
                        $this->show_warning(sprintf(Lang::get('error_max_per_user'), $group['max_per_user']));
                        return;
                    }
                    $link_man = $this->checkVar($_POST['real_name']);
                    $tel = $this->checkVar($_POST['tel']);
                    if (!$link_man || !$tel)
                    {
                        $this->show_warning('fill_join_user_info');
                        return;
                    }
                    $group_price = $this->checkVar($_POST['group_price']);
                    $group_integral = intval($_POST['group_integral']);
                    $mtotal = $quantity * $group_price;
                    $itotal = $quantity * $group_integral;
                    $order_num = $this->checkVar($_POST['order_num']);
                    $address = $this->checkVar($_POST['address']);
                    $remark = $this->checkVar($_POST['remark']);

                    /*�۳��û�����֧������*/
                    $user_mod =& m('member');
                    $user = $user_mod->get($this->_visitor['user_id']);
                    if($user['integral'] < $itotal){
                        $this->show_warning('int_not_enough');
                        return;
                    }else{
                        $int = $user['integral'] - $itotal;
                        $user_mod->edit($user['user_id'], array('integral' => $int));
                        $this->set_store($group['store_id']);
                        $store = $this->get_store_data();
                        $seller = $store['store_owner'];
                        /*��¼�����ּ�¼*/
                        $content = "�μ��Ź� {$group['group_name']},���ҹ�����{$quantity}����Ʒ��֧��������֣�";
                        $this->addrecord($seller['user_name'], $user['user_name'], $itotal, $content);
                    }

                    $data = array(
                        'group_id'      => $group['group_id'],
                        'user_id'       => $this->_visitor['user_id'],
                        'user_name'     => $this->_visitor['user_name'],
                        'quantity'      => $quantity,
                        'mtotal'        => $mtotal,
                        'itotal'        => $itotal,
                        'order_num'    => $order_num,
                        'address'      => $address,
                        'remark'       => $remark,
                        'spec_quantity' => '',
                        'linkman'       => $link_man,
                        'tel'           => $tel,
                        'order_id'      => 0,
                        'pay_status'   => 0,
                        'send_status'  => 0,
                        'add_time'      => gmtime(),
                    );
                    /*���뵽�Ź������¼*/
                    $groupbuy_log_mod =& m('groupbuy_log');
                    $groupbuy_log_mod->add($data);
                    $this->show_message('join_groupbuy_successed');

                    $groupbuy_url = SITE_URL . '/' . url('app=groupbuy&id=' . $group['group_id']);
                    $groupbuy_name  = $group['group_name'];
                    $this->send_feed('groupbuy_joined', array(
                        'user_id'   => $this->visitor->get('user_id'),
                        'user_name'   => $this->visitor->get('user_name'),
                        'groupbuy_url'   => $groupbuy_url,
                        'groupbuy_name'   => $groupbuy_name,
                        'images'   => array(
                            array(
                                'url'   => SITE_URL . '/' . $goods['image_url'],
                                'link'   => $groupbuy_url,
                            )
                        ),
                    ));

                    return;
                }
                elseif (isset($_POST['qa']))
                {
                    /* �������ο����� */
                    if (!Conf::get('guest_comment') && !$this->visitor->has_login)
                    {
                        $this->show_warning('guest_comment_disabled');

                        return;
                    }

                    //�Ź���ѯ
                    $content = (isset($_POST['content'])) ? trim($_POST['content']) : '';
                    $email = (isset($_POST['email'])) ? trim($_POST['email']) : '';
                    $hide_name = (isset($_POST['hide_name'])) ? trim($_POST['hide_name']) : '';
                    if (empty($content))
                    {
                        $this->show_warning('content_not_null');
                        return;
                    }
                    $qa_mod =& m('goodsqa');
                    //����֤����ʼ������ж�
                    if (Conf::get('captcha_status.goodsqa'))
                    {
                        if (base64_decode($_SESSION['captcha']) != strtolower($_POST['captcha']))
                        {
                            $this->show_warning('captcha_failed');
                            return;
                        }
                    }
                    if (!empty($email) && !is_email($email))
                    {
                        $this->show_warning('email_not_correct');
                        return;
                    }
                    // ��������
                    $user_id = empty($hide_name) ? $_SESSION['user_info']['user_id'] : 0;
                    $conditions = 'group_id ='.$id;
                    $groupbuy_mod = & m('groupbuy');
                    $ids = $groupbuy_mod->get(array(
                        'fields' => 'store_id,group_name',
                        'conditions' => $conditions
                    ));
                    extract($ids);
                    $data = array(
                        'question_content' => $content,
                        'type' => 'groupbuy',
                        'item_id' => $id,
                        'item_name' => $group_name,
                        'store_id' => $store_id,
                        'email' => $email,
                        'user_id' => $user_id,
                        'time_post' => gmtime(),
                    );
                    if ($qa_mod->add($data))
                    {
                        $this->show_message('question_successful');
                        return;
                    }
                    else
                    {
                        $this->show_warning('post_fail');
                        exit;
                    }

                }
                else if (isset($_POST['exit']))
                {
                    $member_mod = &m('member');
                    $member_mod->unlinkRelation('join_groupbuy', $this->_visitor['user_id'], $group['group_id']);
                    $this->show_message('exit_groupbuy_successed');
                    return;
                }

        }

    }

    function _query_goods_info($goods_id)
    {
        $goods = $this->_groupgoods_mod->get($goods_id);
        $goods['image_url'] || $goods['image_url'] = Conf::get('default_goods_image');
        return $goods;
    }

    function _get_state_desc($state, $end_time)
    {
        $lefttime = lefttime($end_time);
        $desc = array(
            GROUP_ON    =>  Lang::get('desc_on') . ' ' . $lefttime,
            GROUP_END   =>  Lang::get('desc_end'),
            GROUP_FINISHED  => Lang::get('desc_finished'),
            GROUP_CANCELED  => Lang::get('desc_cancel'),
        );
        return $desc[$state];
    }

    function _ican($id, $state, $store_id, $act = '')
    {
        $state_permission = array(
            GROUP_PENDING   => array(),
            GROUP_ON        => array(),
            GROUP_END       => array(),
            GROUP_FINISHED  => array(),
            GROUP_CANCELED  => array()
        );
        $member_mod = &m('member');

        if ($this->_visitor['user_id'] > 0) //�ѵ�½�û�
        {
            // �Ƿ��Ѿ��μ�
            $join = current($member_mod->getRelatedData('join_groupbuy', $this->_visitor['user_id'], array(
                    'conditions' => 'gb.group_id=' . $id,
                    'order' => 'gb.group_id DESC',
                    'fields' => 'gb.state'
            )));
            if ($join)
            {
                $state_permission[GROUP_ON] = array('ask', 'exit' ,'join_info'); // ��ѯ,�˳��Ź�,������Ϣ
                $state_permission[GROUP_CANCELED] = array('join_info');
                $state_permission[GROUP_FINISHED] = array('join_info', 'buy');
                $state_permission[GROUP_END] = array('join_info');
            }
            else
            {
                $state_permission[GROUP_ON] = array('ask', 'join');
            }

            if ($store_id == $this->_visitor['user_id']) // �����Ϊ�Ź�������
            {
                $state_permission[GROUP_ON] = array('ask');
            }
        }
        else // �ο�
        {
            $state_permission[GROUP_ON] = array('ask', 'join', 'login'); // login��ʾ��Ҫ��½���ܲμ�
        }

        if (empty($act))
        {
            $actions = array();
            foreach ($state_permission[$state] as $action)
            {
                $actions[$action] = true;
            }
            return $actions; // ���ظ��Ź���״̬ʱ����Ĳ���
        }
        return in_array($act, $state_permission[$state]) ? true : false; // ���Ź���״̬�Ƿ�����ִ�д˲���
    }

    function _import_resource()
    {
        if(in_array(ACT, array('view')))
        {
            $resource['script'][] = array( // ��֤
                'path' => 'jquery.plugins/jquery.validate.js'
            );
        }
        $this->import_resource($resource);
    }

    // ȡ�Ź���ѯ
    function _get_groupbuy_qa($id)
    {
        $page = $this->_get_page(10);
        $groupbuy_qa = & m('goodsqa');
        $qa_info = $groupbuy_qa->find(array(
            'join' => 'belongs_to_user',
            'fields' => 'member.user_name,question_content,reply_content,time_post,time_reply',
            'conditions' => '1 = 1 AND item_id = '.$id . " AND type = 'groupbuy'",
            'limit' => $page['limit'],
            'order' =>'time_post desc',
            'count' => true
        ));
        $page['item_count'] = $groupbuy_qa->getCount();
        $this->_format_page($page);
        if (!empty($_SESSION['user_info']))
        {
            $user_mod = & m('member');
            $user_info = $user_mod->get(array(
                'fields' => 'email',
                'conditions' => '1=1 AND user_id = '.$_SESSION['user_info']['user_id']
            ));
            extract($user_info);
        }
        return array(
            'email' => $email,
            'page_info' => $page,
            'qa_info' => $qa_info,
        );
    }
}

?>
