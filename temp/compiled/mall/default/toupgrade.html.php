<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
	    <h1>用户激活</h1>
        <div class="wrap_line margin1">
		   
				<div style="margin-top:20px;padding-left:50px;line-height:20px;margin-bottom:30px;">
					
				<form action="index.php?app=member&act=upgrade" method="post" name="theForm">
					升级目标：
                    <select name="grade">
                        <option value="0">VIP会员</option>
                        <option value="1">分销商</option>
                        <option value="2">代理商</option>
					</select>
                    <input type="submit" value="申请升级">
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
