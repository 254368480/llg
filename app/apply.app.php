<?php

/* ���뿪�� */
class ApplyApp extends MallbaseApp
{

    function index()
    {
        $step = isset($_GET['step']) ? intval($_GET['step']) : 1;
        /* �ж��Ƿ����˵������� */
        if (!Conf::get('store_allow'))
        {
            $this->show_warning('apply_disabled');
            return;
        }

        /* ֻ�е�¼���û��ſ����� */
        if (!$this->visitor->has_login)
        {
            $this->login();
            return;
        }
		
		/* ��ѻ�Ա�������뿪�� */
		$user = $this->visitor->get();
		$user_mod =& m('member');
		$sql = "SELECT * FROM {$user_mod->table} where user_id = ".$user['user_id'];
		$user_info = $user_mod->getRow($sql);
		
		if( $user_info[grade] == "��ѻ�Ա"){
			 $this->show_warning('��ѻ�Ա�������뿪��');
             return;
		}

        /* ������������е��̲��������� */
        $store_mod =& m('store');
        $store = $store_mod->get($this->visitor->get('user_id'));
        if ($store)
        {
            if ($store['state'])
            {
                $this->show_warning('user_has_store');
                return;
            }
            else
            {
                if ($step != 2)
                {
                    $this->show_warning('user_has_application');
                    return;
                }                
            }
        }
        $sgrade_mod =& m('sgrade');
        
        switch ($step)
        {
            case 1:
                $sgrades = $sgrade_mod->find(array(
                    'order' => 'sort_order',
                ));
                foreach ($sgrades as $key => $sgrade)
                {
                    if (!$sgrade['goods_limit'])
                    {
                        $sgrades[$key]['goods_limit'] = LANG::get('no_limit');
                    }
                    if (!$sgrade['space_limit'])
                    {
                        $sgrades[$key]['space_limit'] = LANG::get('no_limit');
                    }
                    $arr = explode(',', $sgrade['functions']);
                    $subdomain = array();
                    foreach ( $arr as $val)
                    {
                        if (!empty($val))
                        {
                            $subdomain[$val] = 1;
                        }
                    }
                    $sgrades[$key]['functions'] = $subdomain;
                    unset($arr);
                    unset($subdomain);
                }
                $this->assign('domain', ENABLED_SUBDOMAIN);
                $this->assign('sgrades', $sgrades);

                $this->_config_seo('title', Lang::get('title_step1') . ' - ' . Conf::get('site_title'));
                $this->display('apply.step1.html');
                break;
            case 2:
                $sgrade_id = isset($_GET['id']) ? intval($_GET['id']) : 0;
                $sgrade = $sgrade_mod->get($sgrade_id);
                if (empty($sgrade))
                {
                    $this->show_message('request_error',
                        'back_step1', 'index.php?app=apply');
                         exit;
                }

                if (!IS_POST)
                {
                    $region_mod =& m('region');
                    $this->assign('site_url', site_url());
                    $this->assign('regions', $region_mod->get_options(0));
                    $this->assign('scategories', $this->_get_scategory_options());

                    /* ����jQuery�ı���֤��� */
                    $this->import_resource(array('script' => 'mlselection.js,jquery.plugins/jquery.validate.js'));

                    $this->_config_seo('title', Lang::get('title_step2') . ' - ' . Conf::get('site_title'));
                    $this->assign('store', $store);
                    $scategory = $store_mod->getRelatedData('has_scategory', $this->visitor->get('user_id'));
                    if ($scategory)
                    {
                        $scategory = current($scategory);
                    }
                    $this->assign('scategory', $scategory);
                    $this->display('apply.step2.html');
                }
                else
                {
                    $store_mod  =& m('store');

                    $store_id = $this->visitor->get('user_id');
                    $data = array(
                        'store_id'     => $store_id,
                        'store_name'   => $_POST['store_name'],
                        'owner_name'   => $_POST['owner_name'],
                        'owner_card'   => $_POST['owner_card'],
                        'region_id'    => $_POST['region_id'],
                        'region_name'  => $_POST['region_name'],
                        'address'      => $_POST['address'],
                        'zipcode'      => $_POST['zipcode'],
                        'tel'          => $_POST['tel'],
                        'sgrade'       => $sgrade['grade_id'],
                       //'apply_remark' => $_POST['apply_remark'],
                        'state'        => $sgrade['need_confirm'] ? 0 : 1,
                        'add_time'     => gmtime(),
                    );
                    $image = $this->_upload_image($store_id);
                    if ($this->has_error())
                    {
                        $this->show_warning($this->get_error());

                        return;
                    }
                    
                    /* �ж��Ƿ��Ѿ������ */
                    $state = $this->visitor->get('state');
                    if ($state != '' && $state == STORE_APPLYING)
                    {
                        $store_mod->edit($store_id, array_merge($data, $image));
                    }
                    else
                    {
                        $store_mod->add(array_merge($data, $image));
                    }
                    
                    if ($store_mod->has_error())
                    {
                        $this->show_warning($store_mod->get_error());
                        return;
                    }
                    

                    $cate_id = intval($_POST['cate_id']);
                    $store_mod->unlinkRelation('has_scategory', $store_id);
                    if ($cate_id > 0)
                    {                        
                        $store_mod->createRelation('has_scategory', $store_id, $cate_id);
                    }

                    if ($sgrade['need_confirm'])
                    {
                        $this->show_message('apply_ok',
                            'index', 'index.php');
                    }
                    else
                    {
                        $this->send_feed('store_created', array(
                            'user_id'   => $this->visitor->get('user_id'),
                            'user_name'   => $this->visitor->get('user_name'),
                            'store_url'   => SITE_URL . '/' . url('app=store&id=' . $store_id),
                            'seller_name'   => $data['store_name'],
                        ));
                        $this->_hook('after_opening', array('user_id' => $store_id));
                        $this->show_message('store_opened',
                            'index', 'index.php');
                    }
                }
                break;
            default:
                header("Location:index.php?app=apply&step=1");
                break;
        }
    }

