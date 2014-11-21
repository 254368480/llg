<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
	    <h1>用户激活</h1>
        <div class="wrap_line margin1">
		   
				<div style="margin-top:20px;padding-left:50px;line-height:20px;margin-bottom:30px;">
					
				<form action="index.php?app=member&act=upgrade" method="post" name="theForm">
					<table width="500">
                        <tr>
                            <th>申请人</th><th>目标等级</th><th>申请时间</th><th>操作</th>
                            <?php $_from = $this->_var['applys']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'value');if (count($_from)):
    foreach ($_from AS $this->_var['value']):
?>
                                <tr>
                                    <td align="center"><?php echo $this->_var['value']['user_name']; ?></td>
                                    <td align="center"><?php echo $this->_var['arr'][$this->_var['value']['grade']]; ?></td>
                                    <td align="center"><?php echo local_date("Y-m-d",$this->_var['value']['time']); ?></td>
                                    <td align="center"><a href="/index.php?app=member&act=upgrade&id=<?php echo $this->_var['value']['id']; ?>&do=1">通过</a> | <a href="/index.php?app=member&act=upgrade&id=<?php echo $this->_var['value']['id']; ?>&do=0">拒绝</a></td>
                                </tr>
                            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                        </tr>
                    </table>
				</form>
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
