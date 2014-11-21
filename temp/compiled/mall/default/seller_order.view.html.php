<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <div class="particular">
        <div class="particular_wrap"><h2>��������</h2>
        <style type="text/css">
        .log_list {color:#666666; list-style:none; padding:5px 10px;}
         .log_list li {margin:8px 0px;}
        .log_list li .operator {font-weight:bold; color:#FE5400; margin-right:5px;}
        .log_list li .log_time {font-style:italic; margin:0px 5px; font-weight:bold;}
        .log_list li .order_status {font-style:italic; margin:0px 5px; font-weight:bold;}
        .log_list li .reason {font-style:italic; margin:0px 5px; font-weight:bold;}
        </style>
            <div class="box">
                <div class="state">����״̬&nbsp;:&nbsp;<strong><?php echo call_user_func("order_status",$this->_var['order']['status']); ?></strong></div>
                <div class="num">������&nbsp;:&nbsp;<?php echo $this->_var['order']['order_sn']; ?></div>
                <div class="time">�µ�ʱ��&nbsp;:&nbsp;<?php echo local_date("Y-m-d H:i:s",$this->_var['order']['add_time']); ?></div>
            </div>
            <h3>������Ϣ</h3>
            <dl class="info">
                <dt>�����Ϣ</dt>
                <dd>���&nbsp;:&nbsp;<?php echo htmlspecialchars($this->_var['order']['buyer_name']); ?></dd>
                <dd>�绰����&nbsp;:&nbsp;<?php echo ($this->_var['order']['phone_tel'] == '') ? '-' : $this->_var['order']['phone_tel']; ?></dd>
                 <dd>���ڵ���&nbsp;:&nbsp;<?php echo (htmlspecialchars($this->_var['order']['region_name']) == '') ? '-' : htmlspecialchars($this->_var['order']['region_name']); ?></dd>
                 <dd>�ֻ�����&nbsp;:&nbsp;<?php echo ($this->_var['order']['phone_mob'] == '') ? '-' : $this->_var['order']['phone_mob']; ?></dd>
                 <dd>�����ʼ�&nbsp;:&nbsp;<?php echo ($this->_var['order']['buyer_email'] == '') ? '-' : $this->_var['order']['buyer_email']; ?></dd>
                 <dd>��ϸ��ַ&nbsp;:&nbsp;<?php echo (htmlspecialchars($this->_var['order']['address']) == '') ? '-' : htmlspecialchars($this->_var['order']['address']); ?></dd>
             </dl>
         <div class="ware_line">
            <div class="ware">
                 <?php $_from = $this->_var['goods_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'goods');if (count($_from)):
    foreach ($_from AS $this->_var['goods']):
?>
                <div class="ware_list">
                       <div class="ware_pic"><img src="<?php echo $this->_var['goods']['goods_image']; ?>" width="50" height="50"  /></div>
                    <div class="ware_text">
                        <div class="ware_text1">
                        <a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>"><?php echo htmlspecialchars($this->_var['goods']['goods_name']); ?></a>
                        <?php if ($this->_var['group_id']): ?><a target="_blank" href="<?php echo url('app=groupbuy&id=' . $this->_var['group_id']. ''); ?>"><strong class="color8">[�Ź�]</strong></a><?php endif; ?>
                        <br />
                        <span><?php echo htmlspecialchars($this->_var['goods']['specification']); ?></span>
                        </div>
                        <div class="ware_text2">
                          <span>����&nbsp;:&nbsp;<strong><?php echo $this->_var['goods']['quantity']; ?></strong></span>
                          <span>����&nbsp;:&nbsp;<strong><?php echo $this->_var['goods']['price']; ?></strong></span>
						  <span>���֣�&nbsp;:&nbsp;<strong><?php echo $this->_var['goods']['integral']; ?>��</strong></span>
                          <?php if ($this->_var['goods']['sku']): ?><span>����&nbsp;:&nbsp;<strong><?php echo $this->_var['goods']['sku']; ?></strong></span><?php endif; ?>
                        </div>
                    </div>
                </div>
                <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                <div class="transportation">���ͷ���&nbsp;:&nbsp;<span><?php echo price_format($this->_var['order_extm']['shipping_fee']); ?><strong>(<?php echo htmlspecialchars($this->_var['order_extm']['shipping_name']); ?>)</strong></span>�Żݴ���&nbsp;:&nbsp;<span><?php echo price_format($this->_var['order']['discount']); ?></span>�����ܼ�&nbsp;:&nbsp;<b><?php echo price_format($this->_var['order']['order_amount']); ?></b><b> + <?php echo $this->_var['order']['int_amount']; ?>��</b>
                </div>
                <ul class="order_detail_list">
                   <?php if ($this->_var['order']['payment_code']): ?>
                    <li>֧����ʽ&nbsp;:&nbsp;<?php echo htmlspecialchars($this->_var['order']['payment_name']); ?></li>
                    <?php endif; ?>
                    <?php if ($this->_var['order']['pay_message']): ?>
                    <li>֧������&nbsp;:&nbsp;<?php echo htmlspecialchars($this->_var['order']['pay_message']); ?></li>
                    <?php endif; ?>
                    <li>�µ�ʱ��&nbsp;:&nbsp;<?php echo local_date("Y-m-d H:i:s",$this->_var['order']['add_time']); ?></li>
                    <?php if ($this->_var['order']['pay_time']): ?>
                    <li>֧��ʱ��&nbsp;:&nbsp;<?php echo local_date("Y-m-d H:i:s",$this->_var['order']['pay_time']); ?></li>
                    <?php endif; ?>
                    <?php if ($this->_var['order']['ship_time']): ?>
                    <li>����ʱ��&nbsp;:&nbsp;<?php echo local_date("Y-m-d H:i:s",$this->_var['order']['ship_time']); ?></li>
                    <?php endif; ?>
                    <?php if ($this->_var['order']['finished_time']): ?>
                    <li>���ʱ��&nbsp;:&nbsp;<?php echo local_date("Y-m-d H:i:s",$this->_var['order']['finished_time']); ?></li>
                    <?php endif; ?>
                </ul>
           </div>
       </div>
       <h3>�ջ��˼�������Ϣ</h3>
          <div class="goods">
           �ջ���ַ&nbsp;:&nbsp;<?php echo htmlspecialchars($this->_var['order_extm']['consignee']); ?><?php if ($this->_var['order_extm']['phone_mob']): ?>, &nbsp;<?php echo $this->_var['order_extm']['phone_mob']; ?><?php endif; ?><?php if ($this->_var['order_extm']['phone_tel']): ?>,&nbsp;<?php echo $this->_var['order_extm']['phone_tel']; ?><?php endif; ?>
                ,&nbsp;<?php echo htmlspecialchars($this->_var['order_extm']['region_name']); ?>&nbsp;<?php echo htmlspecialchars($this->_var['order_extm']['address']); ?>
                <?php if ($this->_var['order_extm']['zipcode']): ?>,&nbsp;<?php echo htmlspecialchars($this->_var['order_extm']['zipcode']); ?><?php endif; ?><br />
           ���ͷ�ʽ&nbsp;:&nbsp;<?php echo htmlspecialchars($this->_var['order_extm']['shipping_name']); ?><br/>
            <?php if ($this->_var['order']['invoice_no']): ?>
               ��������&nbsp;:&nbsp;<?php echo htmlspecialchars($this->_var['order']['invoice_no']); ?><!--&nbsp;&nbsp;&nbsp;&nbsp;<a href="<?php echo $this->_var['shipping_info']['query_url']; ?>&amp;<?php echo $this->_var['order']['invoice_no']; ?>" target="_blank">query_logistics</a>-->
               <br />
           <?php endif; ?>
           <?php if ($this->_var['order']['postscript']): ?>
           ��Ҹ���&nbsp;:&nbsp;<?php echo htmlspecialchars($this->_var['order']['postscript']); ?><br />
           <?php endif; ?>
          </div>
       <?php if ($this->_var['order_logs']): ?>
       <h3>������ʷ</h3>
        <ul class="log_list">
            <?php $_from = $this->_var['order_logs']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'log');if (count($_from)):
    foreach ($_from AS $this->_var['log']):
?>
            <li>
                <span class="operator"><?php if ($this->_var['log']['operator'] == '0'): ?><span style="color:green;">[ϵͳ]</span><?php else: ?><?php echo htmlspecialchars($this->_var['log']['operator']); ?><?php endif; ?></span>
                            ��
                <span class="log_time"><?php echo local_date("Y-m-d H:i:s",$this->_var['log']['log_time']); ?></span>
                            ������״̬��
                <span class="order_status"><?php echo $this->_var['log']['order_status']; ?></span>
                            �ı�Ϊ
                <span class="order_status"><?php echo $this->_var['log']['changed_status']; ?></span>
                <?php if ($this->_var['log']['remark']): ?>
                ԭ��:<span class="reason"><?php echo htmlspecialchars($this->_var['log']['remark']); ?></span>
                <?php endif; ?>
            </li>
            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
        </ul>
       <?php endif; ?>
       </div>
          <div class="particular_bottom"></div>
        </div>

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