    function check_name()
    {
        $store_name = empty($_GET['store_name']) ? '' : trim($_GET['store_name']);
        $store_id = empty($_GET['store_id']) ? 0 : intval($_GET['store_id']);

        $store_mod =& m('store');
        if (!$store_mod->unique($store_name, $store_id))
        {
            echo ecm_json_encode(false);
            return;
        }
        echo ecm_json_encode(true);
    }

    /* �ϴ�ͼƬ */
    function _upload_image($store_id)
    {
        import('uploader.lib');
        $uploader = new Uploader();
        $uploader->allowed_type(IMAGE_FILE_TYPE);
        $uploader->allowed_size(SIZE_STORE_CERT); // 400KB

        $data = array();
        for ($i = 1; $i <= 3; $i++)
        {
            $file = $_FILES['image_' . $i];
            if ($file['error'] == UPLOAD_ERR_OK)
            {
                if (empty($file))
                {
                    continue;
                }
                $uploader->addFile($file);
                if (!$uploader->file_info())
                {
                    $this->_error($uploader->get_error());
                    return false;
                }

                $uploader->root_dir(ROOT_PATH);
                $dirname   = 'data/files/mall/application';
                $filename  = 'store_' . $store_id . '_' . $i;
                $data['image_' . $i] = $uploader->save($dirname, $filename);
            }
        }
        return $data;
    }

    /* ȡ�õ��̷��� */
    function _get_scategory_options()
    {
        $mod =& m('scategory');
        $scategories = $mod->get_list();
        import('tree.lib');
        $tree = new Tree();
        $tree->setTree($scategories, 'cate_id', 'parent_id', 'cate_name');
        return $tree->getOptions();
    }
}

?>
