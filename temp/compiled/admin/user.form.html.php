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
                required : '��Ա���Ʋ���Ϊ��',
                byteRange: '�û����ĳ���Ӧ��3-15���ַ�֮��',
                remote   : '�û�Ա���Ѿ������ˣ�������һ��'
            },
            password : {
                <?php if ($_GET['act'] == 'add'): ?>
                required : '���벻��Ϊ��',
                <?php endif; ?>
                maxlength: '���볤��Ӧ��6-20���ַ�֮��',
                minlength: '���볤��Ӧ��6-20���ַ�֮��'
            },
            email  : {
                required : '�������䲻��Ϊ��',
                email   : '������д��Ч�ĵ�������'
            }
            <?php if (! $this->_var['set_avatar']): ?>
            ,
            portrait : {
                accept : '֧�ָ�ʽgif,jpg,jpeg,png'
            }
            <?php endif; ?>
        }
    });
});
</script>
<div id="rightTop">
  <p>��Ա����</p>
  <ul class="subnav">
    <li><a class="btn1" href="index.php?app=user">����</a></li>
    <li>
      <?php if ($this->_var['user']['user_id']): ?>
      <a class="btn1" href="index.php?app=user&amp;act=add">����</a>
      <?php else: ?>
      <span>����</span>
      <?php endif; ?>
    </li>
  </ul>
