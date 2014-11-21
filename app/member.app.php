<?php

/**
 *    Desc
 *
 *    @author    Garbin
 *    @usage    none
 */
class MemberApp extends MemberbaseApp
{
    var $_feed_enabled = false;
    function __construct()
    {
        $this->MemberApp();
    }
    function MemberApp()
    {
        parent::__construct();
        $ms =& ms();
        $this->_feed_enabled = $ms->feed->feed_enabled();
        $this->assign('feed_enabled', $this->_feed_enabled);
    }
    function index()
    {
		/* ����¶���Ϣ���� */
        $cache_server =& cache_server();
        $cache_server->delete('new_pm_of_user_' . $this->visitor->get('user_id'));

        $user = $this->visitor->get();
		$user_mod =& m('member');
        $user_info = $user_mod->get_info($user['user_id']);
        $this->assign('user', $user);
	
		//��Աʹ������
		$time = $user_info['use_time'] - gmtime();
		$time = round($time/3600/24);
		
		//����
		$deposit = $user_info['deposit'];
		$sql = "select * FROM {$user_mod->table} WHERE user_name = '$deposit'";
		$deposit_user = $user_mod->getRow($sql);
		if($deposit_user != ""){
					$sql = "select * FROM {$user_mod->table} WHERE user_name = '$user_info[fxs]'";
					$fxs = $user_mod->getRow($sql);
					$sql = "select * FROM {$user_mod->table} WHERE user_name = '$user_info[dls]'";
					$dls = $user_mod->getRow($sql);
					$this->assign('fxs', $fxs);
					$this->assign('dls', $dls);
					$this->assign('deposit_user', $deposit_user);
		}
		
		
		//��������
		$order_mod =& m('order');
		$sql = "SELECT COUNT(*) FROM {$order_mod->table} where buyer_id = ".$user['user_id'];
		$order_num = $order_mod->getOne($sql);
		
		$this->assign('time', $time);
		$this->assign('user_info', $user_info);
		$this->assign('order_num', $order_num);
		
		/* �������úͺ����� */
        if ($user['has_store'])
        {
            $store_mod =& m('store');
            $store = $store_mod->get_info($user['has_store']);
            $step = intval(Conf::get('upgrade_required'));
            $step < 1 && $step = 5;
            $store['credit_image'] = $this->_view->res_base . '/images/' . $store_mod->compute_credit($store['credit_value'], $step);
            $this->assign('store', $store);
            $this->assign('store_closed', STORE_CLOSED);
        }
        $goodsqa_mod = & m('goodsqa');
        $groupbuy_mod = & m('groupbuy');
        /* ������ѣ��������ȷ�ϡ������۶����� */
        $order_mod =& m('order');
        $sql1 = "SELECT COUNT(*) FROM {$order_mod->table} WHERE buyer_id = '{$user['user_id']}' AND status = '" . ORDER_PENDING . "'";
        $sql2 = "SELECT COUNT(*) FROM {$order_mod->table} WHERE buyer_id = '{$user['user_id']}' AND status = '" . ORDER_SHIPPED . "'";
        $sql3 = "SELECT COUNT(*) FROM {$order_mod->table} WHERE buyer_id = '{$user['user_id']}' AND status = '" . ORDER_FINISHED . "' AND evaluation_status = 0";
        $sql4 = "SELECT COUNT(*) FROM {$goodsqa_mod->table} WHERE user_id = '{$user['user_id']}' AND reply_content !='' AND if_new = '1' ";
        $sql5 = "SELECT COUNT(*) FROM " . DB_PREFIX ."groupbuy_log AS log LEFT JOIN {$groupbuy_mod->table} AS gb ON gb.group_id = log.group_id WHERE log.user_id='{$user['user_id']}' AND gb.state = " .GROUP_CANCELED;
        $sql6 = "SELECT COUNT(*) FROM " . DB_PREFIX ."groupbuy_log AS log LEFT JOIN {$groupbuy_mod->table} AS gb ON gb.group_id = log.group_id WHERE log.user_id='{$user['user_id']}' AND gb.state = " .GROUP_FINISHED;
        $buyer_stat = array(
            'pending'  => $order_mod->getOne($sql1),
            'shipped'  => $order_mod->getOne($sql2),
            'finished' => $order_mod->getOne($sql3),
            'my_question' => $goodsqa_mod->getOne($sql4),
            'groupbuy_canceled' => $groupbuy_mod->getOne($sql5),
            'groupbuy_finished' => $groupbuy_mod->getOne($sql6),
        );
        $sum = array_sum($buyer_stat);
        $buyer_stat['sum'] = $sum;
        $this->assign('buyer_stat', $buyer_stat);

        /* �������ѣ����������ʹ��������� */
        if ($user['has_store'])
        {

            $sql7 = "SELECT COUNT(*) FROM {$order_mod->table} WHERE seller_id = '{$user['user_id']}' AND status = '" . ORDER_SUBMITTED . "'";
            $sql8 = "SELECT COUNT(*) FROM {$order_mod->table} WHERE seller_id = '{$user['user_id']}' AND status = '" . ORDER_ACCEPTED . "'";
            $sql9 = "SELECT COUNT(*) FROM {$goodsqa_mod->table} WHERE store_id = '{$user['user_id']}' AND reply_content ='' ";
            $sql10 = "SELECT COUNT(*) FROM {$groupbuy_mod->table} WHERE store_id='{$user['user_id']}' AND state = " .GROUP_END;
            $seller_stat = array(
                'submitted' => $order_mod->getOne($sql7),
                'accepted'  => $order_mod->getOne($sql8),
                'replied'   => $goodsqa_mod->getOne($sql9),
                'groupbuy_end'   => $goodsqa_mod->getOne($sql10),
            );

            $this->assign('seller_stat', $seller_stat);
        }
        /* �������ѣ� ���̵ȼ�����Ч�ڡ���Ʒ�����ռ� */
        if ($user['has_store'])
        {
            $store_mod =& m('store');
            $store = $store_mod->get_info($user['has_store']);

            $grade_mod = & m('sgrade');
            $grade = $grade_mod->get_info($store['sgrade']);

            $goods_mod = &m('goods');
            $goods_num = $goods_mod->get_count_of_store($user['has_store']);
            $uploadedfile_mod = &m('uploadedfile');
            $space_num = $uploadedfile_mod->get_file_size($user['has_store']);
            $sgrade = array(
                'grade_name' => $grade['grade_name'],
                'add_time' => empty($store['end_time']) ? 0 : sprintf('%.2f', ($store['end_time'] - gmtime())/86400),
                'goods' => array(
                    'used' => $goods_num,
                    'total' => $grade['goods_limit']),
                'space' => array(
                    'used' => sprintf("%.2f", floatval($space_num)/(1024 * 1024)),
                    'total' => $grade['space_limit']),
                    );
            $this->assign('sgrade', $sgrade);

        }

        /* ��������� */
        if ($user['state'] != '' && $user['state'] == STORE_APPLYING)
        {
            $this->assign('applying', 1);
        }
        /* ��ǰλ�� */
        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
                         LANG::get('overview'));

