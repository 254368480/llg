<?php echo $this->fetch('header.html'); ?>

<div class="">
		<h2>�鿴���</h2>
</div>


<table class="ad_view_table" border="3">
		<tr>
			<th style="width:100px;">������</th><th>�������</th><th>���ͼƬ</th><th style="width:100px;" align="center">�������</th><th style="width:100px;">������</th><th style="width:100px;">���Ȩ��</th><th style="width:100px;">����</th>
		</tr>
		<?php $_from = $this->_var['ads']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'value');if (count($_from)):
    foreach ($_from AS $this->_var['value']):
?>
			<tr>
				<td align="center" style="width:100px;"><?php echo $this->_var['value']['ad_id']; ?></td>
			    <td align="center"><?php echo $this->_var['value']['ad_name']; ?></td>
				<td align="center"><a href="/<?php echo $this->_var['value']['ad_img']; ?>" target="_blank"><img src="/<?php echo $this->_var['value']['ad_img']; ?>" width="80" height="80"></a></td>
				<td align="center" style="width:100px;"><div style="width:300px;white-space: normal;"><a href="<?php echo $this->_var['value']['ad_link']; ?>" target="_blank">���ӵ�ַ</a></div></td>
				<td align="center" style="width:100px;"><?php echo $this->_var['value']['ad_int']; ?></td>
				<td align="center" style="width:100px;"><?php echo $this->_var['vip'][$this->_var['value']['ad_vip']]; ?></td>
				<td align="center" style="width:100px;">
				<a href="index.php?app=advert&act=ad_edit&ad_id=<?php echo $this->_var['value']['ad_id']; ?>">�༭</a>&nbsp;
				<a href="index.php?app=advert&act=ad_drop&ad_id=<?php echo $this->_var['value']['ad_id']; ?>">ɾ��</a>
				</td>
			</tr>
		<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
</table>		
		<div style="clear:both"></div>
		<div class="pageLinks" style="">
				<?php if ($this->_var['ads']): ?><?php echo $this->fetch('page.bottom.html'); ?><?php endif; ?>
		</div>
   		
		
		


<?php echo $this->fetch('footer.html'); ?>
