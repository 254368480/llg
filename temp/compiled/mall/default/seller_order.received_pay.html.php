<script type="text/javascript">
$(function(){
    $('#cancel_button').click(function(){
        DialogManager.close('seller_order_received_pay');
    });
});
</script>
<ul class="tab">
    <li class="active">�յ�����</li>
</ul>
<div class="content1">
<div id="warning"></div>
<form method="post" action="index.php?app=seller_order&amp;act=received_pay&amp;order_id=<?php echo $this->_var['order']['order_id']; ?>" target="seller_order">
    <h1>��ȷ���Ѿ��յ���ҵĻ�������</h1>
    <p>������&nbsp;&nbsp;&nbsp;&nbsp;:<span><?php echo $this->_var['order']['order_sn']; ?></span></p>
    <dl>
        <dt>����ԭ��:</dt>
        <dd><textarea class="text" id="remark_input" style="width:200px;" name="remark"></textarea></dd>
    </dl>
    <div class="btn">
        <input type="submit" id="confirm_button" class="btn1" value="ȷ��" />
        <input type="button" id="cancel_button" class="btn2" value="ȡ��" />
    </div>
</form>
</div>