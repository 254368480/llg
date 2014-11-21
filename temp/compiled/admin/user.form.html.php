<?php echo $this->fetch('header.html'); ?>
<script type="text/javascript">
$(function(){
    $('#user_form').validate({
        errorPlacement: function(error, element){
            $(element).next('.field_notice').hide();
            $(element).after(error);
        },
        success       : function(label){
            label.addClass('right').text('OK!');
        },
        onkeyup    : false,
        rules : {
            user_name : {
                required : true,
                byteRange: [3,15,'<?php echo $this->_var['charset']; ?>'],
                remote   : {
                    url :'index.php?app=user&act=check_user',
                    type:'get',
                    data:{
                        user_name : function(){
                            return $('#user_name').val();
                        },
                        id : '<?php echo $this->_var['user']['user_id']; ?>'
                    }
                }
            },
            password: {
                <?php if ($_GET['act'] == 'add'): ?>
                required : true,
                <?php endif; ?>
                maxlength: 20,
                minlength: 6
            },
            email   : {
                required : true,
                email : true
            }
            <?php if (! $this->_var['set_avatar']): ?>
            ,
            portrait : {
                accept : 'png|gif|jpe?g'
            }
            <?php endif; ?>
        },
        messages : {
            user_name : {
                required : '会员名称不能为空',
                byteRange: '用户名的长度应在3-15个字符之间',
                remote   : '该会员名已经存在了，请您换一个'
            },
            password : {
                <?php if ($_GET['act'] == 'add'): ?>
                required : '密码不能为空',
                <?php endif; ?>
                maxlength: '密码长度应在6-20个字符之间',
                minlength: '密码长度应在6-20个字符之间'
            },
            email  : {
                required : '电子邮箱不能为空',
                email   : '请您填写有效的电子邮箱'
            }
            <?php if (! $this->_var['set_avatar']): ?>
            ,
            portrait : {
                accept : '支持格式gif,jpg,jpeg,png'
            }
            <?php endif; ?>
        }
    });
});
</script>
<div id="rightTop">
  <p>会员管理</p>
  <ul class="subnav">
    <li><a class="btn1" href="index.php?app=user">管理</a></li>
    <li>
      <?php if ($this->_var['user']['user_id']): ?>
      <a class="btn1" href="index.php?app=user&amp;act=add">新增</a>
      <?php else: ?>
      <span>新增</span>
      <?php endif; ?>
    </li>
  </ul>
