<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
  <p>����</p>
  <ul class="subnav">
    <li><a class="btn1" href="index.php?app=store">����</a></li>
    <li><span>����</span></li>
    <li><a class="btn1" href="index.php?app=store&amp;wait_verify=1">�����</a></li>
  </ul>
</div>
<div class="info">
  <form method="post" enctype="multipart/form-data" id="test_form">
    <table class="infoTable">
      <tr>
          <th></th>
        <td class="paddingT15">������Ҫ������û�����Ϣ</td>
      </tr>
      <tr>
        <th class="paddingT15"> �û���:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="user_name" type="text" id="user_name" /></td>
      </tr>
      <tr>
        <th class="paddingT15"> ����:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="password" type="text" id="password" />
          &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="need_password" value="1" id="checkbox" checked="checked" />
        <label for="need_password">��Ҫ��֤����</label></td>
      </tr>
      <tr>
        <th></th>
        <td class="ptb20"><input class="formbtn" type="submit" name="Submit" value="�ύ" />
          <input class="formbtn" type="reset" name="Reset" value="����" /></td>
      </tr>
    </table>
  </form>
</div>
<?php echo $this->fetch('footer.html'); ?> 