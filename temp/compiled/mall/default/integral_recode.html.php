<?php echo $this->fetch('member.header.html'); ?>
<link href="/public/date/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/public/date/date.js" charset="utf-8"></script>
<script>
    $(function () {
        $("input.date").manhuaDate({
            Event: "click", //��ѡ
            Left: 0, //����ʱ��ͣ�������λ��
            Top: -16, //����ʱ��ͣ���Ķ�����λ��
            fuhao: "-", //�������ӷ�Ĭ��Ϊ-
            isTime: false, //�Ƿ���ʱ��ֵĬ��Ϊfalse
            beginY: 1949, //��ݵĿ�ʼĬ��Ϊ1949
            endY: 2100//��ݵĽ���Ĭ��Ϊ2049
        });
    });
</script>

<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
	    <h1>���ֲ�����¼</h1>
        <div class="wrap_line margin1">
            <div class="recode_search" style="margin-top: 20px;margin-left: 20px;margin-bottom: 10px">
                <form style="float: left" method="post">
                    ת����Ա��<input type="text" name="inuser" >
                    ת���Ա��<input type="text" name="touser" >
                    ʱ��ӣ�<input type="text" class="date" name="start"> �� <input class="date" type="text" name="end">
                    <input class="btn" type="submit" name="dosubmit" value="����">

                </form>
                <form style="float: left;margin-left: 5px" method="post">
                    <input type="hidden" name="con" value="<?php echo $this->_var['con']; ?>">
                    <input class="btn" type="submit" name="download" value="�����б�">
                </form>
                <div style="clear:both;width: 0;"></div>
            </div>
		    <table class="recode_table" border="3" >
				<tr>
					<th align="left">ת����Ա</th>
					<th align="left">ת���Ա</th>
					<th align="left">��������</th>
					<th align="left">����ʱ��</th>
					<th align="left">����˵��</th>
				</tr>
			<?php $_from = $this->_var['recode']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'value');if (count($_from)):
    foreach ($_from AS $this->_var['value']):
?>	
				<tr>
					<td><?php echo $this->_var['value']['fromuser']; ?></td>
					<td><?php echo $this->_var['value']['touser']; ?></td>
					<td><?php echo $this->_var['value']['integral']; ?></td>
					<td><?php echo local_date("Y-m-d",$this->_var['value']['time']); ?></td>
					<td><?php echo $this->_var['value']['content']; ?></td>
				</tr>
			<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
			</table>
				<div class="pageLinks" style="">
					<?php if ($this->_var['recode']): ?><?php echo $this->fetch('page.bottom.html'); ?><?php endif; ?>
				</div>
            <div class="wrap_bottom"></div>
        </div>
        


        <div class="clear"></div>
        <div class="adorn_right1"></div>
        <div class="adorn_right2"></div>
        <div class="adorn_right3"></div>
        <div class="adorn_right4"></div>
    </div>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>
