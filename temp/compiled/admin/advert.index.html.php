<?php echo $this->fetch('header.html'); ?>

<div class="">
		<h2>���ӹ��</h2>
</div>

<form method="post" action="/admin/index.php?app=advert&act=to_add" name="theForm" enctype="multipart/form-data" onsubmit="return pd()">
<table class="ad_table">
		<tr>
			<th align="right">������ƣ�</th><td ><input type="text" name="ad_name" value=""></td>
		</tr>
		<tr>
			<th align="right">���ͼƬ��</th><td><input type="file" name="ad_img" value=""></td>
		</tr>
		<tr>
			<th align="right">������ӣ�</th><td><textarea name="ad_link"></textarea></td>
		</tr>
		<tr>
			<th align="right">����ֵ���֣�</th><td><input type="text" name="ad_int" value=""></td>
		</tr>
		<tr>
			<th align="right">�����Ȩ�ޣ�</th>
				<td>
					<select name="ad_vip">
						<option value="0">��ѻ�Ա</option>
						<option value="1">VIP��Ա</option>
						<option value="2">������</option>
						<option value="3">������</option>
					</select>
				</td>
		</tr>
		<tr>
			<th align="right"><input type="submit" value="�ύ"></th>
			<td align="right"><input type="reset" value="����"></td>
		</tr>
		
		
</table>
</form>
<?php echo $this->fetch('footer.html'); ?>
