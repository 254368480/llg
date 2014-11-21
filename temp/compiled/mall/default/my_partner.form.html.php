<script type="text/javascript">
//<!CDATA[
$(function(){
    $('input[ectype="logo"]').change(function(){
            var src = getFullPath($(this)[0]);
            $('img[ectype="logo1"]').attr('src' , src);
            $(this).removeAttr('name');
            $(this).attr('name' , 'logo');
    });
    $(".ok").mouseover(function(){
        $(this).next("div").show();
    });
    $(".ok").mouseout(function(){
        $(this).next("div").hide();
    });
    $('#partner_form').validate({
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
            title : {
                required : true,
                byteRange: ['',100,'<?php echo $this->_var['charset']; ?>']
            },
            link  : {
                required : true,
                url      : true
            },
            logo  : {
                accept : 'png|jpe?g|gif'
            },
            sort_order : {
                number   : true
            }
        },
        messages : {
            title : {
                required : '����д����������. ',
                byteRange: '���ⲻ�ܳ���100���ַ�. '
            },
            link  : {
                required : '��д�����������ӵ�ַ. ',
                url      : '���ӵ�ַ��Ч. '
            },
            logo  : {
                accept   : 'ֻ����ͼƬ�ļ�gif, jpg, jpeg, png. '
            },
            sort_order  : {
                number   : 'ֻ��ʹ������. '
            }
        }
    });
});
//]]>
</script>
<ul class="tab">
    <li class="active"><?php if ($_GET['act'] == edit): ?>�༭�������<?php else: ?>�����������<?php endif; ?></li>
</ul>
<div class="eject_con">
    <div class="adds">
        <div id="warning"></div>
        <form method="post" action="index.php?app=my_partner&amp;act=<?php echo $_GET['act']; ?><?php if ($_GET['partner_id'] != ''): ?>&amp;partner_id=<?php echo $_GET['partner_id']; ?><?php endif; ?>" target="my_partner" enctype="multipart/form-data" id="partner_form">
        <ul>
            <li>
                <h3>����:</h3>
                <p><input type="text" class="text width14" name="title" value="<?php echo htmlspecialchars($this->_var['partner']['title']); ?>"/><b class="strong">*</b></p>
            </li>
            <li>
                <h3>����:</h3>
                <p><input type="text" class="text width14" name="link" value="<?php echo $this->_var['partner']['link']; ?>" /><b class="strong">*</b></p>
            </li>
            <li>
                <h3>����:</h3>
                <p><input type="text" class="text width1" name="sort_order" value="<?php echo $this->_var['partner']['sort_order']; ?>" /><span>����,ֻ��������,ֵԽ��Խ����</span></p>
            </li>
            <li>
                <h3>��ʶ:</h3>
                <div class="sign_box">
                    <div class="sign_con">
                        <div class="sign"><img src="<?php if ($this->_var['partner']['logo']): ?><?php echo $this->_var['partner']['logo']; ?><?php else: ?>data/system/no_pic.gif<?php endif; ?>" width="150" height="50" alt="" ectype="logo1"/></div>
                        <div class="upload_pic">
                            <span class="file1"><input type="file" size="1" maxlength="0" hidefocus="true" ectype="logo"/></span>
                            <span class="file2"><input type="file" size="1" maxlength="0" hidefocus="true" ectype="logo"/></span>
                            <div class="txt">ͼƬ�ϴ�</div>
                        </div>
                    </div>
                    <div class="sign_con">
                        <span class="color5"></span><br />
                        <span class="color7"></span>
                    </div>
                </div>
            </li>
        </ul>
        <div class="submit"><input type="submit" class="btn" value="�ύ" /></div>
        </form>
    </div>
</div>