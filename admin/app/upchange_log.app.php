<?php

/* 会员控制器 */
class Upchange_logApp extends BackendApp
{
    

    function __construct()
    {
        parent::__construct();
    }

    function index()
    {
        if(strpos($_SERVER["HTTP_USER_AGENT"], "MSIE")){
            exit("为了更好的用户体验，请不要使用IE浏览器！");
        }
        $log_mod =& m('upchange_log');
        $where = '';
        if(isset($_GET['user_name'])){
            $user_name = isset($_GET['user_name']) ? $this->checkVar($_GET['user_name']) : '';
            $upuser = isset($_GET['upuser']) ? $this->checkVar($_GET['upuser']) : '';
            $where.= !empty($user_name) ? " `user_name` = '$user_name' " : " 1=1 ";
            $where.= !empty($upuser) ? " AND `upuser` = '$upuser'" : '';
            $this->assign('user_name', $user_name);
            $this->assign('upuser', $upuser);
        }
        $page = $this->_get_page(10);  //获取分页信息
        $list = $log_mod->find(array(
            'conditions'    => $where,
            'limit'         => $page['limit'],  //获取当前页的数据
            'order'         => '', //必须加别名
            'count'         => true             //允许统计
        ));
        $page['item_count'] = $log_mod->getCount();   //获取统计的数据
        $this->_format_page($page);
        $this->assign('page_info', $page);
        $this->assign('list', $list);
        $this->display('upchange_log.index.html');
    }
}

?>
