<?php echo $this->fetch('header.html'); ?>
<script type="text/javascript" src="index.php?act=jslang"></script>
<script type="text/javascript">
//<!CDATA[
$(function(){
    $('#recom_form').validate({
        errorPlacement: function(error, element){
            $(element).next('.field_notice').hide();
            $(element).after(error);
        },
        success       : function(label){
            label.addClass('right').text('OK!');
        },
        onkeyup    : false ,
        rules : {
            recom_name : {
                required : true ,
                remote   : {
                url :'index.php?app=recommend&act=check_recom' ,
                type:'get',
                data:{
                    recom_name : function(){
                        return $('#recom_name').val();
                        },
                    id : '<?php echo $this->_var['recommend']['recom_id']; ?>'
                    }
                }
            }
        },
        messages : {
            recom_name : {
                required : '�Ƽ����Ͳ���Ϊ��',
                remote   : '��������Ƽ����������Ѵ��ڣ�����������'
            }
        }
    });
});
//]]>
</script>
<div id="rightTop">
  <p>�Ƽ�����</p>
  <ul class="subnav">
    <li><a class="btn1" href="index.php?app=recommend">����</a></li>
    <?php if ($this->_var['recommend']['recom_id']): ?>
    <li><a class="btn1" href="index.php?app=recommend&amp;act=add">����</a></li>
    <?php else: ?>
    <li><span>����</span></li>
    <?php endif; ?>
  </ul>
</div>
<div class="info">
  <form method="post" enctype="multipart/form-data" id="recom_form">
    <table class="infoTable">
      <tr>
        <th class="paddingT15"> �Ƽ���������:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="recom_name" type="text" id="recom_name" value="<?php echo htmlspecialchars($this->_var['recommend']['recom_name']); ?>" />
        <label class="field_notice">�Ƽ���������</label>    </td>
      </tr>
      <tr>
        <th></th>
        <td class="ptb20"><input class="formbtn" type="submit" name="Submit" value="�ύ" />
          <input class="formbtn" type="reset" name="Reset" value="����" />        </td>
      </tr>
    </table>
  </form>
</div>
<?php echo $this->fetch('footer.html'); ?>
