<?php echo $this->fetch('member.header.html'); ?>
<style type="text/css">
.bgwhite {background: #FFFFFF;}
</style>
<script type="text/javascript">
$(function(){
    $('#password_form').validate({
        errorPlacement: function(error, element){
            $(element).next('.field_notice').hide();
            $(element).after(error);
        },
        success       : function(label){
            label.addClass('validate_right').text('OK!');
        },
        rules : {
            orig_password : {
                required : true
            },
            new_password : {
                required   : true,
                minlength  : 6,
                maxlength  : 20
            },
            confirm_password : {
                required   : true,
                equalTo    : '#new_password'
            }
        },
        messages : {
            orig_password : {
                required : 'ԭʼ���벻��Ϊ��'
            },
            new_password  : {
                required   : '���벻��Ϊ��',
                minlength  : '���볤��Ӧ��6-20���ַ�֮��'
            },
            confirm_password : {
                required   : '���벻��Ϊ��',
                equalTo    : '������������벻���'
            }
        }
    });
});
</script>
<style>
.borline td {padding:10px 0px;}
.ware_list th {text-align:left;}
</style>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
        <?php echo $this->fetch('member.submenu.html'); ?>
        <div class="eject_con bgwhite">
            <div class="add">
                <form method="post" id="password_form">
                        <ul>
                            <li><h3>��������:</h3>
                                <p><input type="password" class="text width_normal" name="orig_password" /></p>
                            </li>
                            <li>
                                <h3>������:</h3>
                                <p><input type="password" class="text width_normal" name="new_password" id="new_password"/></p>
                            </li>
                            <li>
                                <h3>ȷ������:</h3>
                                <p><input type="password" class="text width_normal" name="confirm_password" /></p>
                            </li>
                        </ul>
                    <div class="submit">
                        <input class="btn" type="submit" value="�ύ" />
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>
