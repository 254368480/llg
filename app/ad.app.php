<?php

/*分类控制器*/
class AdApp extends MemberbaseApp
{
	 function __construct()
	{
         parent::__construct();
    }
    /* 商品分类 */
    function index()
    {
		
		
        /* 取得导航 */
        $this->assign('navs', $this->_get_navs());
		
		//取得广告
		$advert_mod =& m('advert'); 
		$page   =   $this->_get_page(16);  //获取分页信息
		$ads = $advert_mod->find(array(
            'limit'         => $page['limit'],  //获取当前页的数据
			'order'         => 'ad_id DESC ', //必须加别名
            'count'         => true             //允许统计
        )); 
		$page['item_count'] = $advert_mod->getCount();   //获取统计的数据
		$this->_format_page($page);
		$this->assign('page_info', $page);
		
		//获取当前用户信息
		$vip = array("免费用户", "VIP用户", "分销商", "代理商");
		$user_id = $this->visitor->get('user_id'); //获取当前用户Id
        $user_mod =& m('member');
		$cm = $user_mod->get_info($user_id); //获取当前用户信息
		
		 
		$c_vip = array(
		 	'免费会员'=>0,
			'VIP会员' =>1,
			'分销商'  =>2,
			'代理商'  =>3,
		);
		$con = 0;
		if($cm != ""){
		 	 $condition = array(
					'免费会员'=>20,
					'VIP会员'=>20,
					'分销商'=>50,
					'代理商'=>70,
			 );
			 //如果获得积分达到上限，那么alert达到上限
		 	 if($cm['td_int'] == $condition[$cm[grade]]){
			 		$con = 1;
			 }
		 }
        

        /* 当前位置 */
        $_curlocal=array(
            array(
                'text'  => Lang::get('index'),
                'url'   => 'index.php',
            ),
            array(
                'text'  => '赚积分',
                'url'   => '',
            ),
        );
		
		
        $this->assign('_curlocal',$_curlocal);
		$this->assign('vip',$vip);
		$this->assign('ads',$ads);
		$this->assign('cm',$cm);
		$this->assign('c_vip',$c_vip);
		$this->assign('con',$con);
       

        $this->_config_seo('title', Lang::get('赚积分') . ' - '. Conf::get('site_title'));
        $this->display('ad.index.html');
    }
	
	
	 function to_link()
    {
		 
		 $ad_id = $_GET['ad_id'];		//获取点击的广告id
		 $advert_mod =& m('advert');	
		 $sql = "select * from {$advert_mod->table} where ad_id = ".$ad_id;
		 $ad = $advert_mod->getRow($sql); //获取点击的广告信息
		 
		 $user_id = $this->visitor->get('user_id'); //获取当前用户Id
         $user_mod =& m('member');
		 $sql = "SELECT * FROM {$user_mod->table} where user_id  = ".$user_id;
		 $cm = $user_mod->getRow($sql); //获取当前用户信息
		 
		 $vip = array(
		 	'免费会员'=>0,
			'VIP会员'=>1,
			'分销商'=>2,
			'代理商'=>3,
		 );
		
		 $arr = explode(",",$cm['ad_ids']);
		 //如果用户权限不够，到这为止，跳转页面，但不加分
		 if($vip[$cm[grade]] < $ad['ad_vip']){
		 			 $this->show_warning("权限不够，无法获得积分！2秒后进入广告页...");
					 echo "<meta http-equiv=refresh content=2;url=$ad[ad_link]>";
					 return;
		 }
		 //如果用户点过这个广告，到这为止，跳转页面，但不加分
		 if(in_array($ad_id, $arr)){
			 $this->show_warning("已经点过这个广告啦，无法获得积分！2秒后进入广告页...");
			 echo "<meta http-equiv=refresh content=2;url=$ad[ad_link]>";//跳转到目标页面
			 return;
		 }
		 else{
			 $ad_ids[] = $cm['ad_ids'];
			 $ad_ids[] = $ad_id;
			 $ad_ids = implode(",",$ad_ids);
		 }
		
		 
		 if($cm != ""){
		 	 $condition = array(
					'免费会员'=>20,
					'VIP会员'=>20,
					'分销商'=>50,
					'代理商'=>70,
			 );
			 //如果限制了今日分数
			 if($cm['td_int_sx'] == '1'){
				 //如果用户积分达到每日上限，到这为止，跳转页面，但不加分
				 if($cm['td_int'] == $condition[$cm[grade]]){
						$this->show_warning("获得积分已达今日上限，无法再获得积分！2秒后进入广告页...");
						echo "<meta http-equiv=refresh content=2;url=$ad[ad_link]>";//跳转到目标页面
						return;
				 }
				 $int = $cm['integral'] + $ad['ad_int'];
				 $td_int = $cm['td_int'] + $ad['ad_int'];
				 
				 //如果积分超过每日上限，那么将今日获得积分改为上限
				 if($td_int >= $condition[$cm[grade]]){
							 $m_int = $td_int - $condition[$cm[grade]];     //积分多出今日上限的部分
							 $td_int = $condition[$cm[grade]];				//今日所获得积分为上限值;
							 $int = $int - $m_int;							//用户积分为上限值
				 }
			 }
			 else{
			 	//如果用户积分达到每日上限，到这为止，跳转页面，但不加分
				 if($cm['td_int'] == $cm['td_int_sx']){
						$this->show_warning("获得积分已达今日上限，无法再获得积分！2秒后进入广告页...");
						echo "<meta http-equiv=refresh content=2;url=$ad[ad_link]>";//跳转到目标页面
						return;
				 }
				 $int = $cm['integral'] + $ad['ad_int'];
				 $td_int = $cm['td_int'] + $ad['ad_int'];
				 
				 //如果积分超过每日上限，那么将今日获得积分改为上限
				 if($td_int >= $cm['td_int_sx']){
							 $m_int = $td_int - $cm['td_int_sx'];     //积分多出今日上限的部分
							 $td_int = $cm['td_int_sx'];				//今日所获得积分为上限值;
							 $int = $int - $m_int;							//用户积分为上限值
				 }
			 }
			 $data = array('integral'=>$int, 'td_int'=>$td_int, 'ad_ids'=>$ad_ids);
			 if($user_mod->edit($cm['user_id'], $data)){
				
			 }
			 else{
				$this->show_warning("系统出错");
				return;		 
			 }
		 }
		
		 
		
		 $this->show_message("获得$ad[ad_int]积分！2秒后进入广告页...");
		 echo "<meta http-equiv=refresh content=2;url=$ad[ad_link]>";//跳转到目标页面
		 
	}
     
    
}

?>