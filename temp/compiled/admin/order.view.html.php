<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
    <p><b>��������</b></p>
</div>
<div class="info">
    <div class="demand">
    </div>
    <div class="order_form">
        <h1>����״̬</h1>
        <ul>
            <li><b>������:</b><?php echo $this->_var['order']['order_sn']; ?><?php if ($this->_var['order']['extension'] == 'groupbuy'): ?>[�Ź�]<?php endif; ?>&nbsp;&nbsp;&nbsp;<?php if ($this->_var['order']['group_id']): ?>[<a href="<?php echo $this->_var['site_url']; ?>/index.php?app=groupbuy&id=<?php echo $this->_var['order']['group_id']; ?>" target="_blank">�Ź�����</a>]<?php endif; ?></li>
            <li><b>����״̬:</b> <?php echo call_user_func("order_status",$this->_var['order']['status']); ?></li>
            <li><b>�����ܼ�:</b> <span class="red_common"><?php echo price_format($this->_var['order']['order_amount']); ?></span>(�Ż���:<?php echo price_format($this->_var['order']['discount']); ?>)</li>
        </ul>
        <div class="clear"></div>
    </div>
    <div class="order_form">
        <h1>��������</h1>
        <h2>������Ϣ</h2>
        <ul>
            <li><b>������� :</b> <?php echo htmlspecialchars($this->_var['order']['buyer_name']); ?></li>
            <li><b>�������� :</b> <?php echo htmlspecialchars($this->_var['order']['seller_name']); ?></li>
            <?php if ($this->_var['order']['payment_code']): ?>
            <li><b>֧����ʽ:</b><?php echo htmlspecialchars($this->_var['order']['payment_name']); ?></li>
            <?php endif; ?>
            <?php if ($this->_var['order']['pay_message']): ?>
            <li><b>֧������ :</b><?php echo htmlspecialchars($this->_var['order']['pay_message']); ?></li>
            <?php endif; ?>
            <li><b>�µ�ʱ��:</b><?php echo local_date("Y-m-d H:i:s",$this->_var['order']['add_time']); ?></li>
            <?php if ($this->_var['order']['pay_time']): ?>
            <li><b>֧��ʱ��:</b><?php echo local_date("Y-m-d H:i:s",$this->_var['order']['pay_time']); ?></li>
            <?php endif; ?>
            <?php if ($this->_var['order']['ship_time']): ?>
            <li><b>����ʱ��:</b><?php echo local_date("Y-m-d H:i:s",$this->_var['order']['ship_time']); ?></li>
            <?php endif; ?>
            <?php if ($this->_var['order']['finished_time']): ?>
            <li><b>���ʱ��:</b><?php echo local_date("Y-m-d H:i:s",$this->_var['order']['finished_time']); ?></li>
            <?php endif; ?>
            <?php if ($this->_var['order']['postscript']): ?>
            <li><b>��Ҹ���:</b><?php echo htmlspecialchars($this->_var['order']['postscript']); ?></li>
            <?php endif; ?>
        </ul>
        <div class="clear"></div>
    </div>

    <div class="order_form">
        <h2>�ջ��˼�������Ϣ</h2>
        <ul>
            <li><b>�ջ�������:</b> <?php echo htmlspecialchars($this->_var['order_extm']['consignee']); ?></li>
            <li><b>���ڵ���:</b> <?php echo htmlspecialchars($this->_var['order_extm']['region_name']); ?></li>
            <li><b>��������:</b> <?php echo htmlspecialchars($this->_var['order_extm']['zipcode']); ?></li>
            <li><b>�绰����:</b> <?php echo htmlspecialchars($this->_var['order_extm']['phone_tel']); ?></li>
            <li><b>�ֻ�����:</b> <?php echo htmlspecialchars($this->_var['order_extm']['phone_mob']); ?></li>
            <li><b>��ϸ��ַ:</b> <?php echo htmlspecialchars($this->_var['order_extm']['address']); ?></li>
            <li><b>���ͷ�ʽ:</b> <?php echo htmlspecialchars($this->_var['order_extm']['shipping_name']); ?></li>
            <?php if ($this->_var['order']['invoice_no']): ?>
            <li><b>��������:</b> <?php echo htmlspecialchars($this->_var['order']['invoice_no']); ?></li>
            <?php endif; ?>
        </ul>
        <div class="clear"></div>
    </div>
    <div class="order_form">
        <h2>��Ʒ��Ϣ</h2>
        <?php $_from = $this->_var['goods_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'goods');if (count($_from)):
    foreach ($_from AS $this->_var['goods']):
?>
        <div class="order_info">
            <a href="<?php echo $this->_var['site_url']; ?>/index.php?app=goods&amp;id=<?php echo $this->_var['goods']['goods_id']; ?>" target="_blank" class="order_info_pic"><img width="50" height="50" alt="goods_pic" src="<?php echo $this->_var['goods']['goods_image']; ?>" /></a>
            <div class="order_info_text"><a href="<?php echo $this->_var['site_url']; ?>/index.php?app=goods&amp;id=<?php echo $this->_var['goods']['goods_id']; ?>" target="_blank"><?php echo htmlspecialchars($this->_var['goods']['goods_name']); ?></a><br /><?php echo htmlspecialchars($this->_var['goods']['specification']); ?></div>
            <p><b>���� :</b> <span class="red_common"><?php echo price_format($this->_var['goods']['price']); ?></span></p>
            <p><b>���� :</b> <?php echo $this->_var['goods']['quantity']; ?></p>
        </div>
        <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
        <div class="clear"></div>
    </div>
</div>

<?php echo $this->fetch('footer.html'); ?>
