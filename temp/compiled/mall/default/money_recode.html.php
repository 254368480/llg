<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
	    <h1>转账操作记录</h1>
        <div class="wrap_line margin1">
		    <table class="recode_table" border="3" >
				<tr>
					<th align="left">转出会员</th>
					<th align="left">转入会员</th>
					<th align="left">操作金额</th>
					<th align="left">操作时间</th>
					<th align="left">操作说明</th>
				</tr>
			<?php $_from = $this->_var['recode']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'value');if (count($_from)):
    foreach ($_from AS $this->_var['value']):
?>	
				<tr>
					<td><?php echo $this->_var['value']['fromuser']; ?></td>
					<td><?php echo $this->_var['value']['touser']; ?></td>
					<td><?php echo $this->_var['value']['money']; ?></td>
					<td><?php echo local_date("Y-m-d",$this->_var['value']['time']); ?></td>
					<td><?php echo $this->_var['value']['content']; ?></td>
				</tr>
			<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
			</table>
				<div class="pageLinks" style="">
					<?php if ($this->_var['recode']): ?><?php echo $this->fetch('page.bottom.html'); ?><?php endif; ?>
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
