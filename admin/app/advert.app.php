<?php

/**
 *    广告设置控制器
 *
 *    @author    tianwei
 *    @usage    none
 */
class AdvertApp extends BackendApp
{
	/**
     *    上传默认商品图片、默认店铺标志、默认会员头像
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
     *    广告
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
     *    添加广告表单
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
     *    添加广告到数据库
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
				$this->show_message('添加成功');
				return;
		}else{ 
				$this->show_warning('系统出错');
				return;
		}
		
		
    }
	
	 /**
     *    广告预览
     *
     *    @author    tianwei
     *    @param    none
     *    @return    void
     */
	 function ad_view()
    {
        $advert_mod =& m('advert');
		$page   =   $this->_get_page(10);  //获取分页信息
		$ads = $advert_mod->find(array(
            'limit'         => $page['limit'],  //获取当前页的数据
			'order'         => 'ad_id DESC ', //必须加别名
            'count'         => true             //允许统计
        )); 
		$vip = array('免费会员', 'VIP会员', '分销商', '代理商');
		
	    $page['item_count'] = $advert_mod->getCount();   //获取统计的数据
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
			
			//删除旧图片
			if($oimg != ''){
				@unlink("../".$oimg);
			}
		}
		
		$condition = "ad_id = ".$id;
		$advert_mod->edit($condition, $data);
		$this->show_message('修改成功');
				
	}
	
	 /**
     *    广告删除
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
				$this->show_message('删除成功');
				return;
			}
			else{
				$this->show_warning('系统出错，删除失败');
				return;
			}
		}
		
		
	}


   
}
?>
