<?php

/* ��Ա������ */
class IntApp extends BackendApp
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
		$mf = array();
		$vip = array();
		$fxs = array();
		$dls = array();
		 $mf =  $this->_user_mod->getRow("SELECT sum(integral),sum(money),count(*) FROM {$this->_user_mod->table} WHERE grade = '��ѻ�Ա'");
		$vip = $this->_user_mod->getRow("SELECT sum(integral),sum(money),count(*) FROM {$this->_user_mod->table} WHERE grade = 'VIP��Ա'");
		$fxs = $this->_user_mod->getRow("SELECT sum(integral),sum(money),count(*) FROM {$this->_user_mod->table} WHERE grade = '������'");
		$dls = $this->_user_mod->getRow("SELECT sum(integral),sum(money),count(*) FROM {$this->_user_mod->table} WHERE grade = '������'");
		
		$this->assign('mf',$mf);
		$this->assign('vip',$vip);
		$this->assign('fxs',$fxs);
		$this->assign('dls',$dls);
        $this->display('int.index.html');
    }
	
	
}

?>
