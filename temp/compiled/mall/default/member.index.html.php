<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
	    <h1>��Ա������ҳ</h1>
        <div class="wrap_line margin1">
		     <div class="user_info"> 
			 		<h1>��������</h1>
			 		<table class="user_table" border="1" bordercolor="#FFF" >
						<tr><th>������</th><td><?php echo $this->_var['dls']['user_name']; ?></td><th>�����̵绰</th><td><?php echo $this->_var['dls']['im_msn']; ?></td></tr>
						<tr><th>������</th><td><?php echo $this->_var['fxs']['user_name']; ?></td><th>�����̵绰</th><td><?php echo $this->_var['fxs']['im_msn']; ?></td></tr>
						<tr><th>������λ</th><td><?php echo $this->_var['user_info']['deposit']; ?></td><th>������λ�绰</th><td><?php echo $this->_var['deposit_user']['im_msn']; ?></td></tr>
				   </table>
				   <h1>������Ϣ</h1>
				   <table class="user_table" border="1" bordercolor="#FFF" >
				   <tr><?php if ($this->_var['time'] <= 30): ?><div style="color:#FF0000;margin-left:20px;margin-top:10px;">�װ��Ļ�Ա������<?php echo $this->_var['time']; ?>�죬����ƽ̨ʹ�÷Ѿ�Ҫ�����ˣ��뼰ʱ�ɷ�!</div><?php endif; ?></tr>
				   
				   <tr>
						<th>�������</th>
						<td> <?php echo $this->_var['user_info']['integral']; ?>��</td>
						<th>��Ŀǰ��</th>
						<td> <?php echo $this->_var['user_info']['grade']; ?></td>
					</tr>
					
					<tr>
						<th>����Ԥ���</th>
						<td> ��<?php echo $this->_var['user_info']['money']; ?></td>
						<th>����������</th>
						<td><?php echo $this->_var['order_num']; ?> [<a href="index.php?app=buyer_order">�鿴�����б�]</a></td>
					</tr>
					
					<tr>
						<th>����¼ʱ��</th>
						<td> <?php echo local_date("Y-m-d",$this->_var['user']['last_login']); ?></td>
						<th>ע��ʱ��</th>
						<td> <?php echo local_date("Y-m-d",$this->_var['user']['reg_time']); ?></td>
					</tr>
					<tr>
						<th>������λ</th>
						<td><?php echo $this->_var['user_info']['deposit']; ?></td>
						<th>����׬�ּ�¼</th>
						<td><?php echo $this->_var['user_info']['td_int']; ?>��</td>
					</tr>
					<tr>
						<th>�ƹ����� </th>
						<td colspan="3">http://www.linglegou.com/index.php?app=member&act=register&tid=<?php echo $this->_var['user']['user_id']; ?></td>
					</tr>
				   </table>
			   
			 </div>
			 
            <div class="wrap_bottom"></div>
        </div>
        <div class="wrap_line margin1">
            <div class="public_index">
                <div class="information_index">
                    <h3 class="title">�������</h3>
                    <?php if ($this->_var['buyer_stat'] && $this->_var['buyer_stat']['sum']): ?>
                    <div class="remind">
                        <dl>
                            <dt>��������</dt>
                            <dd><?php echo sprintf('���� <span class="red">%s</span> ��������Ķ������뾡�쵽��<a href="index.php?app=buyer_order&type=pending">�������</a>���и���', $this->_var['buyer_stat']['pending']); ?></dd>
                            <dd><?php echo sprintf('���� <span class="red">%s</span> �����������ѷ������ȴ�����ȷ�ϣ��뾡�쵽��<a href="index.php?app=buyer_order&type=shipped">�ѷ�������</a>����ȷ��', $this->_var['buyer_stat']['shipped']); ?></dd>
                            <dd><?php echo sprintf('���� <span class="red">%s</span> ��������û�����ۣ��뾡�쵽��<a href="index.php?app=buyer_order&type=finished">����ɶ���</a>����ȷ��', $this->_var['buyer_stat']['finished']); ?></dd>
                        </dl>
                       
                        <a href="<?php echo url('app=buyer_order'); ?>" class="btn pos1" title="�鿴�ҵĶ���"><span class="pic1">�鿴�ҵĶ���</span></a>
                    </div>
                    <?php else: ?>
                    <div class="awoke">
                        ��Ŀǰ��û�������ɵĶ���<br />ȥ<a href="index.php">�̳���ҳ</a>����ѡϲ������Ʒ�����鹺����Ȥ�ɡ�
                    </div>
                    <?php endif; ?>
                </div>

            </div>
            <div class="wrap_bottom"></div>
        </div>
