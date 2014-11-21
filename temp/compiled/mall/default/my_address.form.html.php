<script type="text/javascript">
//<!CDATA[
$(function(){
    regionInit("region");
    $('#address_form').validate({
        /*errorPlacement: function(error, element){
            var _message_box = $(element).parent().find('.field_message');
            _message_box.find('.field_notice').hide();
            _message_box.append(error);
        },
        success       : function(label){
            label.addClass('validate_right').text('OK!');
        },*/
        errorLabelContainer: $('#warning'),
        invalidHandler: function(form, validator) {
           var errors = validator.numberOfInvalids();
           if(errors)
           {
               $('#warning').show();
           }
           else
           {
               $('#warning').hide();
           }
        },
        onkeyup : false,
        rules : {
            consignee : {
                required : true
            },
            region_id : {
                required : true,
                min   : 1
            },
            address   : {
                required : true
            },
            phone_tel : {
                required : check_phone,
                minlength:6,
                checkTel:true
            },
            phone_mob : {
                required : check_phone,
                minlength:6,
                digits : true
            }
        },
        messages : {
            consignee : {
                required : '����д�ջ�������. '
            },
            region_id : {
                required : '��ѡ�����ڵ���. ',
                min  : '��ѡ�����ڵ���. '
            },
            address   : {
                required : '����д��ϸ��ַ. '
            },
            phone_tel : {
                required : '�̶��绰���ֻ���������дһ��. ',
                minlength: '�绰���������֡��Ӻš����š��ո��������,����������6λ. ',
                checkTel: '�绰���������֡��Ӻš����š��ո��������,����������6λ. '
            },
            phone_mob : {
                required : '�̶��绰���ֻ���������дһ��. ',
                minlength: '������ֻ�����,ֻ��������,���Ҳ�������6λ. ',
                digits : '������ֻ�����,ֻ��������,���Ҳ�������6λ. '
            }
        },
        groups:{
            phone:'phone_tel phone_mob'
        }
    });
});
function check_phone(){
    return ($('[name="phone_tel"]').val() == '' && $('[name="phone_mob"]').val() == '');
}
function hide_error(){
    $('#region').find('.error').hide();
}
//]]>
</script>
<ul class="tab">
    <li class="active"><?php if ($_GET['act'] == edit): ?>�༭��ַ<?php else: ?>������ַ<?php endif; ?></li>
</ul>
<div class="eject_con">
<div class="add">
    <div id="warning"></div>
    <form method="post" action="index.php?app=my_address&act=<?php echo $this->_var['act']; ?>&addr_id=<?php echo $this->_var['address']['addr_id']; ?>" id="address_form" target="iframe_post">
    <ul>
        <li>
            <h3>�ջ�������: </h3>
            <p><input type="text" class="text width_normal" name="consignee" value="<?php echo htmlspecialchars($this->_var['address']['consignee']); ?>"/><label class="field_message"><span class="field_notice">����д������ʵ����</span></label></p>
        </li>
        <li>
            <h3>���ڵ���: </h3>
            <p><div id="region">
                        <input type="hidden" name="region_id" value="<?php echo $this->_var['address']['region_id']; ?>" id="region_id" class="mls_id" />
                        <input type="hidden" name="region_name" value="<?php echo htmlspecialchars($this->_var['address']['region_name']); ?>" class="mls_names" />
                        <?php if ($this->_var['address']['region_id']): ?>
                        <span><?php echo htmlspecialchars($this->_var['address']['region_name']); ?></span>
                        <input type="button" value="�༭" class="edit_region" />
                        <select style="display:none" onchange="hide_error();">
                          <option>��ѡ��...</option>
                          <?php echo $this->html_options(array('options'=>$this->_var['regions'])); ?>
                        </select>
                        <?php else: ?>
                        <select onchange="hide_error();">
                          <option>��ѡ��...</option>
                          <?php echo $this->html_options(array('options'=>$this->_var['regions'])); ?>
                        </select>
                        <?php endif; ?>
                        <b class="field_message" style="font-weight:normal;"><label class="field_notice"></label></b>
                      </div></p>
        </li>
        <li>
            <h3>��ϸ��ַ: </h3>
            <p><input type="text" class="text width_normal" name="address" value="<?php echo htmlspecialchars($this->_var['address']['address']); ?>"/><label class="field_message"><span class="field_notice">�����ظ���д����</span></label></p>
        </li>
        <li>
            <h3>��������: </h3>
            <p><input type="text" class="text width_normal" name="zipcode" name="zipcode" value="<?php echo htmlspecialchars($this->_var['address']['zipcode']); ?>" /><label class="field_message"><span class="field_notice"></span></label></p>
        </li>
        <li>
            <h3>�绰����:</h3>
            <p><input type="text" class="text width_normal"  name="phone_tel" value="<?php echo $this->_var['address']['phone_mob']; ?>"/><label class="field_message"><span class="field_notice">���� - �绰���� - �ֻ�</span></label></p>
        </li>
        <li>
            <h3>�ֻ�����:</h3>
            <p><input type="text" class="text width_normal" name="phone_mob" value="<?php echo $this->_var['address']['phone_tel']; ?>"/><label class="field_message"><span class="field_notice">�ֻ�����</span></label></p>
        </li>
    </ul>
    <div class="submit"><input type="submit" class="btn" value="<?php if ($this->_var['address']['addr_id']): ?>�༭��ַ<?php else: ?>������ַ<?php endif; ?>" /></div>
    </form>
</div>
</div>
