<script type="text/javascript">
$(function(){
        $('#cancel_button').click(function(){
            DialogManager.close('seller_order_cancel_order');
         });
       $("input[name='cancel_reason']").click(function(){
        if ($(this).attr('flag') == 'other_reason')
        {
            $('#other_reason').show();
        }
        else
        {
            $('#other_reason').hide();
        }
    });
});
</script>
<ul class="tab">
    <li class="active">ȡ������</li>
</ul>
<div class="content1">
<div id="warning"></div>
<form method="post" action="index.php?app=seller_order&amp;act=cancel_order&amp;order_id=<?php echo $this->_var['order_id']; ?>" target="seller_order">
    <h1>���Ƿ�ȷ��Ҫȡ�����¶�����</h1>
    <?php $_from = $this->_var['orders']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'order');if (count($_from)):
    foreach ($_from AS $this->_var['order']):
?>
    <p>������&nbsp;&nbsp;&nbsp;&nbsp;:<span><?php echo $this->_var['order']['order_sn']; ?></span></p>
    <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
    <dl>
        <dt>ȡ��ԭ��:</dt>
        <dd>
            <div class="li"><input type="radio" checked name="cancel_reason" id="d1" value="�޷��������" /> <label for="d1">�޷��������</label></div>
            <div class="li"><input type="radio" name="cancel_reason" id="d2" value="������Ч�Ķ���" /> <label for="d2">������Ч�Ķ���</label></div>
            <div class="li"><input type="radio" name="cancel_reason" id="d3" value="�������Ҫ��" /> <label for="d3">�������Ҫ��</label></div>
            <div class="li"><input type="radio" name="cancel_reason" flag="other_reason" id="d4" value="����ԭ��" /> <label for="d4">����ԭ��</label></div>
        </dd>
        <dd id="other_reason" style="display:none">
            <textarea id="other_reason_input" class="text" style="width:200px;" name="remark"></textarea>
        </dd>
    </dl>
    <div class="btn">
        <input type="submit" id="confirm_button" class="btn1" value="ȷ��" />
    </div>
</form>
</div>