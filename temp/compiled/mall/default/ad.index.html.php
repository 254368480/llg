<?php echo $this->fetch('header.html'); ?>
<?php echo $this->fetch('curlocal.html'); ?>
<div class="content">
    <div class="commodity_assort">
        <div class="module_sidebar">
            <h2>赚积分</h2>
            <div class="wrap">
                <div class="wrap_child">
                    <div class="recommend">
					
                        <ul class="ad_list_ul">
                            <?php $_from = $this->_var['ads']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'value');if (count($_from)):
    foreach ($_from AS $this->_var['value']):
?>
                         			<li class="ad_list_li">
										<a href="/index.php?app=ad&act=to_link&ad_id=<?php echo $this->_var['value']['ad_id']; ?>" target="_blank">
										<div class="ad_img"><img src="/<?php echo $this->_var['value']['ad_img']; ?>" width="150" height="150"  /></div>
										<div class="ad_info">
											<div class="ad_name"><?php echo sub_str($this->_var['value']['ad_name'],40); ?></div>
											<div class="ad_int">获得积分：<strong style="color:#FF0000"><?php echo $this->_var['value']['ad_int']; ?>分</strong></div>
											<div class="ad_vip">点击权限：<?php echo $this->_var['vip'][$this->_var['value']['ad_vip']]; ?></div>
										</div>
										</a>
									</li>
                            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                      	</ul>
						
                    </div>
                </div>
            </div>
			
			<div class="pageLinks" style="float:right;margin-top:20px;mairgin">
				<?php if ($this->_var['ads']): ?><?php echo $this->fetch('page.bottom.html'); ?><?php endif; ?>
			</div>
        </div>
    </div>

    <div class="ad_sidebar_list" area="right" widget_type="area">
        <?php $this->display_widgets(array('page'=>'gcategory','area'=>'right')); ?>
    </div>
</div>
<?php echo $this->fetch('footer.html'); ?>