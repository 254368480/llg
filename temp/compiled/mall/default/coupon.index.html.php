<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right"> <?php echo $this->fetch('member.submenu.html'); ?>
        <div class="wrap">
            <div class="public table">
                <table>
                    <div class="eject_btn_two eject_pos1" title="���"><b class="ico3" ectype="dialog" dialog_title="���" dialog_id="coupon_add" dialog_width="480" uri="index.php?app=coupon&amp;act=add">�����Ż�ȯ</b></div>
                    <?php if ($this->_var['coupons']): ?>
                    <tr class="line_bold" >
                        <th class="width1"><input id="all" type="checkbox" class="checkall" /></th>
                        <th class="align1" colspan="6">
                           <label for="all"> <span class="all">ȫѡ</span> </label>
                            <a href="javascript:void(0);" class="delete" ectype="batchbutton" uri="index.php?app=coupon&act=drop" name="id" presubmit="confirm('��ȷ��Ҫɾ������')">ɾ��</a>
                        </th>
                    </tr>
                    
                    <tr class="gray">
                        <th></th>
                        <th>�Ż�ȯ����</th>
                        <th>�Żݽ��</th>
                        <th>ʹ�ô���</th>
                        <th>ʹ������</th>
                        <th>ʹ������</th>
                        <th>����</th>
                    </tr>
                     <?php endif; ?>
                <?php if ($this->_var['coupons']): ?>
                <tbody>
                <?php endif; ?>
                <?php $_from = $this->_var['coupons']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'coupon');$this->_foreach['v'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['v']['total'] > 0):
    foreach ($_from AS $this->_var['coupon']):
        $this->_foreach['v']['iteration']++;
?>
                <tr class="line<?php if (($this->_foreach['v']['iteration'] == $this->_foreach['v']['total'])): ?> last_line<?php endif; ?>">
                    <td class="align2"><input type="checkbox" class="checkitem" value="<?php echo $this->_var['coupon']['coupon_id']; ?>" <?php if ($this->_var['coupon']['if_issue'] && $this->_var['coupon']['end_time'] > $this->_var['time']): ?>disabled="disabled"<?php endif; ?> /></td>
                    <td><?php echo $this->_var['coupon']['coupon_name']; ?></td>
                    <td class="align4"><?php if ($this->_var['coupon']['coupon_value']): ?><?php echo $this->_var['coupon']['coupon_value']; ?><?php else: ?>������<?php endif; ?></td>
                    <td class="align4"><?php if ($this->_var['coupon']['use_times']): ?><?php echo $this->_var['coupon']['use_times']; ?><?php else: ?>������<?php endif; ?></td>
                    <td><?php echo local_date("Y-m-d",$this->_var['coupon']['start_time']); ?> �� <?php if ($this->_var['coupon']['end_time']): ?><?php echo local_date("Y-m-d",$this->_var['coupon']['end_time']); ?><?php else: ?>������<?php endif; ?></td>
                    <td><?php if ($this->_var['coupon']['min_amount']): ?><?php echo sprintf('һ�ι����� %s', $this->_var['coupon']['min_amount']); ?><?php else: ?>������<?php endif; ?></td>
                    <td class="align2">
                        <?php if ($this->_var['coupon']['if_issue'] && $this->_var['coupon']['end_time'] > $this->_var['time']): ?><a href="javascript:void(0);" class="export" uri="index.php?app=coupon&act=export&id=<?php echo $this->_var['coupon']['coupon_id']; ?>" dialog_id="coupon_export" dialog_title="����" dialog_width="320" ectype="dialog">����</a>  <a href="javascript:void(0);" class="extend" uri="index.php?app=coupon&act=extend&id=<?php echo $this->_var['coupon']['coupon_id']; ?>" dialog_id="coupon_extend" dialog_title="����" dialog_width="320" ectype="dialog">����</a><?php elseif ($this->_var['coupon']['if_issue'] && $this->_var['coupon']['end_time'] <= $this->_var['time']): ?><a class="delete" href="javascript:drop_confirm('��ȷ��Ҫɾ������', 'index.php?app=coupon&act=drop&id=<?php echo $this->_var['coupon']['coupon_id']; ?>');">ɾ��</a><?php else: ?><a class="start" href="javascript:drop_confirm('һ�������������޸��Ż�ȯ��Ϣ', 'index.php?app=coupon&act=issue&id=<?php echo $this->_var['coupon']['coupon_id']; ?>');">����</a> <a href="javascript:void(0);" class="edit1" uri="index.php?app=coupon&amp;act=edit&id=<?php echo $this->_var['coupon']['coupon_id']; ?>" dialog_id="coupon_edit" dialog_title="�༭" dialog_width="460" ectype="dialog">�༭</a> <a class="delete" href="javascript:drop_confirm('��ȷ��Ҫɾ������', 'index.php?app=coupon&act=drop&id=<?php echo $this->_var['coupon']['coupon_id']; ?>');">ɾ��</a><?php endif; ?>
                    </td>
                </tr>
                <?php endforeach; else: ?>
                <tr>
                    <td colspan="8" class="member_no_records padding6">û�з��������ļ�¼</td>
                </tr>
                <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
                <?php if ($this->_var['coupons']): ?>
                </tbody>
                <?php endif; ?>
                <?php if ($this->_var['coupons']): ?>
                <tr class="line_bold line_bold_bottom">
                    <td colspan="8">&nbsp;</td>
                </tr>
                <tr>
                    <th><input id="all2" type="checkbox" class="checkall" /></th>
                    <th colspan="7"><p class="position1"><label for="all2"><span class="all">ȫѡ</span></label>
                     <a href="javascript:void(0);" ectype="batchbutton" class="delete" uri="index.php?app=coupon&act=drop" name="id" presubmit="confirm('��ȷ��Ҫɾ������')">ɾ��</a></p>
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
        <iframe name="coupon" style="display:none;"></iframe>
        <div class="clear"></div>
        <div class="adorn_right1"></div>
        <div class="adorn_right2"></div>
        <div class="adorn_right3"></div>
        <div class="adorn_right4"></div>
    </div>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>