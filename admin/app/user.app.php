<?php

/* ��Ա������ */
class UserApp extends BackendApp
{
    var $_user_mod;

    function __construct()
    {
        $this->UserApp();
    }

    function UserApp()
    {
        parent::__construct();
        $this->_user_mod =& m('member');
    }

    function index()
    {
        $conditions = $this->_get_query_conditions(array(
            array(
                'field' => $_GET['field_name'],
                'name'  => 'field_value',
                'equal' => 'like',
            ),
        ));
        //��������
        if (isset($_GET['sort']) && !empty($_GET['order']))
        {
            $sort  = strtolower(trim($_GET['sort']));
            $order = strtolower(trim($_GET['order']));
            if (!in_array($order,array('asc','desc')))
            {
             $sort  = 'user_id';
             $order = 'asc';
            }
        }
        else
        {
            if (isset($_GET['sort']) && empty($_GET['order']))
            {
                $sort  = strtolower(trim($_GET['sort']));
                $order = "";
            }
            else
            {
                $sort  = 'user_id';
                $order = 'asc';
            }
        }
        $page = $this->_get_page();
        $users = $this->_user_mod->find(array(
            'join' => 'has_store,manage_mall',
            'fields' => 'this.*,store.store_id,userpriv.store_id as priv_store_id,userpriv.privs',
            'conditions' => '1=1' . $conditions,
            'limit' => $page['limit'],
            'order' => "user_id asc",
            'count' => true,
        ));
        foreach ($users as $key => $val)
        {
            if ($val['priv_store_id'] == 0 && $val['privs'] != '')
            {
                $users[$key]['if_admin'] = true;
            }
        }
        $this->assign('users', $users);
        $page['item_count'] = $this->_user_mod->getCount();
        $this->_format_page($page);
        $this->assign('filtered', $conditions? 1 : 0); //�Ƿ��в�ѯ����
        $this->assign('page_info', $page);
        /* ����jQuery�ı���֤��� */
        $this->import_resource(array(
            'script' => 'jqtreetable.js,inline_edit.js',
            'style'  => 'res:style/jqtreetable.css'
        ));
        $this->assign('query_fields', array(
            'user_name' => LANG::get('user_name'),
            'email'     => LANG::get('email'),
            'real_name' => LANG::get('real_name'),
			'grade'     => '��Ա�ȼ�',
//            'phone_tel' => LANG::get('phone_tel'),
//            'phone_mob' => LANG::get('phone_mob'),
        ));
        $this->assign('sort_options', array(
            'reg_time DESC'   => LANG::get('reg_time'),
            'last_login DESC' => LANG::get('last_login'),
            'logins DESC'     => LANG::get('logins'),
        ));
        $this->display('user.index.html');
    }
	
