<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
    <p>��������</p>
    <ul class="subnav">
        <li><span>����</span></li>
        <li><a class="btn1" href="index.php?app=share&amp;act=add">����</a></li>
    </ul>
</div>
<div class="mrightTop">
    <div class="fontl">
    </div>
    <div class="fontr">
    <?php echo $this->fetch('page.top.html'); ?>
    </div>
</div>
<div class="tdare">
    <table width="100%" cellspacing="0" class="dataTable">
        <?php if ($this->_var['shares']): ?>
        <tr class="tatr1">
            <td width="20" class="firstCell"><input type="checkbox" class="checkall" /></td>
            <td align="left" width="200">��������</td>
            <td width="80">���</td>
            <td align="left">ͼƬ��ʶ</td>
            <td align="left">�ӿڵ�ַ</td>
            <td class="table-center">����</td>
            <td class="handler">����</td>
        </tr>
        <?php endif; ?>
        <?php $_from = $this->_var['shares']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('share_id', 'share');if (count($_from)):
    foreach ($_from AS $this->_var['share_id'] => $this->_var['share']):
?>
        <tr class="tatr2">
            <td class="firstCell"><input type="checkbox" class="checkitem" value="<?php echo $this->_var['share_id']; ?>"/></td>
            <td><?php echo htmlspecialchars($this->_var['share']['title']); ?></td>
            <td><?php echo $this->_var['type'][$this->_var['share']['type']]; ?></td>
            <td><img class="makesmall" max_width="16" max_height="16" src="<?php echo $this->_var['site_url']; ?>/<?php echo $this->_var['share']['logo']; ?>" /></td>
            <td><?php echo htmlspecialchars($this->_var['share']['link']); ?></td>
            <td class="table-center"><span ectype="inline_edit" fieldname="sort_order" fieldid="<?php echo $this->_var['share_id']; ?>" datatype="pint" maxvalue="255" class="editable" title="�������Ա༭"><?php echo $this->_var['share']['sort_order']; ?></span></td>
            <td class="handler"><a href="index.php?app=share&amp;act=edit&amp;id=<?php echo $this->_var['share_id']; ?>">�༭</a>
                |
                <a href="javascript:drop_confirm('��ȷ��Ҫɾ������', 'index.php?app=share&amp;act=drop&amp;id=<?php echo $this->_var['share_id']; ?>');">ɾ��</a></td>
        </tr>
        <?php endforeach; else: ?>
        <tr class="no_data">
            <td colspan="7">û�з��������ļ�¼</td>
        </tr>
        <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
    </table>
    <?php if ($this->_var['shares']): ?>
    <div id="dataFuncs">
        <div id="batchAction"  class="left paddingT15">
            &nbsp;&nbsp;
            <input class="formbtn batchButton" type="button" value="ɾ��" name="id" uri="index.php?app=share&act=drop" presubmit="confirm('��ȷ��Ҫɾ������');" />
            &nbsp;&nbsp;
        </div>
        <div class="clear"></div>
    </div>
    <?php endif; ?>
</div>

<?php echo $this->fetch('footer.html'); ?>
