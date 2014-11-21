<?php echo $this->fetch('header.html'); ?>

<div class="">
		<h2>增加广告</h2>
</div>

<form method="post" action="/admin/index.php?app=advert&act=to_add" name="theForm" enctype="multipart/form-data" onsubmit="return pd()">
<table class="ad_table">
		<tr>
			<th align="right">广告名称：</th><td ><input type="text" name="ad_name" value=""></td>
		</tr>
		<tr>
			<th align="right">广告图片：</th><td><input type="file" name="ad_img" value=""></td>
		</tr>
		<tr>
			<th align="right">广告链接：</th><td><textarea name="ad_link"></textarea></td>
		</tr>
		<tr>
			<th align="right">广告价值积分：</th><td><input type="text" name="ad_int" value=""></td>
		</tr>
		<tr>
			<th align="right">点广告的权限：</th>
				<td>
					<select name="ad_vip">
						<option value="0">免费会员</option>
						<option value="1">VIP会员</option>
						<option value="2">分销商</option>
						<option value="3">代理商</option>
					</select>
				</td>
		</tr>
		<tr>
			<th align="right"><input type="submit" value="提交"></th>
			<td align="right"><input type="reset" value="重置"></td>
		</tr>
		
		
</table>
</form>
<?php echo $this->fetch('footer.html'); ?>
