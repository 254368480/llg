<?php

class DefaultApp extends MallbaseApp
{
    function index()
    {
        $this->assign('index', 1); // 标识当前页面是首页，用于设置导航状态
        $this->assign('icp_number', Conf::get('icp_number'));

        /* 热门搜素 */
        $this->assign('hot_keywords', $this->_get_hot_keywords());

        $this->_config_seo(array(
            'title' =>  Conf::get('site_title'),
        ));
		
		 /* 取得商品分类 */
        $gcategorys = $this->_list_gcategory();
		
		/* 取得合作伙伴 */
		$partner_mod =& m('partner');
		$partner = $partner_mod->find(array(
		'conditions'    => 'store_id = 0',
                'order' => 'sort_order',
                'limit' => '0,6',
		));
		
		/* 取得商城公告 */
		
		$article_mod =& m('article');
        $art = $article_mod->find(array(
                'conditions'    => 'cate_id= 2 AND if_show = 1',
                'order'         => 'sort_order ASC, add_time DESC',
                'fields'        => 'article_id, title, add_time',
                'limit'         => '0,5',
        ));
		
		$art_all[35] = $this->_get_art('cate_id= 35 AND if_show = 1');
		$art_all[36] = $this->_get_art('cate_id= 36 AND if_show = 1');
		$art_all[37] = $this->_get_art('cate_id= 37 AND if_show = 1');
		$art_all[38] = $this->_get_art('cate_id= 38 AND if_show = 1');
		$art_all[39] = $this->_get_art('cate_id= 39 AND if_show = 1');
		
		/*取得本周热销*/
		$recom_mod =& m('recommend');
        $recom[16] = $recom_mod->get_recommended_goods(16, 4, true); //取得本周热销
		$recom[17] = $recom_mod->get_recommended_goods(17, 4, true); //取得本周热销
		$recom[18] = $recom_mod->get_recommended_goods(18, 4, true); //取得本周热销
		$recom[19] = $recom_mod->get_recommended_goods(19, 14, true); //取得本周热销
		$recom[20] = $recom_mod->get_recommended_goods(20, 14, true); //取得本周热销
		$recom[22] = $recom_mod->get_recommended_goods(22, 4, true); //取得本周热销
		
		/*取得店铺*/
		$recommended_stores = $this->_recommended_stores(6);
		
		
		$this->assign('recommended_stores', $recommended_stores);
		$this->assign('partner', $partner);
		$this->assign('art_all', $art_all);
		$this->assign('recom', $recom);
		$this->assign('art', $art);
		$this->assign('gcategorys', $gcategorys);
        $this->assign('page_description', Conf::get('site_description'));
        $this->assign('page_keywords', Conf::get('site_keywords'));
        $this->display('index.html');
    }
	
	function payint(){
        if(!empty($_POST['dosubmit'])) {
            $int = intval($this->_check_input($_POST['itotal']));
            $user_name = $this->_check_input($_POST['user_name']);
            $password = $this->_check_input($_POST['password']);
            $touser = $this->_check_input($_POST['touser']);

            $user_mod =& m('member');
            $sql = "SELECT * FROM {$user_mod->table} where user_name  = '$user_name'";
            $user = $user_mod->getRow($sql);
            if(!empty($user)){
                $sql = "SELECT * FROM {$user_mod->table} where user_name  = '$touser'";
                $tuser = $user_mod->getRow($sql);
                if(empty($tuser)){
                    $this->show_warning('支付失败，接受积分的用户不存在！');
                    exit;
                }
                if($user['password'] != md5($password)){
                    $this->show_warning('支付失败，密码输入错误！');
                    exit;
                }
                if($user['grade'] == "免费会员"){
                    $this->show_warning('支付失败，免费会员无法支付！');
                    exit;
                }
                if($int > $user['integral']){
                    $this->show_warning('支付失败，用户积分不足！');
                    exit;
                }
                $this->db = &db();
                $sql = "UPDATE {$user_mod->table} SET integral = integral - '$int' WHERE user_id = '$user[user_id]'";
                $this->db->query($sql);
                $sql = "UPDATE {$user_mod->table} SET integral = integral + '$int' WHERE user_id = '$tuser[user_id]'";
                $this->db->query($sql);

                $recode_mod =& m('recode');
                $data = array(
                    'touser' => $touser,
                    'fromuser' => $user['user_name'],
                    'integral' => $int,
                    'content' => '实体店购买物品支付积分！',
                    'time' => gmtime()
                );
                $recode_mod->add($data);
                $this->show_message('支付成功！', '返回首页', '/');
                exit;
            }else{
                $this->show_warning('支付失败，支付用户不存在！');
                exit;
            }
        }else{
            $this->show_warning('未定义操作！');
            exit;
        }
    }

