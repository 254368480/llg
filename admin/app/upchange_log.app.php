<?php

/* ��Ա������ */
class Upchange_logApp extends BackendApp
{
    

    function __construct()
    {
        parent::__construct();
    }

    function index()
    {
        if(strpos($_SERVER["HTTP_USER_AGENT"], "MSIE")){
            exit("Ϊ�˸��õ��û����飬�벻Ҫʹ��IE�������");
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
        $page = $this->_get_page(10);  //��ȡ��ҳ��Ϣ
        $list = $log_mod->find(array(
            'conditions'    => $where,
            'limit'         => $page['limit'],  //��ȡ��ǰҳ������
            'order'         => '', //����ӱ���
            'count'         => true             //����ͳ��
        ));
        $page['item_count'] = $log_mod->getCount();   //��ȡͳ�Ƶ�����
        $this->_format_page($page);
        $this->assign('page_info', $page);
        $this->assign('list', $list);
        $this->display('upchange_log.index.html');
    }
}

?>