</div>
<div class="info">
  <form method="post" enctype="multipart/form-data" id="user_form">
    <table class="infoTable" style="width:500px;float:left;">
      <tr>
        <th class="paddingT15"> ��Ա��:</th>
        <td class="paddingT15 wordSpacing5"><?php if ($this->_var['user']['user_id']): ?>
          <?php echo htmlspecialchars($this->_var['user']['user_name']); ?>
          <?php else: ?>
          <input class="infoTableInput2" id="user_name" type="text" name="user_name" value="<?php echo htmlspecialchars($this->_var['user']['user_name']); ?>" />
          <label class="field_notice">��Ա��</label>
          <?php endif; ?>        </td>
      </tr>
      <tr>
        <th class="paddingT15"> ����:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="password" type="text" id="password" />
          <?php if ($this->_var['user']['user_id']): ?>
          <span class="grey">���ձ�ʾ���޸�����</span>
          <?php endif; ?>        </td>
      </tr>
      <tr>
        <th class="paddingT15"> ��������:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="email" type="text" id="email" value="<?php echo htmlspecialchars($this->_var['user']['email']); ?>" />
            <label class="field_notice">��������</label>        </td>
      </tr>
      <tr>
        <th class="paddingT15"> ��ʵ����:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="real_name" type="text" id="real_name" value="<?php echo htmlspecialchars($this->_var['user']['real_name']); ?>" />        </td>
      </tr>
      <tr>
        <th class="paddingT15"> �Ա�:</th>
        <td class="paddingT15 wordSpacing5"><p>
            <label>
            <input name="gender" type="radio" value="0" <?php if ($this->_var['user']['gender'] == 0): ?>checked="checked"<?php endif; ?> />
            ����</label>
            <label>
            <input type="radio" name="gender" value="1" <?php if ($this->_var['user']['gender'] == 1): ?>checked="checked"<?php endif; ?> />
            ��</label>
            <label>
            <input type="radio" name="gender" value="2" <?php if ($this->_var['user']['gender'] == 2): ?>checked="checked"<?php endif; ?> />
            Ů</label>
          </p></td>
      </tr>
      <!--<tr>
        <th class="paddingT15"> <label for="phone_tel">�̶��绰:</label></th>
        <td class="paddingT15 wordSpacing5"><input name="phone_tel[]" id="phone_tel" type="text" size="4" value="<?php echo $this->_var['phone_tel']['0']; ?>" />
          -
          <input class="infoTableInput2" name="phone_tel[]" type="text" value="<?php echo $this->_var['phone_tel']['1']; ?>" />
          -
          <input name="phone_tel[]" type="text" size="4" value="<?php echo $this->_var['phone_tel']['2']; ?>" />
        </td>
      </tr>
      <tr>
        <th class="paddingT15"> �ֻ�:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="phone_mob" type="text" id="phone_mob" value="<?php echo htmlspecialchars($this->_var['user']['phone_mob']); ?>" />
        </td>
      </tr>-->
      <tr>
        <th class="paddingT15"> QQ:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="im_qq" type="text" id="im_qq" value="<?php echo htmlspecialchars($this->_var['user']['im_qq']); ?>" />        </td>
      </tr>
      <tr>
        <th class="paddingT15"> ��ϵ�绰:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="im_msn" type="text" id="im_msn" value="<?php echo htmlspecialchars($this->_var['user']['im_msn']); ?>" />        </td>
      </tr>
	  <tr>
        <th class="paddingT15"> ���п���:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="bank" type="text"  value="<?php echo $this->_var['user']['bank']; ?>" />        </td>
      </tr>
	  <tr>
        <th class="paddingT15"> ���û���:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="integral" type="text" value="<?php echo $this->_var['user']['integral']; ?>" />        </td>
      </tr>
	  <tr>
        <th class="paddingT15"> �������:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="money" type="text"  value="<?php echo $this->_var['user']['money']; ?>" />        </td>
      </tr>
	 
	  <tr>
        <th class="paddingT15"> ��Ա�ȼ�:</th>
        <td class="paddingT15 wordSpacing5">
				<select name="grade">
					<option <?php if ($this->_var['user']['grade'] == "��ѻ�Ա"): ?> selected="selected"<?php endif; ?> value="��ѻ�Ա">��ѻ�Ա</option>
					<option <?php if ($this->_var['user']['grade'] == "VIP��Ա"): ?> selected="selected"<?php endif; ?> value="VIP��Ա">VIP��Ա</option>
					<option <?php if ($this->_var['user']['grade'] == "������"): ?> selected="selected"<?php endif; ?> value="������">������</option>
					<option <?php if ($this->_var['user']['grade'] == "������"): ?> selected="selected"<?php endif; ?> value="������">������</option>
					
				</select>
		</td>
      </tr>
	 
	   <tr>
        <th class="paddingT15"> ��Ա������:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="use_time" type="text"  value="<?php echo local_date("Y-m-d",$this->_var['user']['use_time']); ?>" />       </td>
      </tr>
	  <tr>
        <th class="paddingT15"> ����������:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="sx" type="text"  value="<?php echo $this->_var['user']['td_int_sx']; ?>" /> 
				<label class="field_notice">1Ϊ����,0Ϊ��ֹ</label>
		       </td>
      </tr>
	   <tr>
        <th class="paddingT15"> ��Աʹ��״̬:</th>
        <td class="paddingT15 wordSpacing5">
				<select name="login">
					<option <?php if ($this->_var['user']['login'] == "0"): ?> selected="selected"<?php endif; ?> value="0">����</option>
					<option <?php if ($this->_var['user']['login'] == "1"): ?> selected="selected"<?php endif; ?> value="1">����</option>
				</select>
		</td>
      </tr>
	  
  
      <tr>
        <th></th>
        <td class="ptb20"><input class="formbtn" type="submit" name="Submit" value="�ύ" />
          <input class="formbtn" type="reset" name="Reset" value="����" />        </td>
      </tr>
    </table>
  </form>
  
  <form action="index.php?app=user&act=search" method="post" name="theForm">
  
  <div class="user_info">
  	<h2>�û�����ͳ��</h2>
  	�����ۼ�����<?php echo $this->_var['dep']; ?><?php echo $this->_var['total']; ?><br>
	������������<?php echo $this->_var['num']; ?><br>
	ʱ���&nbsp;&nbsp;<input type="text" value="<?php echo $this->_var['time']; ?>" name="star">��<input type="text" value="<?php echo $this->_var['time']; ?>" name="end"><input type="submit"><br>
	<input type="hidden" value="<?php echo $this->_var['user']['user_id']; ?>" name="user_id">
  </form>
	<h2>�û�������Ϣ</h2>
	�����̣�<?php echo $this->_var['user']['dls']; ?><br>
	�����̣�<?php echo $this->_var['user']['fxs']; ?><br>
	������λ��<?php echo $this->_var['user']['deposit']; ?><br>
  </div>
</div>
<?php echo $this->fetch('footer.html'); ?>