<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
	    <h1>�ҵ�ҵ��</h1>
        <div class="wrap_line margin1">
		   
				<div style="margin-top:20px;padding-left:24px;line-height:20px;margin-bottom:100px;">
					
				<form action="index.php?app=member&act=deposit" method="post" name="theForm">
					ʱ���<input type="text" value="<?php echo $this->_var['star']; ?>" name="star">��<input type="text" value="<?php echo $this->_var['end']; ?>" name="end"><input type="submit"><br>
				</form>
				ʱ��� <?php echo $this->_var['star']; ?> �� <?php echo $this->_var['end']; ?> �����ۼ���Ϊ��<?php echo $this->_var['dep']; ?><?php echo $this->_var['total']; ?>
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