        /* ��ǰ�û����Ĳ˵� */
		
		
        $this->_curitem('overview');
        $this->_config_seo('title', Lang::get('member_center'));
        $this->display('member.index.html');
    }

    /**
     *    ע��һ�����û�
     *
     *    @author    Garbin
     *    @return    void
     */
    function register()
    {
        if ($this->visitor->has_login)
        {
            $this->show_warning('has_login');

            return;
        }
        if (!IS_POST)
        {
            if (!empty($_GET['ret_url']))
            {
                $ret_url = trim($_GET['ret_url']);
            }
            else
            {
                if (isset($_SERVER['HTTP_REFERER']))
                {
                    $ret_url = $_SERVER['HTTP_REFERER'];
                }
                else
                {
                    $ret_url = SITE_URL . '/index.php';
                }
            }
			if(!empty($_GET['tid'])){
				$user_mod =& m('member');
				$sql = "SELECT user_name FROM {$user_mod->table} WHERE user_id = '$_GET[tid]'";
				$deposit = $user_mod->getRow($sql);
				$this->assign('deposit', $deposit);
				
			}
            $this->assign('ret_url', rawurlencode($ret_url));
            $this->_curlocal(LANG::get('user_register'));
            $this->_config_seo('title', Lang::get('user_register') . ' - ' . Conf::get('site_title'));

            if (Conf::get('captcha_status.register'))
            {
                $this->assign('captcha', 1);
            }

            /* ����jQuery�ı���֤��� */
			
            $this->import_resource('jquery.plugins/jquery.validate.js');
            $this->display('member.register.html');
        }
        else
        {
            if (!$_POST['agree'])
            {
                $this->show_warning('agree_first');

                return;
            }
            if (Conf::get('captcha_status.register') && base64_decode($_SESSION['captcha']) != strtolower($_POST['captcha']))
            {
                $this->show_warning('captcha_failed');
                return;
            }
            if ($_POST['password'] != $_POST['password_confirm'])
            {
                /* ������������벻һ�� */
                $this->show_warning('inconsistent_password');
                return;
            }

            /* ע�Ტ��½ */
            $user_name = trim($_POST['user_name']);
            $password  = $_POST['password'];
            $email     = trim($_POST['email']);
			$tel       = $_POST['im_msn'];
			$deposit   = trim($_POST['deposit']);
            $passlen   = strlen($password);
            $user_name_len = strlen($user_name);
			$sfz = $_POST['sfz'];
			
			
			//�ж����֤Ψһ
			$user_mod =& m('member');
			$sql = "SELECT COUNT(*) FROM {$user_mod->table} WHERE sfz = '$sfz'";
			$num = $user_mod->getOne($sql);
		
			if( $num >= 1){
				 $this->show_warning('һ�����ֻ֤��ע��һ���˺ţ�');
				 return;
			}
			
			//�жϱ��
            if ($user_name_len < 3 || $user_name_len > 25)
            {
                $this->show_warning('user_name_length_error');

                return;
            }
            if ($passlen < 6 || $passlen > 20)
            {
                $this->show_warning('password_length_error');

                return;
            }
            if (!is_email($email))
            {
                $this->show_warning('email_error');

                return;
            }

            $ms =& ms(); //�����û�����
			
            $user_id = $ms->user->register($user_name, $password, $email, $tel, $deposit, $sfz);

            if (!$user_id)
            {
                $this->show_warning($ms->user->get_error());

                return;
            }
            $this->_hook('after_register', array('user_id' => $user_id));
            //��¼
            $this->_do_login($user_id);
            
            /* ͬ����½�ⲿϵͳ */
            $synlogin = $ms->user->synlogin($user_id);

            #TODO ���ܻ��ᷢ�ͻ�ӭ�ʼ�
			$userinfo = $user_mod->get_info($user_id);
			$subject = "�������û���Ϣ��";
			//���Ƽ��˷���Ϣ
			$sql = "SELECT user_id FROM {$user_mod->table} WHERE user_name = '$userinfo[deposit]'";
			$deposit_id = $user_mod->getRow($sql);
			if($deposit_id != ''){
				$name = $userinfo['deposit'];
				$content = get_msg('touser_userinfo', array('user_name' => $userinfo['user_name'], 'tel' => $userinfo['im_msn'], 'name' => $name));
				$ms->pm->send(MSG_SYSTEM, $deposit_id['user_id'], '', $content);
			}
			//�������̷���Ϣ
			$sql = "SELECT user_id FROM {$user_mod->table} WHERE user_name = '$userinfo[fxs]'";
			$fxs_id = $user_mod->getRow($sql);
			if($fxs_id != ''){
				if( $fxs_id != $deposit_id){
					$name = $userinfo['fxs'];
					$content = get_msg('touser_userinfo', array('user_name' => $userinfo['user_name'], 'tel' => $userinfo['im_msn'], 'name' => $name));
					$ms->pm->send(MSG_SYSTEM, $fxs_id['user_id'], '', $content);
				}
			}
			//�������̷���Ϣ
			$sql = "SELECT user_id FROM {$user_mod->table} WHERE user_name = '$userinfo[dls]'";
			$dls_id = $user_mod->getRow($sql);
			if($dls_id != ''){
				if($dls_id != $deposit_id){
					$name = $userinfo['dls'];
					$content = get_msg('touser_userinfo', array('user_name' => $userinfo['user_name'], 'tel' => $userinfo['im_msn'], 'name' => $name));
					$ms->pm->send(MSG_SYSTEM, $dls_id['user_id'], '', $content);
				}
			}
			
			
			
            $this->show_message(Lang::get('register_successed') . $synlogin,
                'back_before_register', rawurldecode($_POST['ret_url']),
                'enter_member_center', 'index.php?app=member',
                'apply_store', 'index.php?app=apply'
            );
        }
    }


    /**
     *    ����û��Ƿ����
     *
     *    @author    Garbin
     *    @return    void
     */
    function check_user()
    {
        $user_name = empty($_GET['user_name']) ? null : trim($_GET['user_name']);
        if (!$user_name)
        {
            echo ecm_json_encode(false);

            return;
        }
        $ms =& ms();
		
        echo ecm_json_encode($ms->user->check_username($user_name));
    }
	
	 function check_deposit()
    {
		$user_name = empty($_GET['deposit']) ? null : trim($_GET['deposit']);
        if (!$user_name)
        {
            echo ecm_json_encode(false);

            return;
        }
        $user_mod =& m('member');
		$sql = "SELECT COUNT(*) FROM {$user_mod->table} WHERE `user_name` = '$user_name'";
		$num = $user_mod->getOne($sql);
			
		if($num == 0){
			echo ecm_json_encode(false);
		}
		else{
			echo ecm_json_encode(true);
		}
    }
	
	
	
	 /**
     *    ��Ҫת��
     *
     *    @author    tianwei
     *    @return    void
     */
	
	 function money_to()
    {
		
		
		$user = $this->visitor->get();
        $user_mod =& m('member');
		$user_info = $user_mod->get_info($user['user_id']);
      	$this->assign('user', $user);
		$this->assign('user_info', $user_info);
		
		
        /* ��ǰλ�� */
        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
                         LANG::get('��Ҫת��'));

        /* ��ǰ�û����Ĳ˵� */
		$this->_curmenu('my_money');
        $this->_curitem('money_to');
		
       
        $this->_config_seo('title', Lang::get('member_center'));
        $this->display('money_to.html');
		
	}
	
	/**
     *    ת�˲���
     *
     *    @author    tianwei
     *    @return    void
     */
	function money_toDo()
    {
		$user = $this->visitor->get();
        $user_mod =& m('member');
        $user_info = $user_mod->get_info($user['user_id']);
        
       	$money = $_POST['money'];
		$member = $_POST['user'];
		$password = $_POST['password'];
		
		if($user_info['user_name'] == $member){
			$this->show_warning("����ת�ʸ��Լ���");
			return;
		}
		
		$sql = "SELECT COUNT(*) FROM {$user_mod->table} where user_name  = '$member'";
		$num = $user_mod->getOne($sql);
		
		if($user_info['password'] != md5($password)){
			$this->show_warning('�������');
			return;
		}
		elseif($num == 0){
			$this->show_warning('û������û�');
			return;
		}
		elseif($money > $user_info['money']){
			$this->show_warning('���㣬�޷�ת��');
			return;
		}
		else{
			$sql = "SELECT * FROM {$user_mod->table} where user_name  = '$member'";
			$cm = $user_mod->getRow($sql);
			if($cm != ''){
				$inta = $cm['money'] + $money; 
				$intb = $user_info['money'] - $money;
				
				$data = array('money' => $inta);
				$date = array('money' => $intb);
				$user_mod->edit($cm['user_id'], $data);
				$user_mod->edit($user_info['user_id'], $date);
			
				$recode_mod =& m('money_recode');
				$data = array(
					  'touser' => $member,
					'fromuser' => $user_info['user_name'],
					   'money' => $money,
						'time' => gmtime()
				);
				$recode_mod->add($data);
				$this->show_message('ת�ʳɹ�');
				return;
			}
			/*if($recode_mod->add($data)){
				$mail['subject'] = '���ֹ�ת���ʼ�֪ͨ';
				$mail['message'] = "�û�".$data['fromuser']."��".$data['time']."����ת����".$data['integral']."���֡�";
				$this->_mailto($data['touser'], addslashes($mail['subject']), addslashes($mail['message']));
				
				$mail['subject'] = '���ֹ�ת���ʼ�֪ͨ';
				$mail['message'] = "����".$data['time']."ת���û�".$data['touser'].$data['integral']."���֡�";
				$this->_mailto($data['touser'], addslashes($mail['subject']), addslashes($mail['message']));
				
				
				$this->show_message('ת�ֳɹ�');
				return;
			}else{ 
				$this->show_warning('ϵͳ����');
				return;
			}*/
		}
		
      
		
	}
	
	
	/**
     *    ת�˲�����¼
     *
     *    @author    tianwei
     *    @return    void
     */
	function money_recode()
    {
		$user = $this->visitor->get();
        $user_mod =& m('member');
        //��ȡ��ǰ�û���������Ϣ
		$user_info = $user_mod->get_info($user['user_id']);
		
		$recode_mod =& m('money_recode');
		$page   =   $this->_get_page(20);  //��ȡ��ҳ��Ϣ
		$recodes = $recode_mod->find(array(
			'conditions' 	=> "touser = '$user_info[user_name]' or fromuser = '$user_info[user_name]'",
            'limit'         => $page['limit'],  //��ȡ��ǰҳ������
			'order'         => 'id DESC ', //����ӱ���
            'count'         => true             //����ͳ��
        )); 
		$page['item_count'] = $recode_mod->getCount();   //��ȡͳ�Ƶ�����
		$this->_format_page($page);
		$this->assign('page_info', $page);
		$this->assign('recode', $recodes);
		
		
		 /* ��ǰλ�� */
        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
                         LANG::get('ת�˲�����¼'));

        /* ��ǰ�û����Ĳ˵� */
		$this->_curmenu('my_money');
        $this->_curitem('money_recode');
		
       
        $this->_config_seo('title', Lang::get('member_center'));
        $this->display('money_recode.html');
		
	}
	 /**
     *    ��Ҫת��
     *
     *    @author    tianwei
     *    @return    void
     */
	
	 function integral_to()
    {
		
		
		$user = $this->visitor->get();
        $user_mod =& m('member');
		$user_info = $user_mod->get_info($user['user_id']);
        $user['portrait'] = portrait($user['user_id'], $info['portrait'], 'middle');
        $this->assign('user', $user);
		$this->assign('user_info', $user_info);
		
		
        /* ��ǰλ�� */
        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
                         LANG::get('���ֲ���'));

        /* ��ǰ�û����Ĳ˵� */
		$this->_curmenu('my_integral');
        $this->_curitem('integral_to');
		
       
        $this->_config_seo('title', Lang::get('member_center'));
        $this->display('integral_to.html');
		
	}
	
	/**
     *    ת�ֲ���
     *
     *    @author    tianwei
     *    @return    void
     */
	function integral_toDo()
    {
		$user = $this->visitor->get();
        $user_mod =& m('member');
        $user_info = $user_mod->get_info($user['user_id']);
        $user['portrait'] = portrait($user['user_id'], $info['portrait'], 'middle');
       
		$int = $_POST['int'];
		$member = $_POST['user'];
		$password = $_POST['password'];
		
		if($user_info['user_name'] == $member){
			$this->show_warning("����ת�ָ��Լ���");
			return;
		}
		
		$sql = "SELECT COUNT(*) FROM {$user_mod->table} where user_name  = '$member'";
		$num = $user_mod->getOne($sql);
		
		
		if($user_info['password'] != md5($password)){
			$this->show_warning('�������');
			return;
		}
		elseif($user_info['grade'] == "��ѻ�Ա"){
			$this->show_warning('��ѻ�Ա�޷�ת�ָ�����');
			return;
		}
		elseif($num == 0){
			$this->show_warning('û������û�');
			return;
		}
		elseif($int > $user_info['integral']){
			$this->show_warning('���ֲ���');
			return;
		}
		else{
			$sql = "SELECT * FROM {$user_mod->table} where user_name  = '$member'";
			$cm = $user_mod->getRow($sql);
			
			if($cm != ''){
				$inta = $cm['integral'] + $int; 
				$intb = $user_info['integral'] - $int;
				
				$data = array('integral' => $inta);
				$date = array('integral' => $intb);
				$user_mod->edit($cm['user_id'], $data);
				$user_mod->edit($user_info['user_id'], $date);
				
				$recode_mod =& m('recode');
				$data = array(
					  'touser' => $member,
					'fromuser' => $user_info['user_name'],
					'integral' => $int,
						'time' => gmtime()
				);
				
				if($recode_mod->add($data)){
					$mail['subject'] = '���ֹ�ת���ʼ�֪ͨ';
					$mail['message'] = "�û�".$data['fromuser']."��".$data['time']."����ת����".$data['integral']."���֡�";
					$this->_mailto($data['touser'], addslashes($mail['subject']), addslashes($mail['message']));
					
					$mail['subject'] = '���ֹ�ת���ʼ�֪ͨ';
					$mail['message'] = "����".$data['time']."ת���û�".$data['touser'].$data['integral']."���֡�";
					$this->_mailto($data['touser'], addslashes($mail['subject']), addslashes($mail['message']));
					
					$this->show_message('ת�ֳɹ�');
					return;
				}
				else{ 
					$this->show_warning('ϵͳ����');
					return;
				}
			}
		}
		
      
		
	}
	
	
	
	
	/**
     *    ���ֲ�����¼
     *
     *    @author    tianwei
     *    @return    void
     */
	function integral_recode()
    {
		
		$user = $this->visitor->get();
        $user_mod =& m('member');
        //��ȡ��ǰ�û���������Ϣ
		$sql = "SELECT * FROM {$user_mod->table} where user_id = ".$user['user_id'];
		$user_info = $user_mod->getRow($sql);
		
		$recode_mod =& m('recode');
		
		$page   =   $this->_get_page(20);  //��ȡ��ҳ��Ϣ
		$recodes = $recode_mod->find(array(
			'conditions'    => "touser = '$user_info[user_name]' or fromuser = '$user_info[user_name]'",
            'limit'         => $page['limit'],  //��ȡ��ǰҳ������
			'order'         => 'id DESC ', //����ӱ���
            'count'         => true             //����ͳ��
        )); 
		$page['item_count'] = $recode_mod->getCount();   //��ȡͳ�Ƶ�����
		$this->_format_page($page);
		$this->assign('page_info', $page);
		$this->assign('recode', $recodes);
		
        /* ��ǰλ�� */
        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
                         LANG::get('���ֲ�����¼'));

        /* ��ǰ�û����Ĳ˵� */
		$this->_curmenu('my_integral');
        $this->_curitem('integral_recode');
		
       
        $this->_config_seo('title', Lang::get('member_center'));
        $this->display('integral_recode.html');
  	}
	
	/**
     *    �ҵ�ҵ��
     *
     *    @author    tianwei
     *    @return    void
     */
	function deposit()
    {
	
		
		$user = $this->visitor->get();
        $user_mod =& m('member');
        $user_info = $user_mod->get_info($user['user_id']);
        $this->assign('user', $user);
		
		$time = date('Y-m-d',gmtime());
		if(!IS_POST){
			if($user_info['grade'] == '��ѻ�Ա' || $user_info['grade'] == 'VIP��Ա' || $user_info['grade'] == '������'){
				$deposit = $user_mod->find(array(
				'conditions'    => "deposit = '$user_info[user_name]' AND `grade` != '��ѻ�Ա'",
				'order'         => 'reg_time DESC ', //����ӱ���
				));
				$total = 0;
				$total = $total + count($deposit);
				$sql = "SELECT * FROM {$user_mod->table} WHERE jjtjr != '' AND `grade` != '��ѻ�Ա'";
				$all_user = $user_mod->getAll($sql);
				$num = 0;
				foreach( $deposit as $value ){
					if( date('Y-m-d', $value['reg_time']) == date('Y-m-d',gmtime())){
						$num ++;
					}
				}
				foreach($all_user as $value){
					$arr = explode(",",$value['jjtjr']);
					if(in_array($user_info[user_name], $arr)){
						$total ++;
						if(date('Y-m-d', $value['reg_time']) == date('Y-m-d',gmtime())){	
							$num ++;
						}
					}	
				}
				$this->assign('total', $total);
				
			}
			
			if($user_info['grade'] == '������'){
				$deposit = $user_mod->find(array(
				'conditions'    => "dls = '$user_info[user_name]' AND `grade` != '��ѻ�Ա'",
				'order'         => 'reg_time DESC ', //����ӱ���
				));
				$num = 0;
				foreach( $deposit as $value ){
					if( date('Y-m-d', $value['reg_time']) == date('Y-m-d',gmtime())){
						$num ++;
					}
				}
				$this->assign('dep', count($deposit));
			}
			
			
			$this->assign('time', $time);
			$this->assign('num', $num);
			$this->_curlocal(LANG::get('member_center'), url('app=member'), LANG::get('�ҵ�ҵ��'));

			/* ��ǰ�û����Ĳ˵� */
			$this->_curmenu('my_deposit');
			$this->_curitem('my_deposit');
			
		   
			$this->_config_seo('title', Lang::get('member_center'));
			$this->display('deposit.html');
		}
		else{
		
			if($_POST['star'] > $_POST['end']){
				$this->show_warning('ʱ�������ʼʱ����ڽ���ʱ�䣡');
				return;
			}
			$star = strtotime($_POST['star']);
			$end = strtotime($_POST['end']) + (3600*24);
			if($user_info['grade'] == '��ѻ�Ա' || $user_info['grade'] == 'VIP��Ա' || $user_info['grade'] == '������'){
				$deposit = $user_mod->find(array(
				'conditions'    => "deposit = '$user_info[user_name]'  AND `grade` != '��ѻ�Ա' AND  `reg_time` > $star AND `reg_time` < $end ",
				'order'         => 'reg_time DESC ', //����ӱ���
				));
				$total = 0;
				$total = $total + count($deposit);
				$sql = "SELECT * FROM {$user_mod->table} WHERE jjtjr != ''  AND `grade` != '��ѻ�Ա' AND `reg_time` > $star AND `reg_time` < $end";
				$all_user = $user_mod->getAll($sql);
				foreach($all_user as $value){
					$arr = explode(",",$value['jjtjr']);
					if(in_array($user_info[user_name], $arr)){
						$total ++;
					}	
				}
				$this->assign('total', $total);
			}
			if($user_info['grade'] == '������'){
				$deposit = $user_mod->find(array(
				'conditions'    => "dls = '$user_info[user_name]' AND `grade` != '��ѻ�Ա' AND `reg_time` > $star AND `reg_time` < $end",
				'order'         => 'reg_time DESC ', //����ӱ���
				));
				$this->assign('dep', count($deposit));	
			}
			$this->assign('time', $time);
			$this->assign('star', $_POST['star']);
			$this->assign('end', $_POST['end']);
			
			
			$this->_curlocal(LANG::get('member_center'), url('app=member'), LANG::get('�ҵ�ҵ��'));

			/* ��ǰ�û����Ĳ˵� */
			$this->_curmenu('my_deposit');
			$this->_curitem('my_deposit');
			
		  
			$this->_config_seo('title', Lang::get('member_center'));
			$this->display('deposit.search.html');
		}
        /* ��ǰλ�� */
       
  	}
	
	/**
     *    �û�����
     *
     *    @author    tianwei
     *    @return    void
     */
	function upgrade()
    {
		$user = $this->visitor->get();
        $user_mod =& m('member');
        $user_info = $user_mod->get_info($user['user_id']);
        $user['portrait'] = portrait($user['user_id'], $info['portrait'], 'middle');
        $this->assign('user', $user);
		
		if($user_info['grade'] != '������'){
			if($user_info['grade'] == '��ѻ�Ա'){
				$this->show_warning('�ף�����ר�����������ڵȺ�������ϵ�����ǻ�Ϊ���ṩ7x24Сʱ���ķ���ף��������죡');
				return;
			}
			if($user_info['grade'] == 'VIP��Ա' || $user_info['grade'] == '������'){
				$this->show_warning('�ף����Ѿ�����ʽ�û������輤�ף��������죡');
				return;
			}
		}
		if(!IS_POST){
		}
		else{
			$name = trim($_POST['name']);
			$sta = 1;
			$sql = "SELECT * FROM  {$user_mod->table} WHERE `user_name` = '$name'";
			$cu = $user_mod->getRow($sql);
			if($cu == ''){
				$this->show_warning('û������û���');
				return;
			}
			if($cu['dls'] != $user_info['user_name']){
				$this->show_warning('���û������������г����޷��鿴��');
				return;
			}
			if($cu['grade'] != '��ѻ�Ա'){
				$this->show_warning('���û�������ѻ�Ա���޷�������');
				return;
			}
		
			
			$sql = "SELECT * FROM  {$user_mod->table} WHERE `user_name` = '$cu[fxs]'";
			$fxs = $user_mod->getRow($sql);
			$sql = "SELECT * FROM  {$user_mod->table} WHERE `user_name` = '$user_info[user_name]'";
			$dls = $user_mod->getRow($sql);
			
			
		}
	
		$this->assign('cu', $cu);
		$this->assign('fxs', $fxs);
		$this->assign('dls', $dls);
		$this->assign('sta', $sta);
		/* ��ǰ�û����Ĳ˵� */
		$this->_curlocal(LANG::get('member_center'), url('app=member'), LANG::get('�û�����'));
		$this->_curmenu('upgrade');
		$this->_curitem('upgrade');
			
		  
		$this->_config_seo('title', Lang::get('member_center'));
		$this->display('upgrade.html');
		
		
	}
	
	//��������
	function _upgrade($d, $u, $f, $user_mod, $d_int, $f_int, $u_int, $mon, $grade){
					if($f != ''){
						$fxs_int = $f['integral'] - $f_int;
						$fxs_data = array('integral' =>$fxs_int);
						$user_mod->edit($f['user_id'], $fxs_data); //�޸ķ�������Ϣ
					}
					$dls_money = $d['money'] - $mon;   //����۳������̷���
					$dls_int = $d['integral'] - $d_int;        //����۳������̻���
					$use_int = $u['integral'] - $u_int;	  //����۳��û�����
					$use_data = array('integral' =>$use_int, 'grade' => $grade);
					$dls_data = array('integral' =>$dls_int, 'money'=>$dls_money);
					$user_mod->edit($d['user_id'], $dls_data); //ִ���޸Ĵ����̻��ֺͷ��õĲ���
					$user_mod->edit($u['user_id'], $use_data);             //ִ���޸������û����ֺ͵ȼ��Ĳ���
					
					//��������Ϣ����������Ϣ��
					$uprecode_mod = & m('uprecode');
					$data = array(
					  'user_name' => $u['user_name'],
				   	  'operator'  => $d['user_name'],
					  'grade'     => $u['grade'],
					  'upgrade'   => $grade,
					  'time' 	  => gmtime()
					);
					$uprecode_mod->add($data);
	}
	//�Ҽ���Ƽ�����
	function get_myjj($u, $user_mod){
					$sql = "SELECT * FROM {$user_mod->table} WHERE jjtjr != ''";
					$jj_deposit = $user_mod->getAll($sql);
					foreach($jj_deposit as $value){
						$arr = explode(",",$value['jjtjr']);
						if(in_array($u['user_name'], $arr)){
							$myjj_deposit[] = $value;
						}			
					}
					return $myjj_deposit;
	}
	//�����û�����Ƽ����˵ķ������޸�
	function jj_fxs_edit($myjj_deposit, $u, $user_mod){
					if($myjj_deposit != ''){
						foreach($myjj_deposit as $value){
							if($value['fxs'] != ''){
								$sql = "SELECT * FROM {$user_mod->table} WHERE `user_name` = '$value[fxs]'";
								$zz_fxs = $user_mod->getRow($sql);
                                $arr = explode(",",$zz_fxs['jjtjr']);
                                if(!in_array($u['user_name'], $arr) || $zz_fxs['deposit'] != $u['user_name'] ){
                                    $user_mod->edit($value['user_id'], array('fxs' =>$u['user_name']));
                                }
							}else{
                                $user_mod->edit($value['user_id'], array('fxs' =>$u['user_name']));
                            }
						}
					}
	}
	//�����������û� ����Ƽ����˵� �����̵� �޸ķ���
	function jj_dls_edit($myjj_deposit, $u, $user_mod){
					if($myjj_deposit != ''){  
						foreach($myjj_deposit as $value){
							if($value[dls] != ''){     
								//�Ҽ���Ƽ����˵Ĵ�����
								$sql = "SELECT * FROM {$user_mod->table} WHERE `user_name` = '$value[dls]'";
								$zz_dls = $user_mod->getRow($sql);
							}
							$jjtjr = array();
							$arr = explode(",",$zz_dls['jjtjr']); 
							//����Ҽ���Ƽ����˵Ĵ���������������ˣ���ô�Ͳ�������ˣ�
							if(in_array($u['user_name'], $arr) || $zz_dls['deposit'] == $u['user_name'] ){
							}
							//����Ҽ���Ƽ����˵Ĵ����̲������������,��ô�͸����������dls,fxs,jjtjr����Ϣ
							else{
								//�Ҽ���Ƽ����˵ļ���Ƽ�����Ϣ����Ϊ �������룬�ҳ�Ϊ����Ƽ��˵Ŀ�ʼ
								$array =explode(",", $value['jjtjr']);  
								if($array != ''){
									foreach($array as $key=>$val){
										if($val == $u['user_name']){
											$mykey = $key;
										}
									}
									if($mykey != ''){
										for($i = $mykey;$i<count($array);$i++){
											$jjtjr[] = $array[$i];
										}
										if(count($jjtjr) > 1){
											$jjtjr = implode(',',$jjtjr);
										}
										else{
											$jjtjr ='';
										}
									}
									else{
										$jjtjr = '';
									}
								}
								//��ȡ�Ҽ���Ƽ����˵ķ�����
								if($value[fxs] != ''){
									$sql = "SELECT * FROM {$user_mod->table} WHERE `user_name` = '$value[fxs]'";
									$zz_fxs = $user_mod->getRow($sql);
								}
								$are = explode(",",$zz_fxs['jjtjr']);
								//����Ҽ���Ƽ����˵ķ���������������ˣ���ô����˵ķ����̱���
								if(in_array($u['user_name'], $are) || $zz_fxs['deposit'] == $u['user_name'] ){
									$dls_data = array('dls' =>$u['user_name'], 'jjtjr'=>$jjtjr);
									$user_mod->edit($value['user_id'], $dls_data);
								}
								//����Ҽ���Ƽ����˵ķ����̲�����������ˣ���ô����˵ķ����̸���Ϊ��
								else{
									$dls_data = array('dls' =>$u['user_name'], 'jjtjr'=>$jjtjr, 'fxs'=>'');
									$user_mod->edit($value['user_id'], $dls_data);
								}
							}
						}
					}
	}
	/**
     *    �û�����
     *
     *    @author    tianwei
     *    @return    void
     */
	function to_upgrade()
    {
		$id = $_POST['id'];
		$grade = $_POST['grade'];
		$money = array(880,7800,38000);
		
		$user_mod =& m('member');
        $user_info = $user_mod->get_info($id); //���������û�
		if($user_info['grade'] != '��ѻ�Ա'){
			$this->show_warning('���û�������ѻ�Ա���޷�������', '������һҳ', '/index.php?app=member&act=upgrade');
			return;
		}
		
		$sql = "SELECT * FROM  {$user_mod->table} WHERE `user_name` = '$user_info[fxs]'";
		$fxs = $user_mod->getRow($sql);
		$sql = "SELECT * FROM  {$user_mod->table} WHERE `user_name` = '$user_info[dls]'";
		$dls = $user_mod->getRow($sql);
		$time = gmtime() + (3600*24*365);
		$this->db = &db();
		
		if($grade == 0){
			if($dls['money'] < $money[0]){
				$this->show_warning('���ķ��ò��㣬�޷����������', '������һҳ', '/index.php?app=member&act=upgrade');
				return;
			}
			if($fxs == ''){
				if($user_info['integral'] >= 600 && $dls['integral'] >= 200){
					$this->_upgrade($dls, $user_info, '', $user_mod, 200, 0, 600, $money[0], 'VIP��Ա');//����
					$this->show_message('�����ɹ�', '����', '/index.php?app=member&act=upgrade' );
					return;
				}
				else{
					$this->show_warning('���ֲ��㣬�޷����������', '������һҳ', '/index.php?app=member&act=upgrade');
					return;
				}
			}
			else{
				if($user_info['integral'] >= 600 && $dls['integral'] >= 120 && $fxs['integral'] >= 80){
					$this->_upgrade($dls, $user_info, $fxs, $user_mod, 120, 80, 600, $money[0], 'VIP��Ա');//����
					$this->show_message('�����ɹ�', '����', '/index.php?app=member&act=upgrade' );
					return;
				}
				else{
					$this->show_warning('���ֲ��㣬�޷����������', '������һҳ', '/index.php?app=member&act=upgrade');
					return;
				}
			}
		}
		
		if($grade == 1){
			if($dls['money'] < $money[1]){
				$this->show_warning('���ķ��ò��㣬�޷����������', '������һҳ', '/index.php?app=member&act=upgrade');
				return;
			}
			if($fxs == ''){
				if($user_info['integral'] >= 1000 && $dls['integral'] >= 4000){
					$this->_upgrade($dls, $user_info, '', $user_mod, 4000, 0, 1000, $money[1], '������');//����
					
					//�Ƽ���Ϊ$user_info[user_name]�ķ����̸���Ϊ$user_info[user_name]
					$sql = "UPDATE {$user_mod->table} SET `fxs` = '$user_info[user_name]' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					
					//�Ҽ���Ƽ�����
					$myjj_deposit = $this->get_myjj($user_info, $user_mod);
					
					//����Ҽ���Ƽ����˵ķ����̲�����������ˣ���ô�͸����Ҽ���Ƽ����˷�����Ϊ���Լ�
					$this->jj_fxs_edit($myjj_deposit, $user_info, $user_mod);
					
					$this->show_message('�����ɹ�', '����', '/index.php?app=member&act=upgrade' );
					return;
				}
				else{
					$this->show_warning('���ֲ��㣬�޷����������', '������һҳ', '/index.php?app=member&act=upgrade');
					return;
				}
			}
			else{
				if($user_info['integral'] >= 1000 && $dls['integral'] >= 3000 && $fxs['integral'] >= 1000){
					$this->_upgrade($dls, $user_info, $fxs, $user_mod, 3000, 1000, 1000, $money[1], '������');//����
					//�Ƽ���Ϊ$user_info[user_name]�ķ����̸���Ϊ$user_info[user_name]
					$sql = "UPDATE {$user_mod->table} SET `fxs` = '$user_info[user_name]' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					
					//�Ҽ���Ƽ�����
					$myjj_deposit = $this->get_myjj($user_info, $user_mod);
					
					//����Ҽ���Ƽ����˵ķ����̲����ҵ�ֱ�ӻ��߼���Ƽ��ˣ���ô�͸����Ҽ���Ƽ����˷�����Ϊ���Լ�
					$this->jj_fxs_edit($myjj_deposit, $user_info, $user_mod);
					
					$this->show_message('�����ɹ�', '����', '/index.php?app=member&act=upgrade' );
					return;
				}
				else{
					$this->show_warning('���ֲ��㣬�޷����������', '������һҳ', '/index.php?app=member&act=upgrade');
					return;
				}
			}
		}
		
		
		if($grade == 2){
			if($dls['money'] < $money[2]){
				$this->show_warning('���ķ��ò��㣬�޷����������', '������һҳ', '/index.php?app=member&act=upgrade');
				return;
			}
			if($fxs == ''){
				if($user_info['integral'] >= 2500 && $dls['integral'] >= 17500){
					$this->_upgrade($dls, $user_info, '', $user_mod, 17500, 0, 2500, $money[2], '������');//����
					
					//�Ƽ���Ϊ$user_info[user_name]�Ĵ����̸���Ϊ$user_info[user_name]
					
					$sql = "UPDATE {$user_mod->table} SET `dls` = '$user_info[user_name]' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					$sql = "UPDATE {$user_mod->table} SET `jjtjr` = '' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					$sql = "UPDATE {$user_mod->table} SET `fxs` = '' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
				
					
					//�Ҽ���Ƽ�����
					$myjj_deposit = $this->get_myjj($user_info, $user_mod);
					
					//����Ҽ���Ƽ����˵ķ����̲����ҵ�ֱ�ӻ��߼���Ƽ��ˣ���ô�͸����Ҽ���Ƽ����˷�����Ϊ���Լ�
					$this->jj_dls_edit($myjj_deposit, $user_info, $user_mod);
					
					$this->show_message('�����ɹ�', '����', '/index.php?app=member&act=upgrade' );
					return;
				}
				else{
					$this->show_warning('���ֲ��㣬�޷����������', '������һҳ', '/index.php?app=member&act=upgrade');
					return;
				}
			}
			else{
				if($user_info['integral'] >= 2500 && $dls['integral'] >= 15000 && $fxs['integral'] >= 2500){
					$this->_upgrade($dls, $user_info, $fxs, $user_mod, 15000, 2500, 2500, $money[2], '������');//����
					
					//�Ƽ���Ϊ$user_info[user_name]�Ĵ����̸���Ϊ$user_info[user_name]
					
					$sql = "UPDATE {$user_mod->table} SET `dls` = '$user_info[user_name]' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					$sql = "UPDATE {$user_mod->table} SET `jjtjr` = '' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					$sql = "UPDATE {$user_mod->table} SET `fxs` = '' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					
					//�Ҽ���Ƽ�����
					$myjj_deposit = $this->get_myjj($user_info, $user_mod);
					
					//����Ҽ���Ƽ����˵ķ����̲����ҵ�ֱ�ӻ��߼���Ƽ��ˣ���ô�͸����Ҽ���Ƽ����˷�����Ϊ���Լ�
					$this->jj_dls_edit($myjj_deposit, $user_info, $user_mod);
					
					$this->show_message('�����ɹ�', '����', '/index.php?app=member&act=upgrade' );
					return;
				}
				else{
					$this->show_warning('���ֲ��㣬�޷����������', '������һҳ', '/index.php?app=member&act=upgrade');
					return;
				}
			}
		}
		
	}

    /**
     *    �޸Ļ�����Ϣ
     *
     *    @author    Hyber
     *    @usage    none
     */
    function profile(){

        $user_id = $this->visitor->get('user_id');
        if (!IS_POST)
        {
            /* ��ǰλ�� */
            $this->_curlocal(LANG::get('member_center'),  'index.php?app=member',
                             LANG::get('basic_information'));

            /* ��ǰ�û����Ĳ˵� */
            $this->_curitem('my_profile');

            /* ��ǰ�����Ӳ˵� */
            $this->_curmenu('basic_information');

            $ms =& ms();    //�����û�ϵͳ
            $edit_avatar = $ms->user->set_avatar($this->visitor->get('user_id')); //��ȡͷ�����÷�ʽ

            $model_user =& m('member');
            $profile    = $model_user->get_info(intval($user_id));
            $profile['portrait'] = portrait($profile['user_id'], $profile['portrait'], 'middle');
            $this->assign('profile',$profile);
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js',
            ));
            $this->assign('edit_avatar', $edit_avatar);
            $this->_config_seo('title', Lang::get('member_center') . ' - ' . Lang::get('my_profile'));
            $this->display('member.profile.html');
        }
        else
        {
            $data = array(
                'real_name' => $_POST['real_name'],
                'gender'    => $_POST['gender'],
                'birthday'  => $_POST['birthday'],
                'im_msn'    => $_POST['im_msn'],
                'im_qq'     => $_POST['im_qq'],
				'bank'      => $_POST['bank'],
            );

            if (!empty($_FILES['portrait']))
            {
                $portrait = $this->_upload_portrait($user_id);
                if ($portrait === false)
                {
                    return;
                }
                $data['portrait'] = $portrait;
            }

            $model_user =& m('member');
            $model_user->edit($user_id , $data);
            if ($model_user->has_error())
            {
                $this->show_warning($model_user->get_error());

                return;
            }

            $this->show_message('edit_profile_successed');
        }
    }
    /**
     *    �޸�����
     *
     *    @author    Hyber
     *    @usage    none
     */
    function password(){
        $user_id = $this->visitor->get('user_id');
        if (!IS_POST)
        {
            /* ��ǰλ�� */
            $this->_curlocal(LANG::get('member_center'),  'index.php?app=member',
                             LANG::get('edit_password'));

            /* ��ǰ�û����Ĳ˵� */
            $this->_curitem('my_profile');

            /* ��ǰ�����Ӳ˵� */
            $this->_curmenu('edit_password');
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js',
            ));
            $this->_config_seo('title', Lang::get('user_center') . ' - ' . Lang::get('edit_password'));
            $this->display('member.password.html');
        }
        else
        {
            /* �����������������ͬ */
            $orig_password      = $_POST['orig_password'];
            $new_password       = $_POST['new_password'];
            $confirm_password   = $_POST['confirm_password'];
            if ($new_password != $confirm_password)
            {
                $this->show_warning('twice_pass_not_match');

                return;
            }
            if (!$new_password)
            {
                $this->show_warning('no_new_pass');

                return;
            }
            $passlen = strlen($new_password);
            if ($passlen < 6 || $passlen > 20)
            {
                $this->show_warning('password_length_error');

                return;
            }

            /* �޸����� */
            $ms =& ms();    //�����û�ϵͳ
            $result = $ms->user->edit($this->visitor->get('user_id'), $orig_password, array(
                'password'  => $new_password
            ));
            if (!$result)
            {
                /* �޸Ĳ��ɹ�����ʾԭ�� */
                $this->show_warning($ms->user->get_error());

                return;
            }

            $this->show_message('edit_password_successed');
        }
    }
    /**
     *    �޸ĵ�������
     *
     *    @author    Hyber
     *    @usage    none
     */
    function email(){
        $user_id = $this->visitor->get('user_id');
        if (!IS_POST)
        {
            /* ��ǰλ�� */
            $this->_curlocal(LANG::get('member_center'),  'index.php?app=member',
                             LANG::get('edit_email'));

            /* ��ǰ�û����Ĳ˵� */
            $this->_curitem('my_profile');

            /* ��ǰ�����Ӳ˵� */
            $this->_curmenu('edit_email');
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js',
            ));
            $this->_config_seo('title', Lang::get('user_center') . ' - ' . Lang::get('edit_email'));
            $this->display('member.email.html');
        }
        else
        {
            $orig_password  = $_POST['orig_password'];
            $email          = isset($_POST['email']) ? trim($_POST['email']) : '';
            if (!$email)
            {
                $this->show_warning('email_required');

                return;
            }
            if (!is_email($email))
            {
                $this->show_warning('email_error');

                return;
            }

            $ms =& ms();    //�����û�ϵͳ
            $result = $ms->user->edit($this->visitor->get('user_id'), $orig_password, array(
                'email' => $email
            ));
            if (!$result)
            {
                $this->show_warning($ms->user->get_error());

                return;
            }

            $this->show_message('edit_email_successed');
        }
    }

    /**
     * Feed����
     *
     * @author Garbin
     * @param
     * @return void
     **/
    function feed_settings()
    {
        if (!$this->_feed_enabled)
        {
            $this->show_warning('feed_disabled');
            return;
        }
        if (!IS_POST)
        {
            /* ��ǰλ�� */
            $this->_curlocal(LANG::get('member_center'),  'index.php?app=member',
                             LANG::get('feed_settings'));

            /* ��ǰ�û����Ĳ˵� */
            $this->_curitem('my_profile');

            /* ��ǰ�����Ӳ˵� */
            $this->_curmenu('feed_settings');
            $this->_config_seo('title', Lang::get('user_center') . ' - ' . Lang::get('feed_settings'));

            $user_feed_config = $this->visitor->get('feed_config');
            $default_feed_config = Conf::get('default_feed_config');
            $feed_config = !$user_feed_config ? $default_feed_config : unserialize($user_feed_config);

            $buyer_feed_items = array(
                'store_created' => Lang::get('feed_store_created.name'),
                'order_created' => Lang::get('feed_order_created.name'),
                'goods_collected' => Lang::get('feed_goods_collected.name'),
                'store_collected' => Lang::get('feed_store_collected.name'),
                'goods_evaluated' => Lang::get('feed_goods_evaluated.name'),
                'groupbuy_joined' => Lang::get('feed_groupbuy_joined.name')
            );
            $seller_feed_items = array(
                'goods_created' => Lang::get('feed_goods_created.name'),
                'groupbuy_created' => Lang::get('feed_groupbuy_created.name'),
            );
            $feed_items = $buyer_feed_items;
            if ($this->visitor->get('manage_store'))
            {
                $feed_items = array_merge($feed_items, $seller_feed_items);
            }
            $this->assign('feed_items', $feed_items);
            $this->assign('feed_config', $feed_config);
            $this->display('member.feed_settings.html');
        }
        else
        {
            $feed_settings = serialize($_POST['feed_config']);
            $m_member = &m('member');
            $m_member->edit($this->visitor->get('user_id'), array(
                'feed_config' => $feed_settings,
            ));
            $this->show_message('feed_settings_successfully');
        }
    }

     /**
     *    �����˵�
     *
     *    @author    Hyber
     *    @return    void
     */
    function _get_member_submenu()
    {
        $submenus =  array(
            array(
                'name'  => 'basic_information',
                'url'   => 'index.php?app=member&amp;act=profile',
            ),
            array(
                'name'  => 'edit_password',
                'url'   => 'index.php?app=member&amp;act=password',
            ),
            array(
                'name'  => 'edit_email',
                'url'   => 'index.php?app=member&amp;act=email',
            ),
        );
        if ($this->_feed_enabled)
        {
            $submenus[] = array(
                'name'  => 'feed_settings',
                'url'   => 'index.php?app=member&amp;act=feed_settings',
            );
        }

        return $submenus;
    }

    /**
     * �ϴ�ͷ��
     *
     * @param int $user_id
     * @return mix false��ʾ�ϴ�ʧ��,�մ���ʾû���ϴ�,string��ʾ�ϴ��ļ���ַ
     */
    function _upload_portrait($user_id)
    {
        $file = $_FILES['portrait'];
        if ($file['error'] != UPLOAD_ERR_OK)
        {
            return '';
        }
        import('uploader.lib');
        $uploader = new Uploader();
        $uploader->allowed_type(IMAGE_FILE_TYPE);
        $uploader->addFile($file);
        if ($uploader->file_info() === false)
        {
            $this->show_warning($uploader->get_error(), 'go_back', 'index.php?app=member&amp;act=profile');
            return false;
        }
        $uploader->root_dir(ROOT_PATH);
        return $uploader->save('data/files/mall/portrait/' . ceil($user_id / 500), $user_id);
    }
}

?>
