<?php echo $this->fetch('header.html'); ?>
<?php echo $this->_var['build_editor']; ?>
<div id="rightTop">
    <p>֪ͨģ��</p>
    <ul class="subnav">
        <li><a class="btn1" href="index.php?app=mailtemplate&amp;type=<?php echo $this->_var['notice_mail']; ?>">�ʼ�ģ��</a></li>
        <li><a class="btn1" href="index.php?app=mailtemplate&amp;type=<?php echo $this->_var['notice_msg']; ?>">����Ϣģ��</a></li>
    </ul>
</div>

<div class="info">
    <form method="post" enctype="multipart/form-data">
        <table class="infoTable">
            <tr>
                <th class="paddingT15">
                    <label for="link">��Ϣ����:</label></th>
                <td class="paddingT15 wordSpacing5">
                    <textarea style="width:650px;height:300px;" name="msgtemplate"><?php echo $this->_var['msgtemplate']; ?></textarea>
                </td>
            </tr>
            <tr>
            <th></th>
            <td class="ptb20">
                <input class="formbtn" type="submit" name="Submit" value="�ύ" />
                <input class="formbtn" type="reset" name="reset" value="����" />
            </td>
        </tr>
        </table>
    </form>
</div>
<?php echo $this->fetch('footer.html'); ?>
