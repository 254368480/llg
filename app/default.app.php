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
        $recom1 = $recom_mod->get_recommended_goods(16, 4, true); //取得本周热销
		$recom2 = $recom_mod->get_recommended_goods(17, 4, true); //取得本周热销
		$recom3 = $recom_mod->get_recommended_goods(18, 4, true); //取得本周热销
		$recom4 = $recom_mod->get_recommended_goods(19, 14, true); //取得本周热销
		$recom5 = $recom_mod->get_recommended_goods(20, 14, true); //取得本周热销
		
		/*取得店铺*/
		$recommended_stores = $this->_recommended_stores(6);
		
		
		$this->assign('recommended_stores', $recommended_stores);
		$this->assign('partner', $partner);
		$this->assign('art_all', $art_all);
		$this->assign('recom1', $recom1);
		$this->assign('recom2', $recom2);
		$this->assign('recom3', $recom3);
		$this->assign('recom4', $recom4);
		$this->assign('recom5', $recom5);
		$this->assign('art', $art);
		$this->assign('gcategorys', $gcategorys);
        $this->assign('page_description', Conf::get('site_description'));
        $this->assign('page_keywords', Conf::get('site_keywords'));
        $this->display('index.html');
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
