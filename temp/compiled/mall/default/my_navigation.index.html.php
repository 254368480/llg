<?php echo $this->fetch('member.header.html'); ?>
<script type="text/javascript" src="<?php echo $this->lib_base . "/" . 'tiny_mce/tiny_mce.js'; ?>"></script>
<script type="text/javascript" charset="<?php echo $this->_var['charset']; ?>" src="<?php echo $this->lib_base . "/" . 'swfupload/swfupload.js'; ?>"></script>
<script type="text/javascript" charset="<?php echo $this->_var['charset']; ?>" src="<?php echo $this->lib_base . "/" . 'swfupload/js/handlers.js'; ?>"></script>
<link type="text/css" rel="stylesheet" href="<?php echo $this->lib_base . "/" . 'swfupload/css/default.css'; ?>"/>
<div class="content">
    <div class="totline"></div><div class="botline"></div>
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
        <?php echo $this->fetch('member.submenu.html'); ?>
        <div class="wrap">
            <div class="eject_btn_two eject_pos1"><b class="ico3" ectype="dialog" dialog_title="��������"
            dialog_width="750" dialog_id="my_navigation_add" uri="index.php?app=my_navigation&amp;act=add">��������</b></div>

        <div class="public table">
            <table class="table_head_line">
                <?php if ($this->_var['navigations']): ?>
                <tr class="line_bold">
                    <th class="width1"><input type="checkbox" id="all" class="checkall"/></th>
                    <th class="align1" colspan="4">
                        <span class="all"><label for="all">ȫѡ</label></span>
                        <a href="javascript:void(0);" class="delete" ectype="batchbutton" uri="index.php?app=my_navigation&act=drop" name="nav_id" presubmit="confirm('��ȷ��Ҫɾ������')">ɾ��</a>
                    </th>
                </tr>
                <tr class="gray">
                    <th></th>
                    <th class="align1 width9">��������</th>
                    <th class="width15">�Ƿ���ʾ</th>
                    <th>����</th>
                    <th>����</th>
                </tr>
                <?php endif; ?>
                <?php $_from = $this->_var['navigations']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'navigation');$this->_foreach['v'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['v']['total'] > 0):
    foreach ($_from AS $this->_var['navigation']):
        $this->_foreach['v']['iteration']++;
?>
                <?php if (($this->_foreach['v']['iteration'] == $this->_foreach['v']['total'])): ?><tr class="line_bold"><?php else: ?><tr class="line"><?php endif; ?>
                    <td class="align2"><input type="checkbox" class="checkitem" value="<?php echo $this->_var['navigation']['article_id']; ?>" /></td>
                    <td><?php echo htmlspecialchars($this->_var['navigation']['title']); ?></td>
                    <td class="align2"><?php if ($this->_var['navigation']['if_show'] == 1): ?><p class="padding2"><span class="right_ico"></span></p><?php else: ?><p class="padding2"><span class="wrong_ico"></span></p><?php endif; ?></td>
                    <td class="align2"><?php echo $this->_var['navigation']['sort_order']; ?></td>
                    <td class="width13"><a href="javascript:void(0);" ectype="dialog" dialog_title="�༭����" dialog_width="750" dialog_id="my_navigation_edit" uri="index.php?app=my_navigation&amp;act=edit&nav_id=<?php echo $this->_var['navigation']['article_id']; ?>" class="edit1">�༭</a>  <a href="javascript:drop_confirm('��ȷ��Ҫɾ������', 'index.php?app=my_navigation&amp;act=drop&nav_id=<?php echo $this->_var['navigation']['article_id']; ?>');" class="delete">ɾ��</a></td>
                </tr>
                <?php endforeach; else: ?>
                <tr>
                    <td colspan="5" class="member_no_records padding6">û�з��������ĵ���</td>
                </tr>
                <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
                <?php if ($this->_var['navigations']): ?>
                <tr>
                    <th><input id="all2" type="checkbox" class="checkall" /></th>
                    <th colspan="4">
                    <p class="position1">
                        <span class="all"><label for="all2">ȫѡ</label></span>
                        <a href="javascript:void(0);" class="delete" ectype="batchbutton" uri="index.php?app=my_navigation&act=drop" name="nav_id" presubmit="confirm('��ȷ��Ҫɾ������')">ɾ��</a>
                    </p>
                    <p class="position2">
                    <?php echo $this->fetch('member.page.bottom.html'); ?>
                    </p>
                    </th>
                </tr>
                <?php endif; ?>
            </table>
            </div>
            <div class="wrap_bottom"></div>
        </div>
        <iframe name="my_navigation" style="display:none"></iframe>
        <div class="clear"></div>
        <div class="adorn_right1"></div>
        <div class="adorn_right2"></div>
        <div class="adorn_right3"></div>
        <div class="adorn_right4"></div>
    </div>
    <div class="clear"></div>
    </div>
</div>
<?php echo $this->fetch('footer.html'); ?>
