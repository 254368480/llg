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
<form method="post" action="index.php?app=buyer_order&act=cancel_order&order_id=<?php echo $this->_var['order']['order_id']; ?>" target="iframe_post">
    <h1>���Ƿ�ȷ��Ҫȡ�����¶�����</h1>
    <p>������:<span><?php echo $this->_var['order']['order_sn']; ?></span></p>
    <dl>
        <dt>ȡ��ԭ��:</dt>
        <dd>
            <div class="li"><input type="radio" checked name="cancel_reason" id="d1" value="��ѡ������Ʒ" /> <label for="d1">��ѡ������Ʒ</label></div>
            <div class="li"><input type="radio" name="cancel_reason" id="d2" value="��ѡ�������ͷ�ʽ" /> <label for="d2">��ѡ�������ͷ�ʽ</label></div>
            <div class="li"><input type="radio" name="cancel_reason" id="d3" value="��ѡ��������" /> <label for="d3">��ѡ��������</label></div>
            <div class="li"><input type="radio" name="cancel_reason" flag="other_reason" id="d4" value="����ԭ��" /> <label for="d4">����ԭ��</label></div>
        </dd>
        <dd id="other_reason" style="display:none">
            <textarea class="text" id="other_reason_input" style="width:200px;" name="remark"></textarea>
        </dd>
    </dl>
    <div class="btn">
        <input type="submit" id="confirm_button" class="btn1" value="ȷ��" />
    </div>
    </form>
</div>