<?php if ($this->_var['store']): ?>
        <div class="wrap_line">
            <div class="public_index">
                <div class="information_index">
                    <h3 class="title">��������
                        <p>
                        <span>���̵ȼ�: <?php echo $this->_var['sgrade']['grade_name']; ?></span>
                        <span>��Ч��: <?php if ($this->_var['sgrade']['add_time']): ?><?php echo sprintf('ʣ�� %s ��', $this->_var['sgrade']['add_time']); ?><?php else: ?>������<?php endif; ?></span>
                        <span>��Ʒ����: <?php echo $this->_var['sgrade']['goods']['used']; ?>/<?php if ($this->_var['sgrade']['goods']['total']): ?><?php echo $this->_var['sgrade']['goods']['total']; ?><?php else: ?>������<?php endif; ?></span>
                        <span>�ռ�ʹ��: <?php echo $this->_var['sgrade']['space']['used']; ?>M/<?php if ($this->_var['sgrade']['space']['total']): ?><?php echo $this->_var['sgrade']['space']['total']; ?>M<?php else: ?>������<?php endif; ?></span>
                        </p>
                    </h3>
                    <div class="remind">
                        <dl>
                            <dt>��������</dt>
                            <dd><?php echo sprintf('���� <span class="red">%s</span> ��������Ķ������뾡�쵽��<a href="index.php?app=seller_order&type=submitted">���ύ����</a>���д���', $this->_var['seller_stat']['submitted']); ?></dd>
                            <dd><?php echo sprintf('���� <span class="red">%s</span> ���������Ķ������뾡�쵽��<a href="index.php?app=seller_order&type=accepted">����������</a>���д���', $this->_var['seller_stat']['accepted']); ?></dd>
                        </dl>
                        <dl>
                            <dt>�Ź�����</dt>
                            <dd><?php echo sprintf('���� <span class="red">%s</span> ��������Ź���ѽ������뾡�쵽��<a href="index.php?app=seller_groupbuy&state=end">�ѽ������Ź�</a>����ȷ�����', $this->_var['seller_stat']['groupbuy_end']); ?></dd>
                        </dl>
                        <a href="<?php echo url('app=store&id=' . $this->_var['store']['store_id']. ''); ?>" title="�鿴�ҵĵ���" target="_blank" class="btn1 pos2"><span class="pic2">�鿴�ҵĵ���</span></a>
                        <a href="<?php echo url('app=seller_order'); ?>" class="btn pos3" title="�����ҵĶ���"><span class="pic1">�����ҵĶ���</span></a>
                    </div>
                </div>

            </div>
            <div class="wrap_bottom"></div>
        </div>
<?php endif; ?>
<?php if ($this->_var['applying']): ?>
        <div class="wrap_line">
            <div class="public_index">
                <div class="information_index">
                    <h3 class="title">��������</h3>
                    <div class="remind">
                        <dl>
                            <dt>���״̬</dt>
                            <dd><?php echo sprintf('���ĵ�����������С������<a href="index.php?app=apply&step=2&id=%s">�鿴���޸ĵ�����Ϣ</a>', $this->_var['user']['sgrade']); ?></dd>
                        </dl>
                        <a href="index.php?app=apply&step=2&id=<?php echo $this->_var['user']['sgrade']; ?>" title="�༭������Ϣ" class="btn1 pos2"><span class="pic2">�༭������Ϣ</span></a>
                    </div>
                </div>

            </div>
            <div class="wrap_bottom"></div>
        </div>
<?php endif; ?>
        <div class="clear"></div>
        <div class="adorn_right1"></div>
        <div class="adorn_right2"></div>
        <div class="adorn_right3"></div>
        <div class="adorn_right4"></div>
    </div>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>
