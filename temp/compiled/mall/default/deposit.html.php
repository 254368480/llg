<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
	    <h1>我的业务</h1>
        <div class="wrap_line margin1">
		   
				
				<div style="margin-top:20px;padding-left:24px;line-height:20px;margin-bottom:100px;">
				<form action="index.php?app=member&act=deposit" method="post" name="theForm">
					消费累计数：<?php echo $this->_var['dep']; ?><?php echo $this->_var['total']; ?><br>
					新增消费数：<?php echo $this->_var['num']; ?><br>
					时间从<input type="text" value="<?php echo $this->_var['time']; ?>" name="star">至<input type="text" value="<?php echo $this->_var['time']; ?>" name="end"><input type="submit"><br>
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
