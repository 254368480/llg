<?php echo $this->fetch('header.html'); ?>

<div class="">
		<h2>����޸�</h2>
</div>

<form method="post" action="/admin/index.php?app=advert&act=ad_toedit" name="theForm" enctype="multipart/form-data" onsubmit="return pd()">
<table class="ad_table">
		<tr>
			<th align="right">������ƣ�</th><td ><input type="text" name="ad_name" value="<?php echo $this->_var['ads']['ad_name']; ?>"></td>
		</tr>
		<tr>
			<th></th><td ><img src="/<?php echo $this->_var['ads']['ad_img']; ?>" width="100" height="100"></td>
			<input type="hidden" value="<?php echo $this->_var['ads']['ad_img']; ?>" name="old_img">
		</tr>
		<tr>
			<th align="right">���ͼƬ��</th><td><input type="file" name="ad_img"></td>
		</tr>
		<tr>
			<th align="right">������ӣ�</th><td><textarea name="ad_link"><?php echo $this->_var['ads']['ad_link']; ?></textarea></td>
		</tr>
		<tr>
			<th align="right">����ֵ���֣�</th><td><input type="text" name="ad_int" value="<?php echo $this->_var['ads']['ad_int']; ?>"></td>
		</tr>
		<tr>
			<th align="right">�����Ȩ�ޣ�</th>
				<td>
					<select name="ad_vip">
						<option <?php if ($this->_var['ads']['ad_vip'] == 0): ?>selected="selected"<?php endif; ?> value="0">��ѻ�Ա</option>
						<option <?php if ($this->_var['ads']['ad_vip'] == 1): ?>selected="selected"<?php endif; ?> value="1">VIP��Ա</option>
						<option <?php if ($this->_var['ads']['ad_vip'] == 2): ?>selected="selected"<?php endif; ?> value="2">������</option>
						<option <?php if ($this->_var['ads']['ad_vip'] == 3): ?>selected="selected"<?php endif; ?> value="3">������</option>
					</select>
				</td>
		</tr>
		<input type="hidden" name="id" value="<?php echo $this->_var['ads']['ad_id']; ?>">
		<tr>
			<th align="right"><input type="submit" value="�ύ"></th>
			<td align="right"><input type="reset" value="����"></td>
		</tr>
		
		
</table>
</form>
<?php echo $this->fetch('footer.html'); ?>
