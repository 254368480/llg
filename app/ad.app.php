<?php

/*���������*/
class AdApp extends MemberbaseApp
{
	 function __construct()
	{
         parent::__construct();
    }
    /* ��Ʒ���� */
    function index()
    {
		
		
        /* ȡ�õ��� */
        $this->assign('navs', $this->_get_navs());
		
		//ȡ�ù��
		$advert_mod =& m('advert'); 
		$page   =   $this->_get_page(16);  //��ȡ��ҳ��Ϣ
		$ads = $advert_mod->find(array(
            'limit'         => $page['limit'],  //��ȡ��ǰҳ������
			'order'         => 'ad_id DESC ', //����ӱ���
            'count'         => true             //����ͳ��
        )); 
		$page['item_count'] = $advert_mod->getCount();   //��ȡͳ�Ƶ�����
		$this->_format_page($page);
		$this->assign('page_info', $page);
		
		//��ȡ��ǰ�û���Ϣ
		$vip = array("����û�", "VIP�û�", "������", "������");
		$user_id = $this->visitor->get('user_id'); //��ȡ��ǰ�û�Id
        $user_mod =& m('member');
		$cm = $user_mod->get_info($user_id); //��ȡ��ǰ�û���Ϣ
		
		 
		$c_vip = array(
		 	'��ѻ�Ա'=>0,
			'VIP��Ա' =>1,
			'������'  =>2,
			'������'  =>3,
		);
		$con = 0;
		if($cm != ""){
		 	 $condition = array(
					'��ѻ�Ա'=>20,
					'VIP��Ա'=>20,
					'������'=>50,
					'������'=>70,
			 );
			 //�����û��ִﵽ���ޣ���ôalert�ﵽ����
		 	 if($cm['td_int'] == $condition[$cm[grade]]){
			 		$con = 1;
			 }
		 }
        

        /* ��ǰλ�� */
        $_curlocal=array(
            array(
                'text'  => Lang::get('index'),
                'url'   => 'index.php',
            ),
            array(
                'text'  => '׬����',
                'url'   => '',
            ),
        );
		
		
        $this->assign('_curlocal',$_curlocal);
		$this->assign('vip',$vip);
		$this->assign('ads',$ads);
		$this->assign('cm',$cm);
		$this->assign('c_vip',$c_vip);
		$this->assign('con',$con);
       

        $this->_config_seo('title', Lang::get('׬����') . ' - '. Conf::get('site_title'));
        $this->display('ad.index.html');
    }
	
	
	 function to_link()
    {
		 
		 $ad_id = $_GET['ad_id'];		//��ȡ����Ĺ��id
		 $advert_mod =& m('advert');	
		 $sql = "select * from {$advert_mod->table} where ad_id = ".$ad_id;
		 $ad = $advert_mod->getRow($sql); //��ȡ����Ĺ����Ϣ
		 
		 $user_id = $this->visitor->get('user_id'); //��ȡ��ǰ�û�Id
         $user_mod =& m('member');
		 $sql = "SELECT * FROM {$user_mod->table} where user_id  = ".$user_id;
		 $cm = $user_mod->getRow($sql); //��ȡ��ǰ�û���Ϣ
		 
		 $vip = array(
		 	'��ѻ�Ա'=>0,
			'VIP��Ա'=>1,
			'������'=>2,
			'������'=>3,
		 );
		
		 $arr = explode(",",$cm['ad_ids']);
		 //����û�Ȩ�޲���������Ϊֹ����תҳ�棬�����ӷ�
		 if($vip[$cm[grade]] < $ad['ad_vip']){
		 			 $this->show_warning("Ȩ�޲������޷���û��֣�2��������ҳ...");
					 echo "<meta http-equiv=refresh content=2;url=$ad[ad_link]>";
					 return;
		 }
		 //����û���������棬����Ϊֹ����תҳ�棬�����ӷ�
		 if(in_array($ad_id, $arr)){
			 $this->show_warning("�Ѿ���������������޷���û��֣�2��������ҳ...");
			 echo "<meta http-equiv=refresh content=2;url=$ad[ad_link]>";//��ת��Ŀ��ҳ��
			 return;
		 }
		 else{
			 $ad_ids[] = $cm['ad_ids'];
			 $ad_ids[] = $ad_id;
			 $ad_ids = implode(",",$ad_ids);
		 }
		
		 
		 if($cm != ""){
		 	 $condition = array(
					'��ѻ�Ա'=>20,
					'VIP��Ա'=>20,
					'������'=>50,
					'������'=>70,
			 );
			 //��������˽��շ���
			 if($cm['td_int_sx'] == '1'){
				 //����û����ִﵽÿ�����ޣ�����Ϊֹ����תҳ�棬�����ӷ�
				 if($cm['td_int'] == $condition[$cm[grade]]){
						$this->show_warning("��û����Ѵ�������ޣ��޷��ٻ�û��֣�2��������ҳ...");
						echo "<meta http-equiv=refresh content=2;url=$ad[ad_link]>";//��ת��Ŀ��ҳ��
						return;
				 }
				 $int = $cm['integral'] + $ad['ad_int'];
				 $td_int = $cm['td_int'] + $ad['ad_int'];
				 
				 //������ֳ���ÿ�����ޣ���ô�����ջ�û��ָ�Ϊ����
				 if($td_int >= $condition[$cm[grade]]){
							 $m_int = $td_int - $condition[$cm[grade]];     //���ֶ���������޵Ĳ���
							 $td_int = $condition[$cm[grade]];				//��������û���Ϊ����ֵ;
							 $int = $int - $m_int;							//�û�����Ϊ����ֵ
				 }
			 }
			 else{
			 	//����û����ִﵽÿ�����ޣ�����Ϊֹ����תҳ�棬�����ӷ�
				 if($cm['td_int'] == $cm['td_int_sx']){
						$this->show_warning("��û����Ѵ�������ޣ��޷��ٻ�û��֣�2��������ҳ...");
						echo "<meta http-equiv=refresh content=2;url=$ad[ad_link]>";//��ת��Ŀ��ҳ��
						return;
				 }
				 $int = $cm['integral'] + $ad['ad_int'];
				 $td_int = $cm['td_int'] + $ad['ad_int'];
				 
				 //������ֳ���ÿ�����ޣ���ô�����ջ�û��ָ�Ϊ����
				 if($td_int >= $cm['td_int_sx']){
							 $m_int = $td_int - $cm['td_int_sx'];     //���ֶ���������޵Ĳ���
							 $td_int = $cm['td_int_sx'];				//��������û���Ϊ����ֵ;
							 $int = $int - $m_int;							//�û�����Ϊ����ֵ
				 }
			 }
			 $data = array('integral'=>$int, 'td_int'=>$td_int, 'ad_ids'=>$ad_ids);
			 if($user_mod->edit($cm['user_id'], $data)){
				
			 }
			 else{
				$this->show_warning("ϵͳ����");
				return;		 
			 }
		 }
		
		 
		
		 $this->show_message("���$ad[ad_int]���֣�2��������ҳ...");
		 echo "<meta http-equiv=refresh content=2;url=$ad[ad_link]>";//��ת��Ŀ��ҳ��
		 
	}
     
    
}

?>