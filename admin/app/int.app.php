<?php

/* 会员控制器 */
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
		 $mf =  $this->_user_mod->getRow("SELECT sum(integral),sum(money),count(*) FROM {$this->_user_mod->table} WHERE grade = '免费会员'");
		$vip = $this->_user_mod->getRow("SELECT sum(integral),sum(money),count(*) FROM {$this->_user_mod->table} WHERE grade = 'VIP会员'");
		$fxs = $this->_user_mod->getRow("SELECT sum(integral),sum(money),count(*) FROM {$this->_user_mod->table} WHERE grade = '分销商'");
		$dls = $this->_user_mod->getRow("SELECT sum(integral),sum(money),count(*) FROM {$this->_user_mod->table} WHERE grade = '代理商'");
		
		$this->assign('mf',$mf);
		$this->assign('vip',$vip);
		$this->assign('fxs',$fxs);
		$this->assign('dls',$dls);
        $this->display('int.index.html');
    }
	
	
}

?>