</div>
<div class="info">
  <form method="post" enctype="multipart/form-data" id="user_form">
    <table class="infoTable" style="width:500px;float:left;">
      <tr>
        <th class="paddingT15"> 会员名:</th>
        <td class="paddingT15 wordSpacing5"><?php if ($this->_var['user']['user_id']): ?>
          <?php echo htmlspecialchars($this->_var['user']['user_name']); ?>
          <?php else: ?>
          <input class="infoTableInput2" id="user_name" type="text" name="user_name" value="<?php echo htmlspecialchars($this->_var['user']['user_name']); ?>" />
          <label class="field_notice">会员名</label>
          <?php endif; ?>        </td>
      </tr>
      <tr>
        <th class="paddingT15"> 密码:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="password" type="text" id="password" />
          <?php if ($this->_var['user']['user_id']): ?>
          <span class="grey">留空表示不修改密码</span>
          <?php endif; ?>        </td>
      </tr>
      <tr>
        <th class="paddingT15"> 电子邮箱:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="email" type="text" id="email" value="<?php echo htmlspecialchars($this->_var['user']['email']); ?>" />
            <label class="field_notice">电子邮箱</label>        </td>
      </tr>
      <tr>
        <th class="paddingT15"> 真实姓名:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="real_name" type="text" id="real_name" value="<?php echo htmlspecialchars($this->_var['user']['real_name']); ?>" />        </td>
      </tr>
      <tr>
        <th class="paddingT15"> 性别:</th>
        <td class="paddingT15 wordSpacing5"><p>
            <label>
            <input name="gender" type="radio" value="0" <?php if ($this->_var['user']['gender'] == 0): ?>checked="checked"<?php endif; ?> />
            保密</label>
            <label>
            <input type="radio" name="gender" value="1" <?php if ($this->_var['user']['gender'] == 1): ?>checked="checked"<?php endif; ?> />
            男</label>
            <label>
            <input type="radio" name="gender" value="2" <?php if ($this->_var['user']['gender'] == 2): ?>checked="checked"<?php endif; ?> />
            女</label>
          </p></td>
      </tr>
      <!--<tr>
        <th class="paddingT15"> <label for="phone_tel">固定电话:</label></th>
        <td class="paddingT15 wordSpacing5"><input name="phone_tel[]" id="phone_tel" type="text" size="4" value="<?php echo $this->_var['phone_tel']['0']; ?>" />
          -
          <input class="infoTableInput2" name="phone_tel[]" type="text" value="<?php echo $this->_var['phone_tel']['1']; ?>" />
          -
          <input name="phone_tel[]" type="text" size="4" value="<?php echo $this->_var['phone_tel']['2']; ?>" />
        </td>
      </tr>
      <tr>
        <th class="paddingT15"> 手机:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="phone_mob" type="text" id="phone_mob" value="<?php echo htmlspecialchars($this->_var['user']['phone_mob']); ?>" />
        </td>
      </tr>-->
      <tr>
        <th class="paddingT15"> QQ:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="im_qq" type="text" id="im_qq" value="<?php echo htmlspecialchars($this->_var['user']['im_qq']); ?>" />        </td>
      </tr>
      <tr>
        <th class="paddingT15"> 联系电话:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="im_msn" type="text" id="im_msn" value="<?php echo htmlspecialchars($this->_var['user']['im_msn']); ?>" />        </td>
      </tr>
	  <tr>
        <th class="paddingT15"> 银行卡号:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="bank" type="text"  value="<?php echo $this->_var['user']['bank']; ?>" />        </td>
      </tr>
	  <tr>
        <th class="paddingT15"> 可用积分:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="integral" type="text" value="<?php echo $this->_var['user']['integral']; ?>" />        </td>
      </tr>
	  <tr>
        <th class="paddingT15"> 可用余额:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="money" type="text"  value="<?php echo $this->_var['user']['money']; ?>" />        </td>
      </tr>
	 
	  <tr>
        <th class="paddingT15"> 会员等级:</th>
        <td class="paddingT15 wordSpacing5">
				<select name="grade">
					<option <?php if ($this->_var['user']['grade'] == "免费会员"): ?> selected="selected"<?php endif; ?> value="免费会员">免费会员</option>
					<option <?php if ($this->_var['user']['grade'] == "VIP会员"): ?> selected="selected"<?php endif; ?> value="VIP会员">VIP会员</option>
					<option <?php if ($this->_var['user']['grade'] == "分销商"): ?> selected="selected"<?php endif; ?> value="分销商">分销商</option>
					<option <?php if ($this->_var['user']['grade'] == "代理商"): ?> selected="selected"<?php endif; ?> value="代理商">代理商</option>
					
				</select>
		</td>
      </tr>
	 
	   <tr>
        <th class="paddingT15"> 会员到期日:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="use_time" type="text"  value="<?php echo local_date("Y-m-d",$this->_var['user']['use_time']); ?>" />       </td>
      </tr>
	  <tr>
        <th class="paddingT15"> 广告积分上限:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="sx" type="text"  value="<?php echo $this->_var['user']['td_int_sx']; ?>" /> 
				<label class="field_notice">1为正常,0为禁止</label>
		       </td>
      </tr>
	   <tr>
        <th class="paddingT15"> 会员使用状态:</th>
        <td class="paddingT15 wordSpacing5">
				<select name="login">
					<option <?php if ($this->_var['user']['login'] == "0"): ?> selected="selected"<?php endif; ?> value="0">冻结</option>
					<option <?php if ($this->_var['user']['login'] == "1"): ?> selected="selected"<?php endif; ?> value="1">正常</option>
				</select>
		</td>
      </tr>
	  
  
      <tr>
        <th></th>
        <td class="ptb20"><input class="formbtn" type="submit" name="Submit" value="提交" />
          <input class="formbtn" type="reset" name="Reset" value="重置" />        </td>
      </tr>
    </table>
  </form>
  
  <form action="index.php?app=user&act=search" method="post" name="theForm">
  
  <div class="user_info">
  	<h2>用户消费统计</h2>
  	消费累计数：<?php echo $this->_var['dep']; ?><?php echo $this->_var['total']; ?><br>
	新增消费数：<?php echo $this->_var['num']; ?><br>
	时间从&nbsp;&nbsp;<input type="text" value="<?php echo $this->_var['time']; ?>" name="star">至<input type="text" value="<?php echo $this->_var['time']; ?>" name="end"><input type="submit"><br>
	<input type="hidden" value="<?php echo $this->_var['user']['user_id']; ?>" name="user_id">
  </form>
	<h2>用户上属信息</h2>
	代理商：<?php echo $this->_var['user']['dls']; ?><br>
	分销商：<?php echo $this->_var['user']['fxs']; ?><br>
	开户单位：<?php echo $this->_var['user']['deposit']; ?><br>
  </div>
</div>
<?php echo $this->fetch('footer.html'); ?>