	function info()
    {
		/* ����jQuery�ı���֤��� */
        $this->import_resource(array(
            'script' => 'jqtreetable.js,inline_edit.js',
            'style'  => 'res:style/jqtreetable.css'
        ));
        $this->assign('query_fields', array(
            'user_name' => LANG::get('user_name'),
            'email'     => LANG::get('email'),
            'real_name' => LANG::get('real_name'),
//            'phone_tel' => LANG::get('phone_tel'),
//            'phone_mob' => LANG::get('phone_mob'),
        ));
        $this->assign('sort_options', array(
            'reg_time DESC'   => LANG::get('reg_time'),
            'last_login DESC' => LANG::get('last_login'),
            'logins DESC'     => LANG::get('logins'),
        ));
		$this->display('user.index.html');
	}
    function add()
    {
        if (!IS_POST)
        {
            $this->assign('user', array(
                'gender' => 0,
            ));
            /* ����jQuery�ı���֤��� */
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js'
            ));
            $ms =& ms();
            $this->assign('set_avatar', $ms->user->set_avatar());
            $this->display('user.form.html');
        }
        else
        {
            $user_name = trim($_POST['user_name']);
            $password  = trim($_POST['password']);
            $email     = trim($_POST['email']);
            $real_name = trim($_POST['real_name']);
            $gender    = trim($_POST['gender']);
            $im_qq     = trim($_POST['im_qq']);
            $im_msn    = trim($_POST['im_msn']);

            if (strlen($user_name) < 3 || strlen($user_name) > 25)
            {
                $this->show_warning('user_name_length_error');

                return;
            }

            if (strlen($password) < 6 || strlen($password) > 20)
            {
                $this->show_warning('password_length_error');

                return;
            }

            if (!is_email($email))
            {
                $this->show_warning('email_error');

                return;
            }

            /* �����û�ϵͳ */
            $ms =& ms();

            /* ��������Ƿ��Ѵ��� */
            if (!$ms->user->check_username($user_name))
            {
                $this->show_warning($ms->user->get_error());

                return;
            }

            /* ���汾������ */
            $data = array(
                'real_name' => $_POST['real_name'],
                'gender'    => $_POST['gender'],
//                'phone_tel' => join('-', $_POST['phone_tel']),
//                'phone_mob' => $_POST['phone_mob'],
                'im_qq'     => $_POST['im_qq'],
                'im_msn'    => $_POST['im_msn'],
//                'im_skype'  => $_POST['im_skype'],
//                'im_yahoo'  => $_POST['im_yahoo'],
//                'im_aliww'  => $_POST['im_aliww'],
                'reg_time'  => gmtime(),
            );

            /* ���û�ϵͳ��ע�� */
            $user_id = $ms->user->register($user_name, $password, $email, $data);
            if (!$user_id)
            {
                $this->show_warning($ms->user->get_error());

                return;
            }

            if (!empty($_FILES['portrait']))
            {
                $portrait = $this->_upload_portrait($user_id);
                if ($portrait === false)
                {
                    return;
                }

                $portrait && $this->_user_mod->edit($user_id, array('portrait' => $portrait));
            }


            $this->show_message('add_ok',
                'back_list',    'index.php?app=user',
                'continue_add', 'index.php?app=user&amp;act=add'
            );
        }
    }

    /*����Ա���Ƶ�Ψһ��*/
    function  check_user()
    {
          $user_name = empty($_GET['user_name']) ? null : trim($_GET['user_name']);
          if (!$user_name)
          {
              echo ecm_json_encode(false);
              return ;
          }

          /* ���ӵ��û�ϵͳ */
          $ms =& ms();
          echo ecm_json_encode($ms->user->check_username($user_name));
    }

    function edit()
    {
        $id = empty($_GET['id']) ? 0 : intval($_GET['id']);
        if (!IS_POST)
        {
            /* �Ƿ���� */
            $user = $this->_user_mod->get_info($id);
			$user_mod =& m('member');
			if (!$user)
            {
                $this->show_warning('user_empty');
                return;
            }

            $ms =& ms();
			
			//����ͳ��
			$time = date('Y-m-d',gmtime());
			if($user['grade'] == '��ѻ�Ա' || $user['grade'] == 'VIP��Ա' || $user['grade'] == '������'){
				$deposit = $user_mod->find(array(
				'conditions'    => "deposit = '$user[user_name]' AND `grade` != '��ѻ�Ա'",
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
					if(in_array($user[user_name], $arr)){
						$total ++;
						if(date('Y-m-d', $value['reg_time']) == date('Y-m-d',gmtime())){	
							$num ++;
						}
					}	
				}
				$this->assign('total', $total);
				
			}
			
			if($user['grade'] == '������'){
				$deposit = $user_mod->find(array(
				'conditions'    => "dls = '$user[user_name]' AND `grade` != '��ѻ�Ա'",
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
			
            $this->assign('set_avatar', $ms->user->set_avatar($id));
            $this->assign('user', $user);
            $this->assign('phone_tel', explode('-', $user['phone_tel']));
            /* ����jQuery�ı���֤��� */
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js'
            ));
            $this->display('user.form.html');
        }
        else
        {
			
			$end_time = $_POST['use_time'];
			$end_time = strtotime($end_time);
			
			
            $data = array(
                'real_name' => $_POST['real_name'],
                'gender'    => $_POST['gender'],
//                'phone_tel' => join('-', $_POST['phone_tel']),
//                'phone_mob' => $_POST['phone_mob'],
                'im_qq'     => $_POST['im_qq'],
                'im_msn'    => $_POST['im_msn'],
				'bank'    => $_POST['bank'],
				'grade'    => $_POST['grade'],
				'integral'    => $_POST['integral'],
				'money'    => $_POST['money'],
				'td_int_sx'    => $_POST['sx'],
				'login'    => $_POST['login'],
				'use_time' => $end_time,
//                'im_skype'  => $_POST['im_skype'],
//                'im_yahoo'  => $_POST['im_yahoo'],
//                'im_aliww'  => $_POST['im_aliww'],
            );
            if (!empty($_POST['password']))
            {
                $password = trim($_POST['password']);
                if (strlen($password) < 6 || strlen($password) > 20)
                {
                    $this->show_warning('password_length_error');

                    return;
                }
            }
            if (!is_email(trim($_POST['email'])))
            {
                $this->show_warning('email_error');

                return;
            }

            if (!empty($_FILES['portrait']))
            {
                $portrait = $this->_upload_portrait($id);
                if ($portrait === false)
                {
                    return;
                }
                $data['portrait'] = $portrait;
            }
			
			$c_use = $this->_user_mod->get_info($id);
			
			$user_mod =& m('member');
			if($c_use['grade'] != $data['grade']){
				$this->db = &db();
				if($data['grade'] == '������'){
					$sql = "UPDATE {$user_mod->table} SET `fxs` = '$c_use[user_name]' WHERE `deposit` = '$c_use[user_name]'";
					$this->db->query($sql);
					
					//�Ҽ���Ƽ�����
					$sql = "SELECT * FROM {$user_mod->table} WHERE jjtjr != ''";
					$jj_deposit = $user_mod->getAll($sql);
					foreach($jj_deposit as $value){
						$arr = explode(",",$value['jjtjr']);
						if(in_array($c_use[user_name], $arr)){
							$myjj_deposit[] = $value;
						}			
					}
					
					//����Ҽ���Ƽ����˵ķ����̲����ҵ�ֱ�ӻ��߼���Ƽ��ˣ���ô�͸����Ҽ���Ƽ����˷�����Ϊ���Լ�
					if($myjj_deposit != ''){
						foreach($myjj_deposit as $value){
							if($value['fxs'] != ''){
								$sql = "SELECT * FROM {$user_mod->table} WHERE `user_name` = '$value[fxs]'";
								$zz_fxs = $user_mod->getRow($sql);
                                $arr = explode(",",$zz_fxs['jjtjr']);
                                if(!in_array($c_use['user_name'], $arr) && $zz_fxs['deposit'] != $c_use['user_name']){
                                    $user_mod->edit($value['user_id'], array('fxs' =>$c_use['user_name']));
                                }
                            }
                            else{
                                $user_mod->edit($value['user_id'], array('fxs' =>$c_use['user_name']));
                            }
						}
					}
				}
				if($data['grade'] == '������'){
					
					$sql = "UPDATE {$user_mod->table} SET `dls` = '$c_use[user_name]' WHERE `deposit` = '$c_use[user_name]'";
					$this->db->query($sql);
					$sql = "UPDATE {$user_mod->table} SET `fxs` = '' WHERE `deposit` = '$c_use[user_name]'";
					$this->db->query($sql);
					$sql = "UPDATE {$user_mod->table} SET `jjtjr` = '' WHERE `deposit` = '$c_use[user_name]'";
					$this->db->query($sql);
					
					//�Ҽ���Ƽ�����
					$sql = "SELECT * FROM {$user_mod->table} WHERE `jjtjr` != ''";
					$jj_deposit = $user_mod->getAll($sql);
					
					foreach($jj_deposit as $value){
						$arr = explode(",",$value['jjtjr']);
						if(in_array($c_use['user_name'], $arr)){
							$myjj_deposit[] = $value;
						}			
					}
					
					
					//����Ҽ���Ƽ����˵ķ����̲����ҵ�ֱ�ӻ��߼���Ƽ��ˣ���ô�͸����Ҽ���Ƽ����˷�����Ϊ���Լ�
					if($myjj_deposit != ''){
						foreach($myjj_deposit as $value){
							if($value[dls] != ''){
								$sql = "SELECT * FROM {$user_mod->table} WHERE `user_name` = '$value[dls]'";
								$zz_dls = $user_mod->getRow($sql);
							}
							$jjtjr = array();
							$arr = explode(",",$zz_dls['jjtjr']);
							if(in_array($c_use[user_name], $arr) || $zz_dls['deposit'] == $c_use[user_name] ){
							}
							else{
								$array =explode(",", $value['jjtjr']);
								if($array != ''){
									foreach($array as $key=>$val){
										if($val == $c_use['user_name']){
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
								if($value[fxs] != ''){
									$sql = "SELECT * FROM {$user_mod->table} WHERE `user_name` = '$value[fxs]'";
									$zz_fxs = $user_mod->getRow($sql);
								}
								$are = explode(",",$zz_fxs['jjtjr']);
								if(in_array($c_use['user_name'], $are) || $zz_fxs['deposit'] == $c_use['user_name'] ){
									$dls_data = array('dls' =>$c_use['user_name'], 'jjtjr'=>$jjtjr);
									$user_mod->edit($value['user_id'], $dls_data);
								}
								else{
									$dls_data = array('dls' =>$c_use['user_name'], 'fxs'=>'', 'jjtjr'=>$jjtjr);
									$user_mod->edit($value['user_id'], $dls_data);
								}
							}
						}
					}
				}
				if($data['grade'] == '��ѻ�Ա' || $data['grade'] == 'VIP��Ա'){
					$sql = "UPDATE {$user_mod->table} SET `dls` = '' WHERE `dls` = '$c_use[user_name]'";
					$this->db->query($sql);
					$sql = "UPDATE {$user_mod->table} SET `fxs` = '' WHERE `fxs` = '$c_use[user_name]'";
					$this->db->query($sql);
				}
				
				
				$admin = $this->visitor->get();
				$uprecode_mod = & m('uprecode');
					$tdata = array(
					  'user_name' => $c_use['user_name'],
				   	  'operator'  => $admin['user_name'],
					  'grade'     => $c_use['grade'],
					  'upgrade'   => $data['grade'],
					  'time' 	  => gmtime()
					);
				$uprecode_mod->add($tdata);
			}

            /* �޸ı������� */
            $this->_user_mod->edit($id, $data);

            /* �޸��û�ϵͳ���� */
            $user_data = array();
            !empty($_POST['password']) && $user_data['password'] = trim($_POST['password']);
            !empty($_POST['email'])    && $user_data['email']    = trim($_POST['email']);
            if (!empty($user_data))
            {
                $ms =& ms();
                $ms->user->edit($id, '', $user_data, true);
            }

            $this->show_message('edit_ok',
                'back_list',    'index.php?app=user',
                'edit_again',   'index.php?app=user&amp;act=edit&amp;id=' . $id
            );
        }
    }

	function search()
	{
		$user_mod =& m('member');
		$id = $_POST['user_id'];
		$user_info = $user_mod->get_info($id);
		
		if($_POST['star'] > $_POST['end']){
				$this->show_warning('ʱ�������ʼʱ����ڽ���ʱ�䣡');
				return;
		}
		$star = strtotime($_POST['star']);
		$end = strtotime($_POST['end']) + (3600*24);
		
		if($user_info['grade'] == '��ѻ�Ա' || $user_info['grade'] == 'VIP��Ա' || $user_info['grade'] == '������'){
				$deposit = $user_mod->find(array(
				'conditions'    => "deposit = '$user_info[user_name]' AND `grade` != '��ѻ�Ա' AND `reg_time` > $star AND `reg_time` < $end",
				'order'         => 'reg_time DESC ', //����ӱ���
				));
				$total = 0;
				$total = $total + count($deposit);
				$sql = "SELECT * FROM {$user_mod->table} WHERE jjtjr != '' AND `grade` != '��ѻ�Ա' AND `reg_time` > $star AND `reg_time` < $end";
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
			$this->assign('user', $user_info);
			
			$this->display('user.search.html');
			
	}
	
    function drop()
    {
        $id = isset($_GET['id']) ? trim($_GET['id']) : '';
        if (!$id)
        {
            $this->show_warning('no_user_to_drop');
            return;
        }
        $admin_mod =& m('userpriv');
        if(!$admin_mod->check_admin($id))
        {
            $this->show_message('cannot_drop_admin',
                'drop_admin', 'index.php?app=admin');
            return;
        }

        $ids = explode(',', $id);

        /* �����û�ϵͳ�����û�ϵͳ��ɾ����Ա */
        $ms =& ms();
        if (!$ms->user->drop($ids))
        {
            $this->show_warning($ms->user->get_error());

            return;
        }

        $this->show_message('drop_ok');
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
            $this->show_warning($uploader->get_error(), 'go_back', 'index.php?app=user&amp;act=edit&amp;id=' . $user_id);
            return false;
        }

        $uploader->root_dir(ROOT_PATH);
        return $uploader->save('data/files/mall/portrait/' . ceil($user_id / 500), $user_id);
    }
}

?>
