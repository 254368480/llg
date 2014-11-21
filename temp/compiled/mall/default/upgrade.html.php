<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
	    <h1>用户激活</h1>
        <div class="wrap_line margin1">
		   
				<div style="margin-top:20px;padding-left:50px;line-height:20px;margin-bottom:30px;">
					
				<form action="index.php?app=member&act=upgrade" method="post" name="theForm">
					用户名：<input type="text" name="name" > <input type="submit" value="搜索"> 
				</form>
				</div>
				<table class="int_table">
					<tr><th>用户名</th><th>用户积分</th><th>分销商</th><th>分销商积分</th><th>代理商</th><th>代理商积分</th><th>代理商余额</th><th>激活操作</th></tr>
					<tr>
						<td align="center"><?php echo $this->_var['cu']['user_name']; ?></td>
						<td align="center"><?php echo $this->_var['cu']['integral']; ?></td>
						<td align="center"><?php echo $this->_var['fxs']['user_name']; ?></td>
						<td align="center"><?php echo $this->_var['fxs']['integral']; ?></td>
						<td align="center"><?php echo $this->_var['dls']['user_name']; ?></td>
						<td align="center"><?php echo $this->_var['dls']['integral']; ?></td>
						<td align="center"><?php echo $this->_var['dls']['money']; ?></td>
						<td><?php if ($this->_var['sta'] == 1): ?>
							<form name="upFrom" method="post" action="index.php?app=member&act=to_upgrade">
								<select name="grade">
									<option value="0">VIP会员</option>
									<option value="1">分销商</option>
									<option value="2">代理商</option>
								</select>
								<input type="hidden" value="<?php echo $this->_var['cu']['user_id']; ?>" name="id">
								<input type="submit" value="升级">
							</form>
							<?php endif; ?>
						</td>
					</tr>
				</table>
				
			
				
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
