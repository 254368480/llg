<script type="text/javascript">
//<!CDATA[
$(function(){
    $('#coupon_form').validate({
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
        rules : {
            coupon_name : {
                required : true
            },
            coupon_value : {
                required : true,
                number : true
            },
            use_times : {
                required : true,
                digits : true
            },
            min_amount : {
                required : true,
                number : true
            },
            end_time : {
                required : true
            }
        },
            messages : {
            coupon_name : {
                required : '�Ż�ȯ���Ʋ���Ϊ��'
            },
            coupon_value : {
                required : '�Żݽ������ұ������0',
                number : '�Żݽ�����Ϊ����'
            },
            use_times : {
                required : 'ʹ�ô�������Ϊ��',
                digits : 'ʹ�ô�������Ϊ����'
            },
            min_amount : {
                required : 'ʹ����������Ϊ��',
                number : '��Ʒ��ͽ�����Ϊ����'
            },
            end_time : {
                required : '����ʱ�䲻��Ϊ��'
            }
        }
    });
    $('#add_time_from').datepicker({dateFormat: 'yy-mm-dd'});
    $('#add_time_to').datepicker({dateFormat: 'yy-mm-dd'});
});
//]]>
</script>
<ul class="tab">
    <li class="active"><?php if ($_GET['act'] == edit): ?>�༭�Ż�ȯ<?php else: ?>�����Ż�ȯ<?php endif; ?></li>
</ul>
<div class="eject_con">
    <div class="adds">
        <div id="warning"></div>
        <form method="post" action="index.php?app=coupon&act=<?php echo $_GET['act']; ?>&id=<?php echo $_GET['id']; ?>" target="coupon" id="coupon_form">
        <ul>
            <li>
                <h3>�Ż�ȯ����:</h3>
                <p><input type="text" class="text width14" name="coupon_name" value="<?php echo htmlspecialchars($this->_var['coupon']['coupon_name']); ?>"/><b class="strong">*</b></p>
            </li>
            <li>
                <h3>�Żݽ��:</h3>
                <p><input type="text" class="text width2" name="coupon_value" value="<?php echo $this->_var['coupon']['coupon_value']; ?>" /><b class="strong">*</b></p>
            </li>
            <li>
                <h3>ʹ�ô���:</h3>
                <p><input type="text" class="text width2" name="use_times" value="<?php if ($this->_var['coupon']['use_times']): ?><?php echo $this->_var['coupon']['use_times']; ?><?php else: ?>1<?php endif; ?>" /><span class="field_notice">һ���Ż�ȯ�������ʹ�õĴ���</span><b class="strong">*</b></p>
            </li>
            <li>
                <h3>ʹ������:</h3>
                <p><input type="text" class="text width2" name="start_time" value="<?php if ($this->_var['coupon']['start_time']): ?><?php echo local_date("Y-m-d",$this->_var['coupon']['start_time']); ?><?php else: ?><?php echo local_date("Y-m-d",$this->_var['today']); ?><?php endif; ?>" id="add_time_from" readonly="readonly" />
                 �� <input type="text" class="text width2" name="end_time" value="<?php if ($this->_var['coupon']['end_time']): ?><?php echo local_date("Y-m-d",$this->_var['coupon']['end_time']); ?><?php endif; ?>" id="add_time_to" readonly="readonly" /><b class="strong">*</b>
                </p>
            </li>
            <li>
                <h3>ʹ������:</h3>
                <p><span class="field_notice" style="padding-left: 0px; ">һ�ι�����  <input type="text" class="text width1" name="min_amount" value="<?php echo $this->_var['coupon']['min_amount']; ?>" />   �ſ�ʹ��</span><b class="strong">*</b></p>
            </li>
            <li>
                <h3>����:</h3>
                <p style="line-height:25px;"><input type="checkbox" name="if_issue" value="1" />�������� <span class="field_notice">һ�������������޸��Ż�ȯ��Ϣ</span></p>
                <div class="clear"></div>
            </li>
        </ul>
        <div class="submit"><input type="submit" class="btn" value="�ύ" /></div>
        </form>
    </div>
    <div style="border:0px; height:70px; width:10px;"></div>
</div>