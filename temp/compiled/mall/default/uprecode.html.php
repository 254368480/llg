<?php echo $this->fetch('member.header.html'); ?>
<link rel="stylesheet" type="text/css" href="<?php echo $this->res_base . "/" . 'date/style.css'; ?>">
<script type="text/javascript" src="<?php echo $this->res_base . "/" . 'date/date.js'; ?>"></script>
<script type="text/javascript">
    $(function () {
        $("input.date").manhuaDate({
            Event: "click", //可选
            Left: 0, //弹出时间停靠的左边位置
            Top: -16, //弹出时间停靠的顶部边位置
            fuhao: "-", //日期连接符默认为-
            isTime: false, //是否开启时间值默认为false
            beginY: 1949, //年份的开始默认为1949
            endY: 2100//年份的结束默认为2049
        });
    });
</script>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
	    <h1>升级记录查看</h1>
        <div class="wrap_line margin1">
		   
				<div style="margin-top:20px;padding-left:50px;line-height:20px;margin-bottom:30px;">
                    <form name="theform" method="post" action="/index.php?app=member&act=uprecode">
                        时间从：<input type="text" class="date" name="star"> 到：<input type="text" class="date" name="end"><input type="submit">
                    </form>
					<table width="700">
                            <tr>
                                <th>升级用户</th><th>操作人</th><th>升级时间</th><th>升级前等级</th><th>升级后等级</th>
                            </tr>
                        <?php $_from = $this->_var['uprecodes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'value');if (count($_from)):
    foreach ($_from AS $this->_var['value']):
?>
                        <tr>
                            <td align="center"><?php echo $this->_var['value']['user_name']; ?></td>
                            <td align="center"><?php echo $this->_var['value']['operator']; ?></td>
                            <td align="center"><?php echo local_date("Y-m-d",$this->_var['value']['time']); ?></td>
                            <td align="center"><?php echo $this->_var['value']['grade']; ?></td>
                            <td align="center"><?php echo $this->_var['value']['upgrade']; ?></td>
                        </tr>
                        <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                    </table>

				</div>

				
			
				
            <div class="wrap_bottom"></div>
        </div>
        


        <div class="clear"></div>
        <div class="adorn_right1"></div>
        <div class="adorn_right2"></div>
        <div class="adorn_right3"></div>
        <div class="adorn_right4"></div>
    </div>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>
