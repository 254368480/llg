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

<div class="info">
  
  
  <form action="index.php?app=user&act=search" method="post" name="theForm">
  
  <div class="user_info">
  	<h2><?php echo $this->_var['user']['user_name']; ?>�û����Ѳ�ѯ</h2>
  	ʱ���&nbsp;&nbsp;<input type="text" value="<?php echo $this->_var['time']; ?>" name="star">��<input type="text" value="<?php echo $this->_var['time']; ?>" name="end"><input type="submit"><br>
	<input type="hidden" value="<?php echo $this->_var['user']['user_id']; ?>" name="user_id">
	ʱ��� <?php echo $this->_var['star']; ?> �� <?php echo $this->_var['end']; ?> �����ۼ���Ϊ��<?php echo $this->_var['dep']; ?><?php echo $this->_var['total']; ?>
  </form>
	
  </div>
</div>
<?php echo $this->fetch('footer.html'); ?>