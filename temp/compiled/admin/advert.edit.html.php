<?php echo $this->fetch('header.html'); ?>

<div class="">
		<h2>广告修改</h2>
</div>

<form method="post" action="/admin/index.php?app=advert&act=ad_toedit" name="theForm" enctype="multipart/form-data" onsubmit="return pd()">
<table class="ad_table">
		<tr>
			<th align="right">广告名称：</th><td ><input type="text" name="ad_name" value="<?php echo $this->_var['ads']['ad_name']; ?>"></td>
		</tr>
		<tr>
			<th></th><td ><img src="/<?php echo $this->_var['ads']['ad_img']; ?>" width="100" height="100"></td>
			<input type="hidden" value="<?php echo $this->_var['ads']['ad_img']; ?>" name="old_img">
		</tr>
		<tr>
			<th align="right">广告图片：</th><td><input type="file" name="ad_img"></td>
		</tr>
		<tr>
			<th align="right">广告链接：</th><td><textarea name="ad_link"><?php echo $this->_var['ads']['ad_link']; ?></textarea></td>
		</tr>
		<tr>
			<th align="right">广告价值积分：</th><td><input type="text" name="ad_int" value="<?php echo $this->_var['ads']['ad_int']; ?>"></td>
		</tr>
		<tr>
			<th align="right">点广告的权限：</th>
				<td>
					<select name="ad_vip">
						<option <?php if ($this->_var['ads']['ad_vip'] == 0): ?>selected="selected"<?php endif; ?> value="0">免费会员</option>
						<option <?php if ($this->_var['ads']['ad_vip'] == 1): ?>selected="selected"<?php endif; ?> value="1">VIP会员</option>
						<option <?php if ($this->_var['ads']['ad_vip'] == 2): ?>selected="selected"<?php endif; ?> value="2">分销商</option>
						<option <?php if ($this->_var['ads']['ad_vip'] == 3): ?>selected="selected"<?php endif; ?> value="3">代理商</option>
					</select>
				</td>
		</tr>
		<input type="hidden" name="id" value="<?php echo $this->_var['ads']['ad_id']; ?>">
		<tr>
			<th align="right"><input type="submit" value="提交"></th>
			<td align="right"><input type="reset" value="重置"></td>
		</tr>
		
		
</table>
</form>
<?php echo $this->fetch('footer.html'); ?>
