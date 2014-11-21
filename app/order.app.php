<?php

/**
 *    �ۻ�Ա�������������ʵ�ʽ����й�̨�ۻ�Ա�Ľ�ɫ���������ô�������������ң��ۻ�Ա��Ҫ��ʲô�������һ�ѯ������Ҫ���ջ���ַ��ʲô֮�������
 ��        ��������Ļش�������һ�ŵ��ӣ����ŵ��Ӿ��ǡ�������
 *
 *    @author    Garbin
 *    @param    none
 *    @return    void
 */
class OrderApp extends ShoppingbaseApp
{
    /**
     *    ��д�ջ�����Ϣ��ѡ�����ͣ�֧����ʽ��
     *
     *    @author    Garbin
     *    @param    none
     *    @return    void
     */
    function index()
    {
        $goods_info = $this->_get_goods_info();
		
        if ($goods_info === false)
        {
            /* ���ﳵ�ǿյ� */
            $this->show_warning('goods_empty');

            return;
        }
		
		
		/*�����ǰ�˻��Ļ��ֲ������¶�������ô����*/
		$user = $this->visitor->get();
        $user_mod =& m('member');
		$user_info = $user_mod->get_info($user['user_id']);
		
		if($user_info != ""){
			if($user_info[integral] < $goods_info[int_amount]){
				$this->show_warning('����ǰ�Ļ���Ϊ��<strong>'.$user_info[integral].'��</strong><br>�����Թ�����Щ��Ʒ��������ѡ��');
				return;
			}
		}
		
		

		//��ѻ�Ա�޷����򴿻�����Ʒ,�޷�����ٷ�����������̵Ĳ�Ʒ��
		$llg_id = array(275);   //���ֹ�����ID
		
		if($user_info['grade'] == '��ѻ�Ա'){
			foreach($goods_info['items'] as $value){
				if($value['subtotal'] == 0){
					$this->show_warning('�µ�ʧ�ܣ��������д�������Ʒ����ѻ�Ա�޷����򴿻�����Ʒ��');
					return;
				}
			}
			
			if(!in_array($goods_info['store_id'],$llg_id)){
				$this->show_warning('�µ�ʧ�ܣ���ѻ�Աֻ�ܹ���ٷ����̵���Ʒ��');
				return;
			}
		}
		
		
			
		
		

        /*  ����� */
        $goods_beyond = $this->_check_beyond_stock($goods_info['items']);
        if ($goods_beyond)
        {
            $str_tmp = '';
            foreach ($goods_beyond as $goods)
            {
                $str_tmp .= '<br /><br />' . $goods['goods_name'] . '&nbsp;&nbsp;' . $goods['specification'] . '&nbsp;&nbsp;' . Lang::get('stock') . ':' . $goods['stock'];
            }
            $this->show_warning(sprintf(Lang::get('quantity_beyond_stock'), $str_tmp));
            return;
        }

        if (!IS_POST)
        {
            /* ������Ʒ���ͻ�ȡ��Ӧ�������� */
            $goods_type     =&  gt($goods_info['type']);
            $order_type     =&  ot($goods_info['otype']);

            /* ��ʾ������ */
            $form = $order_type->get_order_form($goods_info['store_id']);
            if ($form === false)
            {
                $this->show_warning($order_type->get_error());

                return;
            }
            $this->_curlocal(
                LANG::get('create_order')
            );
            $this->_config_seo('title', Lang::get('confirm_order') . ' - ' . Conf::get('site_title'));
            $this->assign('goods_info', $goods_info);
            $this->assign($form['data']);
            $this->display($form['template']);
        }
        else
        {
            /* �ڴ˻�ȡ���ɶ�������������Ҫ�أ��û��ύ�����ݣ�POST������Ʒ��Ϣ��������Ʒ�б���Ʒ�ܼۣ���Ʒ�����������ͣ����������� */
            $store_id = isset($_GET['store_id']) ? intval($_GET['store_id']) : 0;
            if ($goods_info === false)
            {
                /* ���ﳵ�ǿյ� */
                $this->show_warning('goods_empty');
				return;
            }
			
			
			
			
            /* �Ż�ȯ���ݴ��� */
            if ($goods_info['allow_coupon'] && isset($_POST['coupon_sn']) && !empty($_POST['coupon_sn']))
            {
                $coupon_sn = trim($_POST['coupon_sn']);
                $coupon_mod =& m('couponsn');
                $coupon = $coupon_mod->get(array(
                    'fields' => 'coupon.*,couponsn.remain_times',
                    'conditions' => "coupon_sn.coupon_sn = '{$coupon_sn}' AND coupon.store_id = " . $store_id,
                    'join'  => 'belongs_to_coupon'));
                if (empty($coupon))
                {
                    $this->show_warning('involid_couponsn');
                    exit;
                }
                if ($coupon['remain_times'] < 1)
                {
                    $this->show_warning("times_full");
                    exit;
                }
                $time = gmtime();
                if ($coupon['start_time'] > $time)
                {
                    $this->show_warning("coupon_time");
                    exit;
                }

                if ($coupon['end_time'] < $time)
                {
                    $this->show_warning("coupon_expired");
                    exit;
                }
                if ($coupon['min_amount'] > $goods_info['amount'])
                {
                    $this->show_warning("amount_short");
                    exit;
                }
                unset($time);
                $goods_info['discount'] = $coupon['coupon_value'];
            }
            /* ������Ʒ���ͻ�ȡ��Ӧ�Ķ������� */
            $goods_type =& gt($goods_info['type']);
            $order_type =& ot($goods_info['otype']);

            /* ����Щ��Ϣ���ݸ��������ʹ��������ɶ���(��������ṩ����Ϣ����һ�Ŷ���) */
            $order_id = $order_type->submit_order(array(
                'goods_info'    =>  $goods_info,      //��Ʒ��Ϣ�������б��ܼۣ��������������̣����ͣ�,�ɿ���!
                'post'          =>  $_POST,           //�û���д�Ķ�����Ϣ
            ));
			
			


            if (!$order_id)
            {
                $this->show_warning($order_type->get_error());

                return;
            }

            /*  ����Ƿ�����ջ��˵�ַ  */
            if (isset($_POST['save_address']) && (intval(trim($_POST['save_address'])) == 1))
            {
                 $data = array(
                    'user_id'       => $this->visitor->get('user_id'),
                    'consignee'     => trim($_POST['consignee']),
                    'region_id'     => $_POST['region_id'],
                    'region_name'   => $_POST['region_name'],
                    'address'       => trim($_POST['address']),
                    'zipcode'       => trim($_POST['zipcode']),
                    'phone_tel'     => trim($_POST['phone_tel']),
                    'phone_mob'     => trim($_POST['phone_mob']),
                );
                $model_address =& m('address');
                $model_address->add($data);
            }
            /* �µ���ɺ�������Ʒ������չ��ﳵ�����Ź�������״̬תΪ���µ�֮��� */
            $this->_clear_goods($order_id);
			
            /* �����ʼ� */
            $model_order =& m('order');

            /* ��ȥ��Ʒ��� */
            $model_order->change_stock('-', $order_id);
			
			 /* ��ȡ������Ϣ */
            $order_info = $model_order->get($order_id);
			
			/*       ������˶�������ô�۳����Ӧ��ҵĻ���      */
			$user_mod =&  m('member');
			$int = $user_info[integral] - $order_info[int_amount];
			
			$data = array('integral' => $int);
			if($user_info['user_id'] != ""){
				$user_mod->edit($user_info['user_id'], $data);
			}
			
			/*       ������˶�������ô�������Ӧ���ҵĻ���      */
			$seller =$user_mod->get_info($order_info['seller_id']);
			if($seller != ''){
				$int = $seller[integral] + $order_info[int_amount];
				$data = array('integral' => $int);
				if($seller['user_id'] != ""){
					$user_mod->edit($seller['user_id'], $data);
				}
			}
			
			/*       ������˶��������ּ�¼��������һ��      */
			$recode_mod =& m('recode');
			$data = array(
				  'touser' => $seller['user_name'],
				'fromuser' => $user_info['user_name'],
				'integral' => $order_info['int_amount'],
				    'time' => $order_info['add_time'],
				 'content' => '�¶���'.$order_info['order_sn']
			);
			$recode_mod->add($data);
			
			
			/* �����¼� */
            $feed_images = array();
            foreach ($goods_info['items'] as $_gi)
            {
                $feed_images[] = array(
                    'url'   => SITE_URL . '/' . $_gi['goods_image'],
                    'link'  => SITE_URL . '/' . url('app=goods&id=' . $_gi['goods_id']),
                );
            }
            $this->send_feed('order_created', array(
                'user_id'   => $this->visitor->get('user_id'),
                'user_name' => addslashes($this->visitor->get('user_name')),
                'seller_id' => $order_info['seller_id'],
                'seller_name' => $order_info['seller_name'],
                'store_url' => SITE_URL . '/' . url('app=store&id=' . $order_info['seller_id']),
                'images'    => $feed_images,
            ));

            $buyer_address = $this->visitor->get('email');
            $model_member =& m('member');
            $member_info  = $model_member->get($goods_info['store_id']);
            $seller_address= $member_info['email'];

            /* ���͸�����µ�֪ͨ */
            $buyer_mail = get_mail('tobuyer_new_order_notify', array('order' => $order_info));
            $this->_mailto($buyer_address, addslashes($buyer_mail['subject']), addslashes($buyer_mail['message']));

            /* ���͸������¶���֪ͨ */
            $seller_mail = get_mail('toseller_new_order_notify', array('order' => $order_info));
            $this->_mailto($seller_address, addslashes($seller_mail['subject']), addslashes($seller_mail['message']));

            /* �����µ����� */
            $model_goodsstatistics =& m('goodsstatistics');
            $goods_ids = array();
            foreach ($goods_info['items'] as $goods)
            {
                $goods_ids[] = $goods['goods_id'];
            }
            $model_goodsstatistics->edit($goods_ids, 'orders=orders+1');
			
			

            /* ������̨���� */
            header('Location:index.php?app=cashier&order_id=' . $order_id);
        }
    }

