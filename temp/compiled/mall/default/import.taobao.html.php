<?php echo $this->fetch('member.header.html'); ?>
<?php echo $this->_var['build_upload']; ?>
<style>
h2.title a.fold {position: absolute; top: 4px; right: 8px; width: 13px; height: 13px; overflow: hidden; display: block;}
.span_close {background: url(<?php echo $this->res_base . "/" . 'images/member/close.gif'; ?>);}
.span_open {background: url(<?php echo $this->res_base . "/" . 'images/member/open.gif'; ?>);}
.title {line-height: 24px; height: 24px; position: relative; background: #f5f5f5; font-size: 12px; color: #3e3e3e; padding-left: 20px; word-spacing: 3px; cursor: pointer;}

.btn { background:transparent url(<?php echo $this->res_base . "/" . 'images/member/btn.gif'; ?>) repeat scroll 0 -590px; color:#3E3E3E; display:block; float:left; height: 24px; line-height:20px; margin: 0 3px; text-align:center; text-decoration:none; width:78px;}
.f_l{float:left;}
.sub_btn {background:transparent url(<?php echo $this->res_base . "/" . 'images/member/btn.gif'; ?>) no-repeat scroll 0 -253px; border:0 none; color:#3F3D3E; cursor:pointer; font-weight:bold; height:32px; width:120px; }
.gray{color: #B9B9B9; line-height: 22px; margin-left: 10px;}
.select select {color: #3D3D3D; padding: 2px;}
.table_text td {height : 30px; vertical-align:middle;}
</style>
<script type="text/javascript">
//<!CDATA[

function add_uploadedfile(file_data)
{
    $('label.right').show();
}
function uploadSuccess(file, serverData) {
    try {
        eval('serverData = '+serverData);
        var errorMsg = '';
        var progress = new FileProgress(file,  this.customSettings);
        if (serverData.done) {
            serverData.retval.file_name = file.name;
            add_uploadedfile(serverData.retval);
            progress.setStatus(lang.finish);
            progress.setComplete();
            progress.toggleCancel(false);
        } else {
            //addImage(SITE_URL + "/includes/libraries/javascript/swfupload/images/error.gif");
            progress.setStatus(lang.error);
            progress.toggleCancel(false);
            if(typeof(serverData.msg) == 'object'){
                $.each(serverData.msg, function(i, val){
                    errorMsg += lang.get(val.msg) + '[' + val.obj + ']\n';
                });
            } else {
                errorMsg += lang.get(serverData.msg);
            }
            if(errorMsg != ''){
                swfupload_error(errorMsg);
            }
        }


    } catch (ex) {
        this.debug(ex);
    }
}

function swfupload_error(str)
{
    $('#warning').append('<label class="error">' + str + '</label>');
    $('#warning').show();
}
$(function(){
        gcategoryInit("gcategory");
});
//]]>
</script>
<div class="content">
  <div class="totline"></div>
  <div class="botline"></div>
  <?php echo $this->fetch('member.menu.html'); ?>
  <div id="right"> <?php echo $this->fetch('member.submenu.html'); ?>
    <div class="wrap">
      <div class="public">
        <form method="post" enctype="multipart/form-data" id="goods_form">
            <h2 class="title">
            ��һ��������CSV�ļ�<?php if ($this->_var['step'] == 2): ?><label class="error right">OK!<?php endif; ?></label><a title="close" class="fold <?php if ($this->_var['step'] == 2): ?>span_open<?php else: ?>span_close<?php endif; ?>"></a>
          </h2>
          <ul<?php if ($this->_var['step'] == 2): ?> style="display:none"<?php endif; ?>>
          <table class="table_text word_spacing5" style="margin-top:15px">
            <tr>
              <td valign="top"><p>��ѡ���ļ�: </p></td>
              <td><input type="file" name="csv" id="csv" /> <span class="gray">�������Ĭ�ϴӵڶ���ִ�е��룬�뱣��CSV�ļ���һ�еı����У����2M</span></td>
            </tr>
            <tr>
              <td valign="top">��Ʒ����: </th>
              <td><div class="select" id="gcategory">
                  <input type="hidden" name="cate_id" value="<?php echo $this->_var['goods']['cate_id']; ?>" class="mls_id" />
                  <input type="hidden" name="cate_name" value="<?php echo htmlspecialchars($this->_var['goods']['cate_name']); ?>" class="mls_names" />
                  <select>
                    <option>��ѡ��...</option>
                    <?php echo $this->html_options(array('options'=>$this->_var['mgcategories'])); ?>
                  </select>
                  <span class="gray">��ѡ����Ʒ���ࣨ����ѡ�����һ����</span>
                </div>
                </td>
            </tr>
            <tr>
              <td>�������: </th>
              <td>
                <div class="f_l select">
                <select name="sgcate_id[]" class="sgcategory">
                  <option value="0">��ѡ��...</option>
                  <?php echo $this->html_options(array('options'=>$this->_var['sgcategories'])); ?>
                </select>
                </div>
                <a class="btn" id="add_sgcategory" href="javascript:;">����</a>
                <span class="gray">���Դ����ڶ���������</span></td>
            </tr>
            <tr>
              <td valign="top">�ַ�����: </th>
              <td><p>
                  <label> </label>
                  <label>unicode</label>
              </p>
                </td>
            </tr>
            <tr>
              <td valign="top">�ļ���ʽ: </th>
              <td>csv�ļ�</td>
            </tr>
            <tr>
              <td valign="top"><p>����˵��: </p></td>
              <td><span class="gray" style="display:block;">1.����޸�CSV�ļ������ʹ��΢��excel�������ұ��뱣֤��һ�б�ͷ���ƺ���������Ŀ��<br />�������ơ�������Ŀ�������۸񡢱�������������ֿ⡢�����Ƽ���������������ͼƬ������������ϡ��������Ա�����<br />2.�����Ϊ�Ա������汾�����ͷ�����г��룬�����޸ĳ����������Ʒ��ɵ��롣<br />3.���CSV�ļ�����2M��ͨ��excel�����༭��ɶ���ļ����е���<br />4.ÿ����Ʒ���֧�ֵ���7��ͼƬ</span></td>
            </tr>
          </table>
          <div class="send_out">
            <input class="sub_btn" type="submit" value="����" />
          </div>
          </ul>
          <h2 class="title">
            �ڶ������ϴ���ƷͼƬ<label style="display:none" class="error right">OK!</label><a title="close" class="fold <?php if ($this->_var['step'] == 2): ?>span_close<?php else: ?>span_open<?php endif; ?>"></a>
          </h2>
          <ul<?php if ($this->_var['step'] == 1): ?> style="display:none"<?php endif; ?>>

          <table class="word_spacing5">
              <tr>
                <td><span class="gray">���ϴ���csv�ļ�ͬ����imagesĿ¼(����csv�ļ�ͬ����Ŀ¼)�ڵ�tbi�ļ�</span></td>
              </tr>
              <tr id="trUploadContainer">
                  <td height="40" valign="top">
                      <div id="divSwfuploadContainer" style="width:740px;">
                          <div id="divButtonContainer">
                              <span id="spanButtonPlaceholder"></span>
                          </div>
                          <div id="divFileProgressContainer"></div>
                      </div>
                      <div id="warning"></div>
                  </td>
              </tr>
          </table>
          </ul>
          </td>
           </tr>
          </table>
        </form>
      </div>
    </div>
  </div>
  <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>