    function backint(){
        if(!empty($_POST['dosubmit'])) {
            $int = intval($this->_check_input($_POST['int']));
            $user_name = $this->_check_input($_POST['shop_user']);
            $buyer = $this->_check_input($_POST['buyer']);

            $user_mod =& m('member');
            $sql = "SELECT * FROM {$user_mod->table} where user_name  = '$user_name'";
            $user = $user_mod->getRow($sql);
            if(!empty($user)){
                $sql = "SELECT * FROM {$user_mod->table} where user_name  = '$buyer'";
                $tuser = $user_mod->getRow($sql);
                if(empty($tuser)){
                    $this->show_warning('支付失败，接受积分的用户不存在！');
                    exit;
                }
                if($int > $user['integral']){
                    $this->show_warning('支付失败，用户积分不足！');
                    exit;
                }
                $this->db = &db();
                $sql = "UPDATE {$user_mod->table} SET integral = integral - '$int' WHERE user_id = '$user[user_id]'";
                $this->db->query($sql);
                $sql = "UPDATE {$user_mod->table} SET integral = integral + '$int' WHERE user_id = '$tuser[user_id]'";
                $this->db->query($sql);

                $recode_mod =& m('recode');
                $data = array(
                    'touser' => $buyer,
                    'fromuser' => $user['user_name'],
                    'integral' => $int,
                    'content' => '实体店退货返还积分！',
                    'time' => gmtime()
                );
                $recode_mod->add($data);
                $this->show_message('支付成功！', '返回首页', '/');
                exit;
            }else{
                $this->show_warning('支付失败，支付用户不存在！');
                exit;
            }
        }else{
            $this->show_warning('未定义操作！');
            exit;
        }
    }
	
	function _check_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

	
	//取得文章
	function _get_art($conditions){
			 $article_mod =& m('article');
			 $art = $article_mod->find(array(
                'conditions'    => $conditions,
                'order'         => 'sort_order ASC, add_time DESC',
                'fields'        => 'article_id, title',
                'limit'         => '0,4',
       		 ));
			 return $art;
	}
	
    function _get_hot_keywords()
    {
        $keywords = explode(',', conf::get('hot_search'));
        return $keywords;
    }
	
	
	 function _list_gcategory()
    {
        $cache_server =& cache_server();
        $key = 'page_goods_category';
        $data = $cache_server->get($key);
        if ($data === false)
        {
            $gcategory_mod =& bm('gcategory', array('_store_id' => 0));
            $gcategories = $gcategory_mod->get_list(-1,true);
    
            import('tree.lib');
            $tree = new Tree();
            $tree->setTree($gcategories, 'cate_id', 'parent_id', 'cate_name');
            $data = $tree->getArrayList(0);

            $cache_server->set($key, $data, 3600);
        }

        return $data;
    }
		   /* 取得推荐店铺 */
	 function _recommended_stores($num)
    {
        $store_mod =& m('store');
        $goods_mod =& m('goods');
        $stores = $store_mod->find(array(
            'conditions'    => 'recommended=1 AND state = 1',
            'order'         => 'sort_order',
            'join'          => 'belongs_to_user',
            'limit'         => '0,' . $num,
        ));
        foreach ($stores as $key => $store){
            empty($store['store_logo']) && $stores[$key]['store_logo'] = Conf::get('default_store_logo');
            $stores[$key]['goods_count'] = $goods_mod->get_count_of_store($store['store_id']);
        }
        return $stores;
    }
	
	
	
}

?>