    /**
     *    ��ȡ�ⲿ���ݹ�������Ʒ
     *
     *    @author    Garbin
     *    @param    none
     *    @return    void
     */
    function _get_goods_info()
    {
        $return = array(
            'items'     =>  array(),    //��Ʒ�б�
            'quantity'  =>  0,          //��Ʒ����
            'amount'    =>  0,          //��Ʒ�ܼ�
		   'int_amount' =>  0,			//��Ʒ����
            'store_id'  =>  0,          //��������
            'store_name'=>  '',         //��������
            'type'      =>  null,       //��Ʒ����
            'otype'     =>  'normal',   //��������
            'allow_coupon'  => true,    //�Ƿ�����ʹ���Ż�ȯ
        );
        switch ($_GET['goods'])
        {
            case 'groupbuy':
                /* �Ź�����Ʒ */
                $group_id = isset($_GET['group_id']) ? intval($_GET['group_id']) : 0;
                $user_id  = $this->visitor->get('user_id');
                if (!$group_id || !$user_id)
                {
                    return false;
                }
                /* ��ȡ�Ź���¼��ϸ��Ϣ */
                $model_groupbuy =& m('groupbuy');
                $groupbuy_info = $model_groupbuy->get(array(
                    'join'  => 'be_join, belong_store, belong_goods',
                    'conditions'    => $model_groupbuy->getRealFields("groupbuy_log.user_id={$user_id} AND groupbuy_log.group_id={$group_id} AND groupbuy_log.order_id=0 AND this.state=" . GROUP_FINISHED),
                    'fields'    => 'store.store_id, store.store_name, goods.goods_id, goods.goods_name, goods.default_image, groupbuy_log.quantity, groupbuy_log.spec_quantity, this.spec_price',
                ));

                if (empty($groupbuy_info))
                {
                    return false;
                }

                /* �����Ϣ */
                $model_goodsspec = &m('goodsspec');
                $goodsspec = $model_goodsspec->find('goods_id='. $groupbuy_info['goods_id']);

                /* ��ȡ��Ʒ��Ϣ */
                $spec_quantity = unserialize($groupbuy_info['spec_quantity']);
                $spec_price    = unserialize($groupbuy_info['spec_price']);
                $amount = 0;
                $groupbuy_items = array();
                $goods_image = empty($groupbuy_info['default_image']) ? Conf::get('default_goods_image') : $groupbuy_info['default_image'];
                foreach ($spec_quantity as $spec_id => $spec_info)
                {
                    $the_price = $spec_price[$spec_id]['price'];
                    $subtotal = $spec_info['qty'] * $the_price;
                    $groupbuy_items[] = array(
                        'goods_id'  => $groupbuy_info['goods_id'],
                        'goods_name'  => $groupbuy_info['goods_name'],
                        'spec_id'  => $spec_id,
                        'specification'  => $spec_info['spec'],
                        'price'  => $the_price,
                        'quantity'  => $spec_info['qty'],
                        'goods_image'  => $goods_image,
                        'subtotal'  => $subtotal,
                        'stock' => $goodsspec[$spec_id]['stock'],
                    );
                    $amount += $subtotal;
                }

                $return['items']        =   $groupbuy_items;
                $return['quantity']     =   $groupbuy_info['quantity'];
                $return['amount']       =   $amount;
                $return['store_id']     =   $groupbuy_info['store_id'];
                $return['store_name']   =   $groupbuy_info['store_name'];
                $return['type']         =   'material';
                $return['otype']        =   'groupbuy';
                $return['allow_coupon'] =   false;
            break;
            default:
                /* �ӹ��ﳵ��ȡ��Ʒ */
                $_GET['store_id'] = isset($_GET['store_id']) ? intval($_GET['store_id']) : 0;
                $store_id = $_GET['store_id'];
                if (!$store_id)
                {
                    return false;
                }


                $cart_model =& m('cart');

                $cart_items      =  $cart_model->find(array(
                    'conditions' => "user_id = " . $this->visitor->get('user_id') . " AND store_id = {$store_id} AND session_id='" . SESS_ID . "'",
                    'join'       => 'belongs_to_goodsspec',
                ));
                if (empty($cart_items))
                {
                    return false;
                }


                $store_model =& m('store');
                $store_info = $store_model->get($store_id);

                foreach ($cart_items as $rec_id => $goods)
                {
                    $return['quantity'] += $goods['quantity'];                      //��Ʒ����
                    $return['amount']   += $goods['quantity'] * $goods['price'];    //��Ʒ�ܼ�
					$return['int_amount'] += $goods['quantity'] * $goods['integral'];
                    $cart_items[$rec_id]['subtotal']    =   $goods['quantity'] * $goods['price'];   //С��
					
                    empty($goods['goods_image']) && $cart_items[$rec_id]['goods_image'] = Conf::get('default_goods_image');
                }

                $return['items']        =   $cart_items;
                $return['store_id']     =   $store_id;
                $return['store_name']   =   $store_info['store_name'];
                $return['type']         =   'material';
                $return['otype']        =   'normal';
            break;
        }

        return $return;
    }

