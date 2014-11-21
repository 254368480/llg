<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
	    <h1>会员中心首页</h1>
        <div class="wrap_line margin1">
		     <div class="user_info"> 
			 		<h1>服务中心</h1>
			 		<table class="user_table" border="1" bordercolor="#FFF" >
						<tr><th>代理商</th><td><?php echo $this->_var['dls']['user_name']; ?></td><th>代理商电话</th><td><?php echo $this->_var['dls']['im_msn']; ?></td></tr>
						<tr><th>分销商</th><td><?php echo $this->_var['fxs']['user_name']; ?></td><th>分销商电话</th><td><?php echo $this->_var['fxs']['im_msn']; ?></td></tr>
						<tr><th>开户单位</th><td><?php echo $this->_var['user_info']['deposit']; ?></td><th>开户单位电话</th><td><?php echo $this->_var['deposit_user']['im_msn']; ?></td></tr>
				   </table>
				   <h1>个人信息</h1>
				   <table class="user_table" border="1" bordercolor="#FFF" >
				   <tr><?php if ($this->_var['time'] <= 30): ?><div style="color:#FF0000;margin-left:20px;margin-top:10px;">亲爱的会员！还有<?php echo $this->_var['time']; ?>天，您的平台使用费就要到期了，请及时缴费!</div><?php endif; ?></tr>
				   
				   <tr>
						<th>积分余额</th>
						<td> <?php echo $this->_var['user_info']['integral']; ?>分</td>
						<th>您目前是</th>
						<td> <?php echo $this->_var['user_info']['grade']; ?></td>
					</tr>
					
					<tr>
						<th>您的预存款</th>
						<td> ￥<?php echo $this->_var['user_info']['money']; ?></td>
						<th>订单总数量</th>
						<td><?php echo $this->_var['order_num']; ?> [<a href="index.php?app=buyer_order">查看订单列表]</a></td>
					</tr>
					
					<tr>
						<th>最后登录时间</th>
						<td> <?php echo local_date("Y-m-d",$this->_var['user']['last_login']); ?></td>
						<th>注册时间</th>
						<td> <?php echo local_date("Y-m-d",$this->_var['user']['reg_time']); ?></td>
					</tr>
					<tr>
						<th>开户单位</th>
						<td><?php echo $this->_var['user_info']['deposit']; ?></td>
						<th>今日赚分记录</th>
						<td><?php echo $this->_var['user_info']['td_int']; ?>分</td>
					</tr>
					<tr>
						<th>推广链接 </th>
						<td colspan="3">http://www.linglegou.com/index.php?app=member&act=register&tid=<?php echo $this->_var['user']['user_id']; ?></td>
					</tr>
				   </table>
			   
			 </div>
			 
            <div class="wrap_bottom"></div>
        </div>
        <div class="wrap_line margin1">
            <div class="public_index">
                <div class="information_index">
                    <h3 class="title">买家提醒</h3>
                    <?php if ($this->_var['buyer_stat'] && $this->_var['buyer_stat']['sum']): ?>
                    <div class="remind">
                        <dl>
                            <dt>订单提醒</dt>
                            <dd><?php echo sprintf('您有 <span class="red">%s</span> 个待付款的订单，请尽快到“<a href="index.php?app=buyer_order&type=pending">待付款订单</a>”中付款', $this->_var['buyer_stat']['pending']); ?></dd>
                            <dd><?php echo sprintf('您有 <span class="red">%s</span> 个订单卖家已发货，等待您的确认，请尽快到“<a href="index.php?app=buyer_order&type=shipped">已发货订单</a>”中确认', $this->_var['buyer_stat']['shipped']); ?></dd>
                            <dd><?php echo sprintf('您有 <span class="red">%s</span> 个订单还没有评价，请尽快到“<a href="index.php?app=buyer_order&type=finished">已完成订单</a>”中确认', $this->_var['buyer_stat']['finished']); ?></dd>
                        </dl>
                       
                        <a href="<?php echo url('app=buyer_order'); ?>" class="btn pos1" title="查看我的订单"><span class="pic1">查看我的订单</span></a>
                    </div>
                    <?php else: ?>
                    <div class="awoke">
                        您目前还没有已生成的订单<br />去<a href="index.php">商城首页</a>，挑选喜爱的商品，体验购物乐趣吧。
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
                    <h3 class="title">卖家提醒
                        <p>
                        <span>店铺等级: <?php echo $this->_var['sgrade']['grade_name']; ?></span>
                        <span>有效期: <?php if ($this->_var['sgrade']['add_time']): ?><?php echo sprintf('剩余 %s 天', $this->_var['sgrade']['add_time']); ?><?php else: ?>不限制<?php endif; ?></span>
                        <span>商品发布: <?php echo $this->_var['sgrade']['goods']['used']; ?>/<?php if ($this->_var['sgrade']['goods']['total']): ?><?php echo $this->_var['sgrade']['goods']['total']; ?><?php else: ?>不限制<?php endif; ?></span>
                        <span>空间使用: <?php echo $this->_var['sgrade']['space']['used']; ?>M/<?php if ($this->_var['sgrade']['space']['total']): ?><?php echo $this->_var['sgrade']['space']['total']; ?>M<?php else: ?>不限制<?php endif; ?></span>
                        </p>
                    </h3>
                    <div class="remind">
                        <dl>
                            <dt>订单提醒</dt>
                            <dd><?php echo sprintf('您有 <span class="red">%s</span> 个待处理的订单，请尽快到“<a href="index.php?app=seller_order&type=submitted">已提交订单</a>”中处理', $this->_var['seller_stat']['submitted']); ?></dd>
                            <dd><?php echo sprintf('您有 <span class="red">%s</span> 个待发货的订单，请尽快到“<a href="index.php?app=seller_order&type=accepted">待发货订单</a>”中处理', $this->_var['seller_stat']['accepted']); ?></dd>
                        </dl>
                        <dl>
                            <dt>团购提醒</dt>
                            <dd><?php echo sprintf('您有 <span class="red">%s</span> 个发起的团购活动已结束，请尽快到“<a href="index.php?app=seller_groupbuy&state=end">已结束的团购</a>”中确认完成', $this->_var['seller_stat']['groupbuy_end']); ?></dd>
                        </dl>
                        <a href="<?php echo url('app=store&id=' . $this->_var['store']['store_id']. ''); ?>" title="查看我的店铺" target="_blank" class="btn1 pos2"><span class="pic2">查看我的店铺</span></a>
                        <a href="<?php echo url('app=seller_order'); ?>" class="btn pos3" title="管理我的订单"><span class="pic1">管理我的订单</span></a>
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
                    <h3 class="title">开店提醒</h3>
                    <div class="remind">
                        <dl>
                            <dt>审核状态</dt>
                            <dd><?php echo sprintf('您的店铺正在审核中。你可以<a href="index.php?app=apply&step=2&id=%s">查看或修改店铺信息</a>', $this->_var['user']['sgrade']); ?></dd>
                        </dl>
                        <a href="index.php?app=apply&step=2&id=<?php echo $this->_var['user']['sgrade']; ?>" title="编辑店铺信息" class="btn1 pos2"><span class="pic2">编辑店铺信息</span></a>
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
