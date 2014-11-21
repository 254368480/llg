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

<div class="info">
  
  
  <form action="index.php?app=user&act=search" method="post" name="theForm">
  
  <div class="user_info">
  	<h2><?php echo $this->_var['user']['user_name']; ?>用户消费查询</h2>
  	时间从&nbsp;&nbsp;<input type="text" value="<?php echo $this->_var['time']; ?>" name="star">至<input type="text" value="<?php echo $this->_var['time']; ?>" name="end"><input type="submit"><br>
	<input type="hidden" value="<?php echo $this->_var['user']['user_id']; ?>" name="user_id">
	时间从 <?php echo $this->_var['star']; ?> 至 <?php echo $this->_var['end']; ?> 消费累计数为：<?php echo $this->_var['dep']; ?><?php echo $this->_var['total']; ?>
  </form>
	
  </div>
</div>
<?php echo $this->fetch('footer.html'); ?>