    /**
     *    �µ���ɺ�������Ʒ
     *
     *    @author    Garbin
     *    @return    void
     */
    function _clear_goods($order_id)
    {
        switch ($_GET['goods'])
        {
            case 'groupbuy':
                /* �Ź�����Ʒ */
                $model_groupbuy =& m('groupbuy');
                $model_groupbuy->updateRelation('be_join', intval($_GET['group_id']), $this->visitor->get('user_id'), array(
                    'order_id'  => $order_id,
                ));
            break;
            default://���ﳵ�е���Ʒ
                /* ������������ָ�����ﳵ */
                $_GET['store_id'] = isset($_GET['store_id']) ? intval($_GET['store_id']) : 0;
                $store_id = $_GET['store_id'];
                if (!$store_id)
                {
                    return false;
                }
                $model_cart =& m('cart');
                $model_cart->drop("store_id = {$store_id} AND session_id='" . SESS_ID . "'");
                //�Ż�ȯ��Ϣ����
                if (isset($_POST['coupon_sn']) && !empty($_POST['coupon_sn']))
                {
                    $sn = trim($_POST['coupon_sn']);
                    $couponsn_mod =& m('couponsn');
                    $couponsn = $couponsn_mod->get("coupon_sn = '{$sn}'");
                    if ($couponsn['remain_times'] > 0)
                    {
                        $couponsn_mod->edit("coupon_sn = '{$sn}'", "remain_times= remain_times - 1");
                    }
                }
            break;
        }
    }
    /**
     * ����Ż�ȯ��Ч��
     */
    function check_coupon()
    {
        $coupon_sn = $_GET['coupon_sn'];
        $store_id = is_numeric($_GET['store_id']) ? $_GET['store_id'] : 0;
        if (empty($coupon_sn))
        {
            $this->js_result(false);
        }
        $coupon_mod =& m('couponsn');
        $coupon = $coupon_mod->get(array(
            'fields' => 'coupon.*,couponsn.remain_times',
            'conditions' => "coupon_sn.coupon_sn = '{$coupon_sn}' AND coupon.store_id = " . $store_id,
            'join'  => 'belongs_to_coupon'));
        if (empty($coupon))
        {
            $this->json_result(false);
            exit;
        }
        if ($coupon['remain_times'] < 1)
        {
            $this->json_result(false);
            exit;
        }
        $time = gmtime();
        if ($coupon['start_time'] > $time)
        {
            $this->json_result(false);
            exit;
        }


        if ($coupon['end_time'] < $time)
        {
            $this->json_result(false);
            exit;
        }

        // �����Ʒ�۸����Ż�ȯҪ��ļ۸�

        $model_cart =& m('cart');
        $item_info  = $model_cart->find("store_id={$store_id} AND session_id='" . SESS_ID . "'");
        $price = 0;
        foreach ($item_info as $val)
        {
            $price = $price + $val['price'] * $val['quantity'];
        }
        if ($price < $coupon['min_amount'])
        {
            $this->json_result(false);
            exit;
        }
        $this->json_result(array('res' => true, 'price' => $coupon['coupon_value']));
        exit;

    }

    function _check_beyond_stock($goods_items)
    {
        $goods_beyond_stock = array();
        foreach ($goods_items as $rec_id => $goods)
        {
            if ($goods['quantity'] > $goods['stock'])
            {
                $goods_beyond_stock[$goods['spec_id']] = $goods;
            }
        }
        return $goods_beyond_stock;
    }
}
?>
