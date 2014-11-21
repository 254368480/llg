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
		/* 清除新短消息缓存 */
        $cache_server =& cache_server();
        $cache_server->delete('new_pm_of_user_' . $this->visitor->get('user_id'));

        $user = $this->visitor->get();
		$user_mod =& m('member');
        $user_info = $user_mod->get_info($user['user_id']);
        $this->assign('user', $user);
	
		//会员使用日期
		$time = $user_info['use_time'] - gmtime();
		$time = round($time/3600/24);
		
		//上线
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
		
		
		//订单条数
		$order_mod =& m('order');
		$sql = "SELECT COUNT(*) FROM {$order_mod->table} where buyer_id = ".$user['user_id'];
		$order_num = $order_mod->getOne($sql);
		
		$this->assign('time', $time);
		$this->assign('user_info', $user_info);
		$this->assign('order_num', $order_num);
		
		/* 店铺信用和好评率 */
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
        /* 买家提醒：待付款、待确认、待评价订单数 */
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

        /* 卖家提醒：待处理订单和待发货订单 */
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
        /* 卖家提醒： 店铺等级、有效期、商品数、空间 */
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

        /* 待审核提醒 */
        if ($user['state'] != '' && $user['state'] == STORE_APPLYING)
        {
            $this->assign('applying', 1);
        }
        /* 当前位置 */
        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
                         LANG::get('overview'));

        /* 当前用户中心菜单 */
		
		
        $this->_curitem('overview');
        $this->_config_seo('title', Lang::get('member_center'));
        $this->display('member.index.html');
    }

    /**
     *    注册一个新用户
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

            /* 导入jQuery的表单验证插件 */
			
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
                /* 两次输入的密码不一致 */
                $this->show_warning('inconsistent_password');
                return;
            }

            /* 注册并登陆 */
            $user_name = trim($_POST['user_name']);
            $password  = $_POST['password'];
            $email     = trim($_POST['email']);
			$tel       = $_POST['im_msn'];
			$deposit   = trim($_POST['deposit']);
            $passlen   = strlen($password);
            $user_name_len = strlen($user_name);
			$sfz = $_POST['sfz'];
			
			
			//判断身份证唯一
			$user_mod =& m('member');
			$sql = "SELECT COUNT(*) FROM {$user_mod->table} WHERE sfz = '$sfz'";
			$num = $user_mod->getOne($sql);
		
			if( $num >= 1){
				 $this->show_warning('一个身份证只能注册一个账号！');
				 return;
			}
			
			//判断表格
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

            $ms =& ms(); //连接用户中心
			
            $user_id = $ms->user->register($user_name, $password, $email, $tel, $deposit, $sfz);

            if (!$user_id)
            {
                $this->show_warning($ms->user->get_error());

                return;
            }
            $this->_hook('after_register', array('user_id' => $user_id));
            //登录
            $this->_do_login($user_id);
            
            /* 同步登陆外部系统 */
            $synlogin = $ms->user->synlogin($user_id);

            #TODO 可能还会发送欢迎邮件
			$userinfo = $user_mod->get_info($user_id);
			$subject = "您的新用户信息！";
			//给推荐人发消息
			$sql = "SELECT user_id FROM {$user_mod->table} WHERE user_name = '$userinfo[deposit]'";
			$deposit_id = $user_mod->getRow($sql);
			if($deposit_id != ''){
				$name = $userinfo['deposit'];
				$content = get_msg('touser_userinfo', array('user_name' => $userinfo['user_name'], 'tel' => $userinfo['im_msn'], 'name' => $name));
				$ms->pm->send(MSG_SYSTEM, $deposit_id['user_id'], '', $content);
			}
			//给分销商发消息
			$sql = "SELECT user_id FROM {$user_mod->table} WHERE user_name = '$userinfo[fxs]'";
			$fxs_id = $user_mod->getRow($sql);
			if($fxs_id != ''){
				if( $fxs_id != $deposit_id){
					$name = $userinfo['fxs'];
					$content = get_msg('touser_userinfo', array('user_name' => $userinfo['user_name'], 'tel' => $userinfo['im_msn'], 'name' => $name));
					$ms->pm->send(MSG_SYSTEM, $fxs_id['user_id'], '', $content);
				}
			}
			//给代理商发消息
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
     *    检查用户是否存在
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
     *    我要转账
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
		
		
        /* 当前位置 */
        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
                         LANG::get('我要转账'));

        /* 当前用户中心菜单 */
		$this->_curmenu('my_money');
        $this->_curitem('money_to');
		
       
        $this->_config_seo('title', Lang::get('member_center'));
        $this->display('money_to.html');
		
	}
	
	/**
     *    转账操作
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
			$this->show_warning("不能转帐给自己！");
			return;
		}
		
		$sql = "SELECT COUNT(*) FROM {$user_mod->table} where user_name  = '$member'";
		$num = $user_mod->getOne($sql);
		
		if($user_info['password'] != md5($password)){
			$this->show_warning('密码错误');
			return;
		}
		elseif($num == 0){
			$this->show_warning('没有这个用户');
			return;
		}
		elseif($money > $user_info['money']){
			$this->show_warning('金额不足，无法转入');
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
				$this->show_message('转帐成功');
				return;
			}
			/*if($recode_mod->add($data)){
				$mail['subject'] = '领乐购转分邮件通知';
				$mail['message'] = "用户".$data['fromuser']."于".$data['time']."给您转入了".$data['integral']."积分。";
				$this->_mailto($data['touser'], addslashes($mail['subject']), addslashes($mail['message']));
				
				$mail['subject'] = '领乐购转分邮件通知';
				$mail['message'] = "您于".$data['time']."转给用户".$data['touser'].$data['integral']."积分。";
				$this->_mailto($data['touser'], addslashes($mail['subject']), addslashes($mail['message']));
				
				
				$this->show_message('转分成功');
				return;
			}else{ 
				$this->show_warning('系统出错');
				return;
			}*/
		}
		
      
		
	}
	
	
	/**
     *    转账操作记录
     *
     *    @author    tianwei
     *    @return    void
     */
	function money_recode()
    {
		$user = $this->visitor->get();
        $user_mod =& m('member');
        //获取当前用户的所有信息
		$user_info = $user_mod->get_info($user['user_id']);
		
		$recode_mod =& m('money_recode');
		$page   =   $this->_get_page(20);  //获取分页信息
		$recodes = $recode_mod->find(array(
			'conditions' 	=> "touser = '$user_info[user_name]' or fromuser = '$user_info[user_name]'",
            'limit'         => $page['limit'],  //获取当前页的数据
			'order'         => 'id DESC ', //必须加别名
            'count'         => true             //允许统计
        )); 
		$page['item_count'] = $recode_mod->getCount();   //获取统计的数据
		$this->_format_page($page);
		$this->assign('page_info', $page);
		$this->assign('recode', $recodes);
		
		
		 /* 当前位置 */
        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
                         LANG::get('转账操作记录'));

        /* 当前用户中心菜单 */
		$this->_curmenu('my_money');
        $this->_curitem('money_recode');
		
       
        $this->_config_seo('title', Lang::get('member_center'));
        $this->display('money_recode.html');
		
	}
	 /**
     *    我要转分
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
		
		
        /* 当前位置 */
        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
                         LANG::get('积分操作'));

        /* 当前用户中心菜单 */
		$this->_curmenu('my_integral');
        $this->_curitem('integral_to');
		
       
        $this->_config_seo('title', Lang::get('member_center'));
        $this->display('integral_to.html');
		
	}
	
	/**
     *    转分操作
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
			$this->show_warning("不能转分给自己！");
			return;
		}
		
		$sql = "SELECT COUNT(*) FROM {$user_mod->table} where user_name  = '$member'";
		$num = $user_mod->getOne($sql);
		
		
		if($user_info['password'] != md5($password)){
			$this->show_warning('密码错误');
			return;
		}
		elseif($user_info['grade'] == "免费会员"){
			$this->show_warning('免费会员无法转分给他人');
			return;
		}
		elseif($num == 0){
			$this->show_warning('没有这个用户');
			return;
		}
		elseif($int > $user_info['integral']){
			$this->show_warning('积分不足');
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
					$mail['subject'] = '零乐购转分邮件通知';
					$mail['message'] = "用户".$data['fromuser']."于".$data['time']."给您转入了".$data['integral']."积分。";
					$this->_mailto($data['touser'], addslashes($mail['subject']), addslashes($mail['message']));
					
					$mail['subject'] = '零乐购转分邮件通知';
					$mail['message'] = "您于".$data['time']."转给用户".$data['touser'].$data['integral']."积分。";
					$this->_mailto($data['touser'], addslashes($mail['subject']), addslashes($mail['message']));
					
					$this->show_message('转分成功');
					return;
				}
				else{ 
					$this->show_warning('系统出错');
					return;
				}
			}
		}
		
      
		
	}
	
	
	
	
	/**
     *    积分操作记录
     *
     *    @author    tianwei
     *    @return    void
     */
	function integral_recode()
    {
		
		$user = $this->visitor->get();
        $user_mod =& m('member');
        //获取当前用户的所有信息
		$sql = "SELECT * FROM {$user_mod->table} where user_id = ".$user['user_id'];
		$user_info = $user_mod->getRow($sql);
		
		$recode_mod =& m('recode');
		
		$page   =   $this->_get_page(20);  //获取分页信息
		$recodes = $recode_mod->find(array(
			'conditions'    => "touser = '$user_info[user_name]' or fromuser = '$user_info[user_name]'",
            'limit'         => $page['limit'],  //获取当前页的数据
			'order'         => 'id DESC ', //必须加别名
            'count'         => true             //允许统计
        )); 
		$page['item_count'] = $recode_mod->getCount();   //获取统计的数据
		$this->_format_page($page);
		$this->assign('page_info', $page);
		$this->assign('recode', $recodes);
		
        /* 当前位置 */
        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
                         LANG::get('积分操作记录'));

        /* 当前用户中心菜单 */
		$this->_curmenu('my_integral');
        $this->_curitem('integral_recode');
		
       
        $this->_config_seo('title', Lang::get('member_center'));
        $this->display('integral_recode.html');
  	}
	
	/**
     *    我的业务
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
			if($user_info['grade'] == '免费会员' || $user_info['grade'] == 'VIP会员' || $user_info['grade'] == '分销商'){
				$deposit = $user_mod->find(array(
				'conditions'    => "deposit = '$user_info[user_name]' AND `grade` != '免费会员'",
				'order'         => 'reg_time DESC ', //必须加别名
				));
				$total = 0;
				$total = $total + count($deposit);
				$sql = "SELECT * FROM {$user_mod->table} WHERE jjtjr != '' AND `grade` != '免费会员'";
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
			
			if($user_info['grade'] == '代理商'){
				$deposit = $user_mod->find(array(
				'conditions'    => "dls = '$user_info[user_name]' AND `grade` != '免费会员'",
				'order'         => 'reg_time DESC ', //必须加别名
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
			$this->_curlocal(LANG::get('member_center'), url('app=member'), LANG::get('我的业务'));

			/* 当前用户中心菜单 */
			$this->_curmenu('my_deposit');
			$this->_curitem('my_deposit');
			
		   
			$this->_config_seo('title', Lang::get('member_center'));
			$this->display('deposit.html');
		}
		else{
		
			if($_POST['star'] > $_POST['end']){
				$this->show_warning('时间错误，起始时间大于结束时间！');
				return;
			}
			$star = strtotime($_POST['star']);
			$end = strtotime($_POST['end']) + (3600*24);
			if($user_info['grade'] == '免费会员' || $user_info['grade'] == 'VIP会员' || $user_info['grade'] == '分销商'){
				$deposit = $user_mod->find(array(
				'conditions'    => "deposit = '$user_info[user_name]'  AND `grade` != '免费会员' AND  `reg_time` > $star AND `reg_time` < $end ",
				'order'         => 'reg_time DESC ', //必须加别名
				));
				$total = 0;
				$total = $total + count($deposit);
				$sql = "SELECT * FROM {$user_mod->table} WHERE jjtjr != ''  AND `grade` != '免费会员' AND `reg_time` > $star AND `reg_time` < $end";
				$all_user = $user_mod->getAll($sql);
				foreach($all_user as $value){
					$arr = explode(",",$value['jjtjr']);
					if(in_array($user_info[user_name], $arr)){
						$total ++;
					}	
				}
				$this->assign('total', $total);
			}
			if($user_info['grade'] == '代理商'){
				$deposit = $user_mod->find(array(
				'conditions'    => "dls = '$user_info[user_name]' AND `grade` != '免费会员' AND `reg_time` > $star AND `reg_time` < $end",
				'order'         => 'reg_time DESC ', //必须加别名
				));
				$this->assign('dep', count($deposit));	
			}
			$this->assign('time', $time);
			$this->assign('star', $_POST['star']);
			$this->assign('end', $_POST['end']);
			
			
			$this->_curlocal(LANG::get('member_center'), url('app=member'), LANG::get('我的业务'));

			/* 当前用户中心菜单 */
			$this->_curmenu('my_deposit');
			$this->_curitem('my_deposit');
			
		  
			$this->_config_seo('title', Lang::get('member_center'));
			$this->display('deposit.search.html');
		}
        /* 当前位置 */
       
  	}
	
	/**
     *    用户升级
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
		
		if($user_info['grade'] != '代理商'){
			if($user_info['grade'] == '免费会员'){
				$this->show_warning('亲，您的专属代理商正在等候您的联系，他们会为您提供7x24小时贴心服务，祝您购物愉快！');
				return;
			}
			if($user_info['grade'] == 'VIP会员' || $user_info['grade'] == '分销商'){
				$this->show_warning('亲，您已经是正式用户，无需激活，祝您购物愉快！');
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
				$this->show_warning('没有这个用户！');
				return;
			}
			if($cu['dls'] != $user_info['user_name']){
				$this->show_warning('该用户不属于您的市场，无法查看！');
				return;
			}
			if($cu['grade'] != '免费会员'){
				$this->show_warning('该用户不是免费会员，无法升级！');
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
		/* 当前用户中心菜单 */
		$this->_curlocal(LANG::get('member_center'), url('app=member'), LANG::get('用户升级'));
		$this->_curmenu('upgrade');
		$this->_curitem('upgrade');
			
		  
		$this->_config_seo('title', Lang::get('member_center'));
		$this->display('upgrade.html');
		
		
	}
	
	//升级方法
	function _upgrade($d, $u, $f, $user_mod, $d_int, $f_int, $u_int, $mon, $grade){
					if($f != ''){
						$fxs_int = $f['integral'] - $f_int;
						$fxs_data = array('integral' =>$fxs_int);
						$user_mod->edit($f['user_id'], $fxs_data); //修改分销商信息
					}
					$dls_money = $d['money'] - $mon;   //计算扣除代理商费用
					$dls_int = $d['integral'] - $d_int;        //计算扣除代理商积分
					$use_int = $u['integral'] - $u_int;	  //计算扣除用户积分
					$use_data = array('integral' =>$use_int, 'grade' => $grade);
					$dls_data = array('integral' =>$dls_int, 'money'=>$dls_money);
					$user_mod->edit($d['user_id'], $dls_data); //执行修改代理商积分和费用的操作
					$user_mod->edit($u['user_id'], $use_data);             //执行修改升级用户积分和等级的操作
					
					//将升级信息插入升级信息表
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
	//我间接推荐的人
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
	//升级用户间接推荐的人的分销商修改
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
	//升级代理商用户 间接推荐的人的 代理商的 修改方法
	function jj_dls_edit($myjj_deposit, $u, $user_mod){
					if($myjj_deposit != ''){  
						foreach($myjj_deposit as $value){
							if($value[dls] != ''){     
								//我间接推荐的人的代理商
								$sql = "SELECT * FROM {$user_mod->table} WHERE `user_name` = '$value[dls]'";
								$zz_dls = $user_mod->getRow($sql);
							}
							$jjtjr = array();
							$arr = explode(",",$zz_dls['jjtjr']); 
							//如果我间接推荐的人的代理商是我下面的人，那么就不管这个人！
							if(in_array($u['user_name'], $arr) || $zz_dls['deposit'] == $u['user_name'] ){
							}
							//如果我间接推荐的人的代理商不是我下面的人,那么就根据情况更新dls,fxs,jjtjr的信息
							else{
								//我间接推荐的人的间接推荐人信息更新为 从我脱离，我成为间接推荐人的开始
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
								//获取我间接推荐的人的分销商
								if($value[fxs] != ''){
									$sql = "SELECT * FROM {$user_mod->table} WHERE `user_name` = '$value[fxs]'";
									$zz_fxs = $user_mod->getRow($sql);
								}
								$are = explode(",",$zz_fxs['jjtjr']);
								//如果我间接推荐的人的分销商是我下面的人，那么这个人的分销商保留
								if(in_array($u['user_name'], $are) || $zz_fxs['deposit'] == $u['user_name'] ){
									$dls_data = array('dls' =>$u['user_name'], 'jjtjr'=>$jjtjr);
									$user_mod->edit($value['user_id'], $dls_data);
								}
								//如果我间接推荐的人的分销商不是我下面的人，那么这个人的分销商更新为空
								else{
									$dls_data = array('dls' =>$u['user_name'], 'jjtjr'=>$jjtjr, 'fxs'=>'');
									$user_mod->edit($value['user_id'], $dls_data);
								}
							}
						}
					}
	}
	/**
     *    用户升级
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
        $user_info = $user_mod->get_info($id); //被升级的用户
		if($user_info['grade'] != '免费会员'){
			$this->show_warning('该用户不是免费会员，无法升级！', '返回上一页', '/index.php?app=member&act=upgrade');
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
				$this->show_warning('您的费用不足，无法完成升级！', '返回上一页', '/index.php?app=member&act=upgrade');
				return;
			}
			if($fxs == ''){
				if($user_info['integral'] >= 600 && $dls['integral'] >= 200){
					$this->_upgrade($dls, $user_info, '', $user_mod, 200, 0, 600, $money[0], 'VIP会员');//升级
					$this->show_message('升级成功', '返回', '/index.php?app=member&act=upgrade' );
					return;
				}
				else{
					$this->show_warning('积分不足，无法完成升级！', '返回上一页', '/index.php?app=member&act=upgrade');
					return;
				}
			}
			else{
				if($user_info['integral'] >= 600 && $dls['integral'] >= 120 && $fxs['integral'] >= 80){
					$this->_upgrade($dls, $user_info, $fxs, $user_mod, 120, 80, 600, $money[0], 'VIP会员');//升级
					$this->show_message('升级成功', '返回', '/index.php?app=member&act=upgrade' );
					return;
				}
				else{
					$this->show_warning('积分不足，无法完成升级！', '返回上一页', '/index.php?app=member&act=upgrade');
					return;
				}
			}
		}
		
		if($grade == 1){
			if($dls['money'] < $money[1]){
				$this->show_warning('您的费用不足，无法完成升级！', '返回上一页', '/index.php?app=member&act=upgrade');
				return;
			}
			if($fxs == ''){
				if($user_info['integral'] >= 1000 && $dls['integral'] >= 4000){
					$this->_upgrade($dls, $user_info, '', $user_mod, 4000, 0, 1000, $money[1], '分销商');//升级
					
					//推荐人为$user_info[user_name]的分销商更新为$user_info[user_name]
					$sql = "UPDATE {$user_mod->table} SET `fxs` = '$user_info[user_name]' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					
					//我间接推荐的人
					$myjj_deposit = $this->get_myjj($user_info, $user_mod);
					
					//如果我间接推荐的人的分销商不是我下面的人，那么就更新我间接推荐的人分销商为我自己
					$this->jj_fxs_edit($myjj_deposit, $user_info, $user_mod);
					
					$this->show_message('升级成功', '返回', '/index.php?app=member&act=upgrade' );
					return;
				}
				else{
					$this->show_warning('积分不足，无法完成升级！', '返回上一页', '/index.php?app=member&act=upgrade');
					return;
				}
			}
			else{
				if($user_info['integral'] >= 1000 && $dls['integral'] >= 3000 && $fxs['integral'] >= 1000){
					$this->_upgrade($dls, $user_info, $fxs, $user_mod, 3000, 1000, 1000, $money[1], '分销商');//升级
					//推荐人为$user_info[user_name]的分销商更新为$user_info[user_name]
					$sql = "UPDATE {$user_mod->table} SET `fxs` = '$user_info[user_name]' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					
					//我间接推荐的人
					$myjj_deposit = $this->get_myjj($user_info, $user_mod);
					
					//如果我间接推荐的人的分销商不是我的直接或者间接推荐人，那么就更新我间接推荐的人分销商为我自己
					$this->jj_fxs_edit($myjj_deposit, $user_info, $user_mod);
					
					$this->show_message('升级成功', '返回', '/index.php?app=member&act=upgrade' );
					return;
				}
				else{
					$this->show_warning('积分不足，无法完成升级！', '返回上一页', '/index.php?app=member&act=upgrade');
					return;
				}
			}
		}
		
		
		if($grade == 2){
			if($dls['money'] < $money[2]){
				$this->show_warning('您的费用不足，无法完成升级！', '返回上一页', '/index.php?app=member&act=upgrade');
				return;
			}
			if($fxs == ''){
				if($user_info['integral'] >= 2500 && $dls['integral'] >= 17500){
					$this->_upgrade($dls, $user_info, '', $user_mod, 17500, 0, 2500, $money[2], '代理商');//升级
					
					//推荐人为$user_info[user_name]的代理商更新为$user_info[user_name]
					
					$sql = "UPDATE {$user_mod->table} SET `dls` = '$user_info[user_name]' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					$sql = "UPDATE {$user_mod->table} SET `jjtjr` = '' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					$sql = "UPDATE {$user_mod->table} SET `fxs` = '' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
				
					
					//我间接推荐的人
					$myjj_deposit = $this->get_myjj($user_info, $user_mod);
					
					//如果我间接推荐的人的分销商不是我的直接或者间接推荐人，那么就更新我间接推荐的人分销商为我自己
					$this->jj_dls_edit($myjj_deposit, $user_info, $user_mod);
					
					$this->show_message('升级成功', '返回', '/index.php?app=member&act=upgrade' );
					return;
				}
				else{
					$this->show_warning('积分不足，无法完成升级！', '返回上一页', '/index.php?app=member&act=upgrade');
					return;
				}
			}
			else{
				if($user_info['integral'] >= 2500 && $dls['integral'] >= 15000 && $fxs['integral'] >= 2500){
					$this->_upgrade($dls, $user_info, $fxs, $user_mod, 15000, 2500, 2500, $money[2], '代理商');//升级
					
					//推荐人为$user_info[user_name]的代理商更新为$user_info[user_name]
					
					$sql = "UPDATE {$user_mod->table} SET `dls` = '$user_info[user_name]' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					$sql = "UPDATE {$user_mod->table} SET `jjtjr` = '' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					$sql = "UPDATE {$user_mod->table} SET `fxs` = '' WHERE `deposit` = '$user_info[user_name]'";
					$this->db->query($sql);
					
					//我间接推荐的人
					$myjj_deposit = $this->get_myjj($user_info, $user_mod);
					
					//如果我间接推荐的人的分销商不是我的直接或者间接推荐人，那么就更新我间接推荐的人分销商为我自己
					$this->jj_dls_edit($myjj_deposit, $user_info, $user_mod);
					
					$this->show_message('升级成功', '返回', '/index.php?app=member&act=upgrade' );
					return;
				}
				else{
					$this->show_warning('积分不足，无法完成升级！', '返回上一页', '/index.php?app=member&act=upgrade');
					return;
				}
			}
		}
		
	}

    /**
     *    修改基本信息
     *
     *    @author    Hyber
     *    @usage    none
     */
    function profile(){

        $user_id = $this->visitor->get('user_id');
        if (!IS_POST)
        {
            /* 当前位置 */
            $this->_curlocal(LANG::get('member_center'),  'index.php?app=member',
                             LANG::get('basic_information'));

            /* 当前用户中心菜单 */
            $this->_curitem('my_profile');

            /* 当前所处子菜单 */
            $this->_curmenu('basic_information');

            $ms =& ms();    //连接用户系统
            $edit_avatar = $ms->user->set_avatar($this->visitor->get('user_id')); //获取头像设置方式

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
     *    修改密码
     *
     *    @author    Hyber
     *    @usage    none
     */
    function password(){
        $user_id = $this->visitor->get('user_id');
        if (!IS_POST)
        {
            /* 当前位置 */
            $this->_curlocal(LANG::get('member_center'),  'index.php?app=member',
                             LANG::get('edit_password'));

            /* 当前用户中心菜单 */
            $this->_curitem('my_profile');

            /* 当前所处子菜单 */
            $this->_curmenu('edit_password');
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js',
            ));
            $this->_config_seo('title', Lang::get('user_center') . ' - ' . Lang::get('edit_password'));
            $this->display('member.password.html');
        }
        else
        {
            /* 两次密码输入必须相同 */
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

            /* 修改密码 */
            $ms =& ms();    //连接用户系统
            $result = $ms->user->edit($this->visitor->get('user_id'), $orig_password, array(
                'password'  => $new_password
            ));
            if (!$result)
            {
                /* 修改不成功，显示原因 */
                $this->show_warning($ms->user->get_error());

                return;
            }

            $this->show_message('edit_password_successed');
        }
    }
    /**
     *    修改电子邮箱
     *
     *    @author    Hyber
     *    @usage    none
     */
    function email(){
        $user_id = $this->visitor->get('user_id');
        if (!IS_POST)
        {
            /* 当前位置 */
            $this->_curlocal(LANG::get('member_center'),  'index.php?app=member',
                             LANG::get('edit_email'));

            /* 当前用户中心菜单 */
            $this->_curitem('my_profile');

            /* 当前所处子菜单 */
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

            $ms =& ms();    //连接用户系统
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
     * Feed设置
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
            /* 当前位置 */
            $this->_curlocal(LANG::get('member_center'),  'index.php?app=member',
                             LANG::get('feed_settings'));

            /* 当前用户中心菜单 */
            $this->_curitem('my_profile');

            /* 当前所处子菜单 */
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
     *    三级菜单
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
     * 上传头像
     *
     * @param int $user_id
     * @return mix false表示上传失败,空串表示没有上传,string表示上传文件地址
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
