<?php

/* 会员控制器 */
class UpgradeApp extends BackendApp
{
    

    function __construct()
    {
        parent::__construct();
    }

    function index()
    {
		$uprecode_mod = & m('uprecode');
		$y = date("Y");
		$m = date("m");
		$d = date("d");
		$day_start = mktime(0,0,0,$m,$d,$y);
		$day_end = mktime(23,59,59,$m,$d,$y);
		$page = $this->_get_page(10);  //获取分页信息
		$list = $uprecode_mod->find(array(
			'conditions'    => "`time` > $day_start AND `time` < $day_end",
            'limit'         => $page['limit'],  //获取当前页的数据
			'order'         => '`time` DESC ', //必须加别名
            'count'         => true             //允许统计
        )); 
		$page['item_count'] = $uprecode_mod->getCount();   //获取统计的数据
		$this->_format_page($page);
		$this->assign('page_info', $page);
		$this->assign('time',gmtime());
		$this->assign('list',$list);
		$this->display('upgrade.index.html');
    }
	
	function search(){
		if(IS_POST){
			$time_start = $_POST['time_start'];
			$time_end = $_POST['time_end'];
			$condition = $_POST['condition'];
			$query = $_POST['query'];
			if($time_start != '' && $time_end != '' && $query == ''){
				if(strtotime($time_start) > strtotime($time_end)){
					$this->show_warning("输入错误，起始时间大于结束时间，请重新输入！", 'go_back', '/admin/index.php?app=upgrade');
				}
				else{
					$uprecode_mod = & m('uprecode');
					$page = $this->_get_page(10);  //获取分页信息
					$list = $uprecode_mod->find(array(
						'conditions'    => "`time` > UNIX_TIMESTAMP('$time_start, 00:00:00') AND `time` < UNIX_TIMESTAMP('$time_end, 23:59:59')",
						'limit'         => $page['limit'],  //获取当前页的数据
						'order'         => '`time` DESC ', //必须加别名
						'count'         => true             //允许统计
					)); 
					$page['item_count'] = $uprecode_mod->getCount();   //获取统计的数据
					$this->_format_page($page);
                    $page['npage'] = $page['curr_page'] + 1;
                    $page['ppage'] = $page['curr_page'] - 1;
					$this->assign('page_info', $page);
					$this->assign('time_start', $time_start);
					$this->assign('time_end', $time_end);
					$this->assign('list', $list);
					$this->display('upgrade.search.html');
				}
			}
			else if($time_start == '' && $time_end == '' && $query != ''){
				$uprecode_mod = & m('uprecode');
				$page = $this->_get_page(10);  //获取分页信息
				$list = $uprecode_mod->find(array(
					'conditions'    => "$condition = '$query'",
					'limit'         => $page['limit'],  //获取当前页的数据
					'order'         => '`time` DESC ', //必须加别名
					'count'         => true             //允许统计
				)); 
				$page['item_count'] = $uprecode_mod->getCount();   //获取统计的数据
				$this->_format_page($page);
                $page['npage'] = $page['curr_page'] + 1;
                $page['ppage'] = $page['curr_page'] - 1;
				$this->assign('page_info', $page);
				$this->assign('condition', $condition);
				$this->assign('query', $query);
				$this->assign('list',$list);
				$this->display('upgrade.search.html');
			}
			else if($time_start != '' && $time_end != '' && $query != ''){
				if(strtotime($time_start) > strtotime($time_end)){
					$this->show_warning("输入错误，起始时间大于结束时间，请重新输入！", 'go_back', '/admin/index.php?app=upgrade');
				}
				else{
					$uprecode_mod = & m('uprecode');
					$page = $this->_get_page(10);  //获取分页信息
					$list = $uprecode_mod->find(array(
						'conditions'    => "$condition = '$query' AND `time` > UNIX_TIMESTAMP('$time_start, 00:00:00') AND `time` < UNIX_TIMESTAMP('$time_end, 23:59:59')",
						'limit'         => $page['limit'],  //获取当前页的数据
						'order'         => '`time` DESC ', //必须加别名
						'count'         => true             //允许统计
					)); 
					$page['item_count'] = $uprecode_mod->getCount();   //获取统计的数据
					$this->_format_page($page);
                    $page['npage'] = $page['curr_page'] + 1;
                    $page['ppage'] = $page['curr_page'] - 1;
					$this->assign('page_info', $page);
					$this->assign('condition', $condition);
					$this->assign('query', $query);
					$this->assign('time_start', $time_start);
					$this->assign('time_end', $time_end);
					$this->assign('list',$list);
					$this->display('upgrade.search.html');
				}
			}
			else if($time_start == '' && $time_end == '' && $query == ''){
				$this->show_warning("请输入搜索条件！", 'go_back', '/admin/index.php?app=upgrade');
			}
		}
        //分页
		else{
            if(isset($_GET['page'])){
                $time_start = $_GET['ts'];
                $time_end = $_GET['te'];
                $condition = $_GET['c'];
                $query = $_GET['q'];
                if($time_start != '' && $time_end != '' && $query == ''){
                    if(strtotime($time_start) > strtotime($time_end)){
                        $this->show_warning("输入错误，起始时间大于结束时间，请重新输入！", 'go_back', '/admin/index.php?app=upgrade');
                    }
                    else{
                        $uprecode_mod = & m('uprecode');
                        $page = $this->_get_page(10);  //获取分页信息
                        $list = $uprecode_mod->find(array(
                            'conditions'    => "`time` > UNIX_TIMESTAMP('$time_start, 00:00:00') AND `time` < UNIX_TIMESTAMP('$time_end, 23:59:59')",
                            'limit'         => $page['limit'],  //获取当前页的数据
                            'order'         => '`time` DESC ', //必须加别名
                            'count'         => true             //允许统计
                        ));
                        $page['item_count'] = $uprecode_mod->getCount();   //获取统计的数据
                        $this->_format_page($page);
                        $page['npage'] = $page['curr_page'] + 1;
                        $page['ppage'] = $page['curr_page'] - 1;
                        $this->assign('page_info', $page);
                        $this->assign('time_start', $time_start);
                        $this->assign('time_end', $time_end);
                        $this->assign('list', $list);
                        $this->display('upgrade.search.html');
                    }
                }
                else if($time_start == '' && $time_end == '' && $query != ''){
                    $uprecode_mod = & m('uprecode');
                    $page = $this->_get_page(10);  //获取分页信息
                    $list = $uprecode_mod->find(array(
                        'conditions'    => "$condition = '$query'",
                        'limit'         => $page['limit'],  //获取当前页的数据
                        'order'         => '`time` DESC ', //必须加别名
                        'count'         => true             //允许统计
                    ));
                    $page['item_count'] = $uprecode_mod->getCount();   //获取统计的数据
                    $this->_format_page($page);
                    $page['npage'] = $page['curr_page'] + 1;
                    $page['ppage'] = $page['curr_page'] - 1;
                    $this->assign('page_info', $page);
                    $this->assign('condition', $condition);
                    $this->assign('query', $query);
                    $this->assign('list',$list);
                    $this->display('upgrade.search.html');
                }
                else if($time_start != '' && $time_end != '' && $query != ''){
                    if(strtotime($time_start) > strtotime($time_end)){
                        $this->show_warning("输入错误，起始时间大于结束时间，请重新输入！", 'go_back', '/admin/index.php?app=upgrade');
                    }
                    else{
                        $uprecode_mod = & m('uprecode');
                        $page = $this->_get_page(10);  //获取分页信息
                        $list = $uprecode_mod->find(array(
                            'conditions'    => "$condition = '$query' AND `time` > UNIX_TIMESTAMP('$time_start, 00:00:00') AND `time` < UNIX_TIMESTAMP('$time_end, 23:59:59')",
                            'limit'         => $page['limit'],  //获取当前页的数据
                            'order'         => '`time` DESC ', //必须加别名
                            'count'         => true             //允许统计
                        ));
                        $page['item_count'] = $uprecode_mod->getCount();   //获取统计的数据
                        $this->_format_page($page);
                        $page['npage'] = $page['curr_page'] + 1;
                        $page['ppage'] = $page['curr_page'] - 1;
                        $this->assign('page_info', $page);
                        $this->assign('condition', $condition);
                        $this->assign('query', $query);
                        $this->assign('time_start', $time_start);
                        $this->assign('time_end', $time_end);
                        $this->assign('list',$list);
                        $this->display('upgrade.search.html');
                    }
                }
                else if($time_start == '' && $time_end == '' && $query == ''){
                    $this->show_warning("请输入搜索条件！", 'go_back', '/admin/index.php?app=upgrade');
                }
            }else {
                $this->show_warning("请输入搜索条件！", 'go_back', '/admin/index.php?app=upgrade');
            }
		}
	}
	
	
}

?>
