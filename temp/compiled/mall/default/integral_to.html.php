<?php echo $this->fetch('member.header.html'); ?>
<script type="text/javascript" src="<?php echo $this->lib_base . "/" . 'jquery.js'; ?>" charset="utf-8"></script>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
	    <h1>���ֲ���</h1>
        <div class="wrap_line margin1">
		     <div> 
				
			 <form action="/index.php?app=member&act=integral_toDo" method="post" name="theForm" onsubmit="return tian_check()">
				   <table border="0" bordercolor="#FFF" class="int_table">
					<tr>
						<th align="right">��ǰ�˻���</th>
						<td> <?php echo $this->_var['user_info']['user_name']; ?></td>
						
					</tr>
					<tr>
						<th align="right">���û��֣�</th>
						<td> <?php echo $this->_var['user_info']['integral']; ?>��</td>
					</tr>
					<tr>
						<th align="right">֧�����֣�</th>
						<td><input type="text" value="" name="int"></td>
					</tr>
					<tr>
						<th align="right">ת���û���</th>
						<td><input type="text" value="" name="user"></td>
					</tr>
					<tr>
						<th align="right">�˻����룺</th>
						<td><input type="password" value="" name="password"></td>
					</tr>
					
					<tr>
						<th align="right"><input type="submit" value="ȷ��"></th>
						<td style="padding-left:80px;" ><input type="reset" value="����" ></td>
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