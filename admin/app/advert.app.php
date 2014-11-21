<?php

/**
 *    ������ÿ�����
 *
 *    @author    tianwei
 *    @usage    none
 */
class AdvertApp extends BackendApp
{
	/**
     *    �ϴ�Ĭ����ƷͼƬ��Ĭ�ϵ��̱�־��Ĭ�ϻ�Աͷ��
     *
     *    @author    Hyber
     *    @param     array  $images
     *    @return    array
     */
	 function _upload_images($name)
    {
            import('uploader.lib');
            
            $file = $_FILES['ad_img'];
			
            if ($file['error'] != UPLOAD_ERR_OK)
            {
                continue;
            }
            $uploader = new Uploader();
            $uploader->allowed_type(IMAGE_FILE_TYPE);
            $uploader->addFile($file);
            if ($uploader->file_info() === false)
            {
                continue;
            }
            $uploader->root_dir(ROOT_PATH);
            $image_urls = $uploader->save('ad', $name);
        

        return $image_urls;
    }
	
    /**
     *    ���
     *
     *    @author    tianwei
     *    @param    none
     *    @return    void
     */
    function index()
    {
        
        $this->import_resource(array('script' => 'inline_edit.js,jquery.ui/jquery.ui.js,jquery.ui/i18n/' . i18n_code() . '.js',
                                      'style'=> 'jquery.ui/themes/ui-lightness/jquery.ui.css'));
        $this->display('advert.index.html');
    }
	
	
	 /**
     *    ��ӹ���
     *
     *    @author    tianwei
     *    @param    none
     *    @return    void
     */
	 function ad_add()
    {
        
        $this->import_resource(array('script' => 'pd.js'));
        $this->display('advert.index.html');
    }
	
	 /**
     *    ��ӹ�浽���ݿ�
     *
     *    @author    tianwei
     *    @param    none
     *    @return    void
     */
	 function to_add()
    {
       
		$advert_mod =& m('advert');
		
		$name = $_POST['ad_name'];
		$time = gmtime();
		$img_url = $this->_upload_images($time);
		$data = array(
				'ad_name' => $name,
			  	 'ad_img' => $img_url,
				'ad_link' => $_POST['ad_link'],
			     'ad_int' => $_POST['ad_int'],
				 'ad_vip' => $_POST['ad_vip'],
		);
		 
		if($advert_mod->add($data)){
				$this->show_message('��ӳɹ�');
				return;
		}else{ 
				$this->show_warning('ϵͳ����');
				return;
		}
		
		
    }
	
	 /**
     *    ���Ԥ��
     *
     *    @author    tianwei
     *    @param    none
     *    @return    void
     */
	 function ad_view()
    {
        $advert_mod =& m('advert');
		$page   =   $this->_get_page(10);  //��ȡ��ҳ��Ϣ
		$ads = $advert_mod->find(array(
            'limit'         => $page['limit'],  //��ȡ��ǰҳ������
			'order'         => 'ad_id DESC ', //����ӱ���
            'count'         => true             //����ͳ��
        )); 
		$vip = array('��ѻ�Ա', 'VIP��Ա', '������', '������');
		
	    $page['item_count'] = $advert_mod->getCount();   //��ȡͳ�Ƶ�����
		$this->_format_page($page);
		$this->assign('page_info', $page);
		$this->assign('vip', $vip);
		
		$this->assign('ads', $ads);
        $this->display('advert.view.html');
	}
	
	 function ad_edit()
    {
        $advert_mod =& m('advert');
		$id = $_GET['ad_id'];
		$sql = "SELECT * FROM {$advert_mod->table} WHERE `ad_id` = ".$id;
		$ads = $advert_mod->getRow($sql);
		$this->assign('ads', $ads);
        $this->display('advert.edit.html');
	}
	
	 function ad_toedit()
    {
        $advert_mod =& m('advert');
		$id = $_POST['id'];
		$name = $_POST['ad_name'];
		$oimg = $_POST['old_img'];
		$file = $_FILES['ad_img'];
		
		$data = array(
				'ad_name' => $name,
			  	'ad_link' => $_POST['ad_link'],
			     'ad_int' => $_POST['ad_int'],
				 'ad_vip' => $_POST['ad_vip'],
		);
		
		if($file['name'] != ''){
			$time = gmtime();
			$img_url = $this->_upload_images($time);
			$data['ad_img'] = $img_url;
			
			//ɾ����ͼƬ
			if($oimg != ''){
				@unlink("../".$oimg);
			}
		}
		
		$condition = "ad_id = ".$id;
		$advert_mod->edit($condition, $data);
		$this->show_message('�޸ĳɹ�');
				
	}
	
	 /**
     *    ���ɾ��
     *
     *    @author    tianwei
     *    @param    none
     *    @return    void
     */
	 function ad_drop()
    {
        $advert_mod =& m('advert');
		$id = $_GET['ad_id'];
		
		if($id != ''){
			$sql = "SELECT `ad_img` FROM {$advert_mod->table} WHERE `ad_id` = ".$id;
			$img = $advert_mod->getRow($sql);
			
			if($advert_mod->drop($id)){
				unlink("../".$img['ad_img']);
				$this->show_message('ɾ���ɹ�');
				return;
			}
			else{
				$this->show_warning('ϵͳ����ɾ��ʧ��');
				return;
			}
		}
		
		
	}


   
}
?>
