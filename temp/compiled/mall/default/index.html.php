<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<?php echo $this->_var['site_url']; ?>/" />

<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7 charset=<?php echo $this->_var['charset']; ?>" />
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo $this->_var['charset']; ?>" />
<?php echo $this->_var['page_seo']; ?>

<link href="<?php echo $this->res_base . "/" . 'css/index.css'; ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo $this->res_base . "/" . 'css/lrtk.css'; ?>" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="index.php?act=jslang"></script>
<script type="text/javascript" src="<?php echo $this->lib_base . "/" . 'jquery.js'; ?>" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo $this->lib_base . "/" . 'ecmall.js'; ?>" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo $this->res_base . "/" . 'js/nav.js'; ?>" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo $this->res_base . "/" . 'js/select.js'; ?>" charset="utf-8"></script>

<script src="<?php echo $this->res_base . "/" . 'js/jquery1.42.min.js'; ?>" type="text/javascript"></script>
<script src="<?php echo $this->res_base . "/" . 'js/jquery.superslide.2.1.1.js'; ?>" type="text/javascript"></script>

<script type="text/javascript" src="<?php echo $this->res_base . "/" . 'js/index.js'; ?>" charset="utf-8"></script>
<script type="text/javascript">
//<!CDATA[
var SITE_URL = "<?php echo $this->_var['site_url']; ?>";
var REAL_SITE_URL = "<?php echo $this->_var['real_site_url']; ?>";
var PRICE_FORMAT = '<?php echo $this->_var['price_format']; ?>';

$(function(){
    var select_list = document.getElementById("select_list");
    var float_list = document.getElementById("float_list");
    select_list.onmouseover = function () {
        float_list.style.display = "block";
    };
    select_list.onmouseout = function () {
        float_list.style.display = "none";
    };
});
//]]>
</script>

<?php echo $this->_var['_head_tags']; ?>
<!--<editmode></editmode>-->
</head>

<body>
		<div class="fixed">
           <div class="index_head">
		   		<div class="center">
					<a class="collection">收藏</a>
					<div class="float_r">
							<div class="menu">
								<p class="link1">
									<?php if (! $this->_var['visitor']['user_id']): ?>
									<a href="<?php echo url('app=member&act=login&ret_url=' . $this->_var['ret_url']. ''); ?>">会员登录</a><span class="sx">|</span>
									<a href="<?php echo url('app=member&act=register&ret_url=' . $this->_var['ret_url']. ''); ?>">免费注册</a><span class="sx">|</span>
									<?php else: ?>
									<a>您好,<?php echo htmlspecialchars($this->_var['visitor']['user_name']); ?></a><span class="sx">|</span>
									<a href="<?php echo url('app=member&act=logout'); ?>">退出</a> <span class="sx">|</span>
									<?php endif; ?>
									<a class="z_index" href="<?php echo url('app=member'); ?>">用户中心</a><span class="sx">|</span>
									<a href="<?php echo url('app=message&act=newpm'); ?>">站内消息<?php if ($this->_var['new_message']): ?>(<?php echo $this->_var['new_message']; ?>)<?php endif; ?></a><span class="sx">|</span>
									<a href="<?php echo url('app=article&code=' . $this->_var['acc_help']. ''); ?>">帮助中心</a>
									<?php $_from = $this->_var['navs']['header']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'nav');if (count($_from)):
    foreach ($_from AS $this->_var['nav']):
?>
									<span class="sx">|</span><a href="<?php echo $this->_var['nav']['link']; ?>"<?php if ($this->_var['nav']['open_new']): ?> target="_blank"<?php endif; ?>>
									<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
								</p>
							</div>
					</div>
				</div>
		   </div>
				   <div class="index_headmbg">
							   <div class="index_headm center">
												<div class="head_logo"><img src="<?php echo $this->res_base . "/" . 'images/logo.jpg'; ?>"></div>
												<div class="search">
													<div class="search1"></div>
													<div class="search2"></div>
													<div class="wrap">
														<form method="GET" action="<?php echo url('app=search'); ?>">
															<div class="border">
																<div class="select_js">
																	<p>宝贝</p>
																	<ul style="display:none;" class="sl_son">
																		<li ectype="index">宝贝</li>
																		<li ectype="store">店铺</li>
																	</ul>
																	<input type="hidden" name="act" value="index" />
																</div>
																<input type="text" name="keyword" class="text2" />
															</div>
															<input type="hidden" name="app" value="search" />
															<input type="submit" name="Submit" value="" class="btn" />
														</form>
													</div>
													
												</div>
												
												<div style="float:right;padding-top:8px;"><img src="<?php echo $this->res_base . "/" . 'img/code.jpg'; ?>" width="80" height="80" alt="二维码"></div>
												<div class="clear"></div>
							   </div>
							   
							   
				   </div>
		   </div>
		   
		   
		   <div class="index_content center" style="padding-top:125px;">
		   		<div class="catetree">
							<h2><a href="index.php?app=category">零乐购全部产品分类</a></h2>
							<dl class="shop_assort">
								<?php $_from = $this->_var['gcategorys']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'gcategory');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['gcategory']):
?>
								<div class="tian_<?php echo $this->_var['key']; ?> tian">
									<dt><a href="<?php echo url('app=search&cate_id=' . $this->_var['gcategory']['id']. ''); ?>"><?php echo htmlspecialchars($this->_var['gcategory']['value']); ?></a></dt>
									<dd>
									
										<?php $_from = $this->_var['gcategory']['children']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'child');if (count($_from)):
    foreach ($_from AS $this->_var['child']):
?>
										<a class href="<?php echo url('app=search&cate_id=' . $this->_var['child']['id']. ''); ?>"><?php echo htmlspecialchars($this->_var['child']['value']); ?></a>
										<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
									</dd>
								</div>
								<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
							</dl>
				</div>
				
				 <div class="content_right">
					<div class="nav">
						<ul id="nav">
							<div class="nav1"></div>
							<div class="nav2"></div>
							<li class="<?php if ($this->_var['index']): ?>link<?php else: ?>hover<?php endif; ?>"><a  href="index.php"><span>首页</span></a></li>
							<?php $_from = $this->_var['navs']['middle']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'nav');if (count($_from)):
    foreach ($_from AS $this->_var['nav']):
?>
							<li><a class="<?php if (! $this->_var['index'] && $this->_var['nav']['link'] == $this->_var['current_url']): ?>link<?php else: ?>hover<?php endif; ?>" href="<?php echo $this->_var['nav']['link']; ?>"<?php if ($this->_var['nav']['open_new']): ?> target="_blank"<?php endif; ?>><span><?php echo htmlspecialchars($this->_var['nav']['title']); ?></span></a></li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						</ul>
							<div class="clear"></div>
					</div>  
					
					<div class="content_a">
						<div class="flash">
					
							
							<div class="www51buycom">
								<ul class="51buypic">
									<li><a href="http://www.linglegou.com/index.php?app=store&id=275&act=search&cate_id=1219" target="_blank"><img src="<?php echo $this->res_base . "/" . 'img/01.jpg'; ?>" width="748" height="420" /></a></li>
									<li><a href="http://www.linglegou.com/index.php?act=index&keyword=%B4%BF%BB%FD%B7%D6&app=search&Submit=" target="_blank"><img src="<?php echo $this->res_base . "/" . 'img/02.jpg'; ?>" width="748" height="420" /></a></li>
                                                                        <li><a href="http://www.linglegou.com/index.php?app=goods&id=215" target="_blank"><img src="<?php echo $this->res_base . "/" . 'img/03.jpg'; ?>" width="748" height="420" /></a></li>
                                                                        <li><a href="http://www.linglegou.com/index.php?app=goods&id=45" target="_blank"><img src="<?php echo $this->res_base . "/" . 'img/04.jpg'; ?>" width="748" height="420" /></a></li>
                                                                        <li><a href="http://www.linglegou.com/index.php?app=store&id=275&act=search&cate_id=1219" target="_blank"><img src="<?php echo $this->res_base . "/" . 'img/05.jpg'; ?>" width="748" height="420" /></a></li>
									
								</ul>
								<a class="prev" href="javascript:void(0)"></a>
								<a class="next" href="javascript:void(0)"></a>
								<div class="num">
									<ul></ul>
								</div>
							</div>
							<script>
							/*鼠标移过，左右按钮显示*/
							$(".www51buycom").hover(function(){
								$(this).find(".prev,.next").fadeTo("show",0.1);
							},function(){
								$(this).find(".prev,.next").hide();
							})
							/*鼠标移过某个按钮 高亮显示*/
							$(".prev,.next").hover(function(){
								$(this).fadeTo("show",0.7);
							},function(){
								$(this).fadeTo("show",0.1);
							})
							$(".www51buycom").slide({titCell:".num ul" , mainCell:".51buypic" , effect:"fold", autoPlay:true, delayTime:700 , autoPage:true});
							</script>
							
						</div>
						
						<div class="ads">
							<ul>
							
							 <li><a target="_blank" href="index.php?app=goods&id=38"><img width="248" height="186" src="<?php echo $this->res_base . "/" . 'img/six_01.jpg'; ?>"></a></li>
							 <li><a target="_blank" href="index.php?app=goods&id=44"><img width="248" height="186" src="<?php echo $this->res_base . "/" . 'img/six_02.jpg'; ?>"></a></li>
							 <li><a target="_blank" href="http://www.linglegou.com/index.php?app=goods&id=45"><img width="248" height="186" src="<?php echo $this->res_base . "/" . 'img/six_03.jpg'; ?>"></a></li>
							 <li><a target="_blank" href="http://www.linglegou.com/index.php?app=goods&id=34"><img width="248" height="186" src="<?php echo $this->res_base . "/" . 'img/six_04.jpg'; ?>"></a></li>
							 <li><a target="_blank" href="index.php?app=goods&id=36"><img width="248" height="186" src="<?php echo $this->res_base . "/" . 'img/six_05.jpg'; ?>"></a></li>
							 <li><a target="_blank" href="index.php?app=goods&id=47"><img width="248" height="186" src="<?php echo $this->res_base . "/" . 'img/six_06.jpg'; ?>"></a></li>
							 	<div class="clear"></div>
							</ul>
							
						</div>
						
					</div>
					
					<div class="content_b">
							<div class="tb">
								<div class="tb_01">满59<br>全国免邮</div>
								<div class="tb_02">7天内<br>无理由退换</div>
								<div class="clear"></div>
							</div>
							
							<div class="right_ad">
								<a href="http://www.linglegou.com/index.php?app=goods&id=93"><img width="236" height="339" src="<?php echo $this->res_base . "/" . 'img/right_01.jpg'; ?>"></a> 
							</div>
							
							<div class="gg">
								<h2>公告</h2>
									<ul>
								    <?php $_from = $this->_var['art']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'article');if (count($_from)):
    foreach ($_from AS $this->_var['article']):
?>
									<li> <a href="<?php echo url('app=article&act=view&article_id=' . $this->_var['article']['article_id']. ''); ?>" title="<?php echo htmlspecialchars($this->_var['article']['title']); ?>">
									<?php echo htmlspecialchars($this->_var['article']['title']); ?></a><br><div class="gg_time">2014-<?php echo local_date("m-d",$this->_var['article']['add_time']); ?></div></li>
									<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
									</ul>
									<div class="gg_more"><a href="index.php?app=article&cate_id=2">更多公告>></a></div>
									<div class="clear"></div>
							</div>
					</div>
				</div> 
				
				<div class="clear"></div>
				<div class="index_content_two">
					<div class="index_content_twoL">
						<div class="box">
							<div class="tab_title">
								<ul id="tab">
									<li class="act"><a href="http://www.linglegou.com/index.php?app=category">本周热销</a></li>
									<li><a href="http://www.linglegou.com/index.php?app=category">精品推荐</a></li>
									<li><a href="http://www.linglegou.com/index.php?app=category">新品上市</a></li>
									<div class="clear"></div>
								</ul>
							</div>
							<div class="box_body" style="display:block;">
								<ul>
									<?php $_from = $this->_var['recom1']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'goods');$this->_foreach['loop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['loop']['total'] > 0):
    foreach ($_from AS $this->_var['goods']):
        $this->_foreach['loop']['iteration']++;
?>
										
										<li>
											<a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>" target="_blank"><img src="<?php echo $this->_var['goods']['default_image']; ?>" width="210"></a>
											<a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>" target="_blank">
											<div class="info" style="text-align:center;">
												<?php echo sub_str($this->_var['goods']['goods_name'],30); ?><br>
												<font color="#FF0000">
												￥<?php echo $this->_var['goods']['price']; ?>
												 + <?php echo $this->_var['goods']['integral']; ?>分
												</font>
											</div>
											</a>
										</li>
										
									<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
								</ul>
								<div class="clear"></div>
							</div>
							
							<div class="box_body">
								<ul>
									<?php $_from = $this->_var['recom2']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'goods');$this->_foreach['loop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['loop']['total'] > 0):
    foreach ($_from AS $this->_var['goods']):
        $this->_foreach['loop']['iteration']++;
?>
										
										<li>
											<a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>" target="_blank"><img src="<?php echo $this->_var['goods']['default_image']; ?>" width="210"></a>
											<a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>" target="_blank">
											<div class="info" style="text-align:center;">
												<?php echo sub_str($this->_var['goods']['goods_name'],30); ?><br>
												<font color="#FF0000">
												￥<?php echo $this->_var['goods']['price']; ?>
												 + <?php echo $this->_var['goods']['integral']; ?>分
												</font>
											</div>
											</a>
										</li>
										
									<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
								</ul>
								<div class="clear"></div>
							</div>
							
							<div class="box_body">
								<ul>
									<?php $_from = $this->_var['recom3']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'goods');$this->_foreach['loop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['loop']['total'] > 0):
    foreach ($_from AS $this->_var['goods']):
        $this->_foreach['loop']['iteration']++;
?>
										
										<li>
											<a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>" target="_blank"><img src="<?php echo $this->_var['goods']['default_image']; ?>" width="210"></a>
											<a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>" target="_blank">
											<div class="info" style="text-align:center;">
												<?php echo sub_str($this->_var['goods']['goods_name'],30); ?><br>
												<font color="#FF0000">
												￥<?php echo $this->_var['goods']['price']; ?>
												 + <?php echo $this->_var['goods']['integral']; ?>分
												</font>
											</div>
											</a>
										</li>
										
									<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
								</ul>
								<div class="clear"></div>
							</div>
						</div>
						
						<a href="http://www.linglegou.com/index.php?app=goods&id=77"><img src="<?php echo $this->res_base . "/" . 'img/gg1.jpg'; ?>" style="margin-top:10px;" width="970" height="88" /></a>   
					</div>
					<div class="index_content_twoR">
						<a href="http://www.linglegou.com/index.php?app=goods&id=47"><img src="<?php echo $this->res_base . "/" . 'img/tu5.jpg'; ?>" height="420" width="235"/></a>   
					</div>
					
					<div style="clear:both;"></div>
				</div>
				
				
				<div class="index_content_three">
					<div class="index_content_three_title">
						
						<span style="float:left;">猜您喜欢</span>  <div class="titlebg"></div><div class="more">
						<a href="http://www.linglegou.com/index.php?app=category" target="_blank">更多>></a></div>
						
					</div>
					<div class="index_content_three_body">
						<ul>
							<?php $_from = $this->_var['recom4']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'goods');$this->_foreach['loop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['loop']['total'] > 0):
    foreach ($_from AS $this->_var['goods']):
        $this->_foreach['loop']['iteration']++;
?>
							
									<a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>" target="_blank"><li>
										<img src="<?php echo $this->_var['goods']['default_image']; ?>" width="150" height="150" >
										<div class="cp_info">
											<?php echo sub_str($this->_var['goods']['goods_name'],20); ?><br>
											<div class="price">￥<?php echo $this->_var['goods']['price']; ?></div>
											<div style="color:#FF0000;font-weight: bold;"> + <?php echo $this->_var['goods']['integral']; ?>分</div>
										</div>
									</li>
									</a>
							
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
							<div class="clear"></div>
						</ul>
						
					</div>
				</div>
				
				<div class="clear"></div>
				<div class="index_four">
					<div class="index_four_title">
						<span style="float:left;"><a href="index.php?app=ad" target="_blank">点广告获积分</a></span>  
						<div style="width:940px;" class="titlebg"></div><div class="more"><a href="index.php?app=ad" target="_blank">更多>></a></div>
					</div>
					<div class="index_four_body">
						<ul>
							<li><img src="<?php echo $this->res_base . "/" . 'img/ann1.jpg'; ?>"></li>
							<li><img src="<?php echo $this->res_base . "/" . 'img/ann2.jpg'; ?>"></li>
							<li><img src="<?php echo $this->res_base . "/" . 'img/ann3.jpg'; ?>"></li>
							<li style="margin-right:0px;"><img src="<?php echo $this->res_base . "/" . 'img/ann4.jpg'; ?>"></li>
						</ul>
						<div class="clear"></div>
					</div>
					
				</div>
				
				<div class="index_four">
					<div class="index_four_title">
						
						<span style="float:left;">最佳商铺</span>  <div style="width:970px" class="titlebg"></div><div class="more">
						<a href="http://www.linglegou.com/index.php?act=store&keyword=&app=search&Submit=" target="_blank">更多>></a></div>
					</div>
					<div class="index_four_body">
						<ul class="store_ul">
							<?php $_from = $this->_var['recommended_stores']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'store');if (count($_from)):
    foreach ($_from AS $this->_var['store']):
?>
									<li>
										<div class="pic"><a href="<?php echo url('app=store&id=' . $this->_var['store']['store_id']. ''); ?>" target="_blank">
											<img style="float:left" src="<?php echo $this->_var['store']['store_logo']; ?>" width="100" height="100" /></a></div>
										<dl>
											<dt><a href="<?php echo url('app=store&id=' . $this->_var['store']['store_id']. ''); ?>" target="_blank">店铺名称：<?php echo htmlspecialchars($this->_var['store']['store_name']); ?></a><br>
											开店时间：<?php echo local_date("Y-m-d",$this->_var['store']['add_time']); ?><br>
											店铺信用：<?php echo $this->_var['store']['praise_rate']; ?>%
											</dt>
										</dl>
									</li>
							
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
							
						</ul>
						
						<a href=""><img src="<?php echo $this->res_base . "/" . 'img/tu6.jpg'; ?>" style="float:left;" width="190"></a>  
					</div>
					
				</div>
				
				<div class="clear"></div>
				<div class="index_content_three">
					<div class="index_content_three_title">
					  
						<span style="float:left;">全国统一零售价产品</span>  <div class="titlebg" style="width:830px;"></div><div class="more">
						<a href="http://www.linglegou.com/index.php?app=store&id=275&act=search&cate_id=1219" target="_blank">更多>></a></div>  
					</div>
					<div class="index_content_three_body">
						<ul>
							<?php $_from = $this->_var['recom5']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'goods');$this->_foreach['loop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['loop']['total'] > 0):
    foreach ($_from AS $this->_var['goods']):
        $this->_foreach['loop']['iteration']++;
?>
							
									<a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>" target="_blank"><li>
										<img src="<?php echo $this->_var['goods']['default_image']; ?>" width="150" height="150" >
										<div class="cp_info">
											<?php echo sub_str($this->_var['goods']['goods_name'],20); ?><br>
											<div class="price">￥<?php echo $this->_var['goods']['price']; ?></div>
											<div style="color:#FF0000;font-weight: bold;"> + <?php echo $this->_var['goods']['integral']; ?>分</div>
										</div>
									</li>
									</a>
							
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						</ul>
						<div class="clear"></div>
					</div>
				</div>
		   </div>  
		   
		   <div class="index_footer center">
		   		<div class="footer_left">
					<div style="float:left;margin-right:60px;">
						<div class="footer_left_title">
							营业时间
						</div>
						<div class="footer_left_body">
							周一至周日8：00 ~ 24：00
						</div>
						 <script type="text/javascript">
							window.onload=function(){  
								var h=document.getElementById("time1");
								var m=document.getElementById("time2");
								var s=document.getElementById("time3");
								var y=document.getElementById("time4");
								var date = new Date();
								y.innerHTML=date.toLocaleDateString();     //获取当前日期
								window.setInterval(
									function(){
									var a=new Date();
										if(a.getHours()<10){
											h.innerHTML="0"+a.getHours();
										}
										else{
											h.innerHTML=a.getHours();
										}
										
										if(a.getMinutes()<10){
											m.innerHTML="0"+a.getMinutes();
										}
										else{
											m.innerHTML=a.getMinutes();
										}
										if(a.getSeconds()<10){
											s.innerHTML="0"+a.getSeconds();
										}
										else{
											s.innerHTML=a.getSeconds();
										}
									},1000
								);
							}
						</script>
						<div class="footer_left_body1" >
							<div id="time4" style="margin-left:80px;"></div>
							<span style="float:left;margin-right:30px;">北京时间</span> <span class="bbg" id="time1"></span><span style="float:left">:</span><span class="bbg" id="time2"></span><span style="float:left">:</span><span class="bbg" id="time3"></span>
						</div>
					</div>
					
					<div class="footer_left_center">
						<div class="footer_left_center_title">
							客服中心
						</div>
						<div class="tel">
							027-86830588
						</div>
						<div class="email">
							ge@linglegou.com(客服)
						</div>
						<div class="email1">
							ge@linglegou.com(投诉)
						</div>
					</div>
					
				</div>
				<div class="index_footer_right">
					<div class="ifr_title">
						合作伙伴
					</div>
					<div class="ifr_more"><img src="<?php echo $this->res_base . "/" . 'img/more.jpg'; ?>"></div>
					<div class="clear"></div>
					
					<ul>
						<?php $_from = $this->_var['partner']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'part');if (count($_from)):
    foreach ($_from AS $this->_var['part']):
?>
						<li>
							<a href="<?php echo $this->_var['part']['link']; ?>" target="_blank">
							<img src="<?php echo $this->_var['part']['logo']; ?>" alt="<?php echo htmlspecialchars($this->_var['part']['title']); ?>" width="134" height="32" /><br><?php echo htmlspecialchars($this->_var['part']['title']); ?>
							</a>
						</li>
						<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
					</ul>
				</div>
				
				
				
		   </div>
		   
		   <div class="clear"></div>
		   <div class="index_textFooterbg">
		   		<div class="index_textFooter">
		   			<div class="fljc"><h3>购物指南</h3>
						<ul>
							<?php $_from = $this->_var['art_all']['35']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'article');if (count($_from)):
    foreach ($_from AS $this->_var['article']):
?>
								<li><a href="<?php echo url('app=article&act=view&article_id=' . $this->_var['article']['article_id']. ''); ?>" title="<?php echo htmlspecialchars($this->_var['article']['title']); ?>">
									<?php echo htmlspecialchars($this->_var['article']['title']); ?></a></li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						</ul>
					</div>
					<div class="ddjc"><h3>配送方式</h3>
						<ul>
							<?php $_from = $this->_var['art_all']['36']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'article');if (count($_from)):
    foreach ($_from AS $this->_var['article']):
?>
								<li><a href="<?php echo url('app=article&act=view&article_id=' . $this->_var['article']['article_id']. ''); ?>" title="<?php echo htmlspecialchars($this->_var['article']['title']); ?>">
									<?php echo htmlspecialchars($this->_var['article']['title']); ?></a></li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						</ul>
					</div>
					<div class="dxjc"><h3>售后服务</h3>
						<ul>
							<?php $_from = $this->_var['art_all']['37']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'article');if (count($_from)):
    foreach ($_from AS $this->_var['article']):
?>
								<li><a href="<?php echo url('app=article&act=view&article_id=' . $this->_var['article']['article_id']. ''); ?>" title="<?php echo htmlspecialchars($this->_var['article']['title']); ?>">
									<?php echo htmlspecialchars($this->_var['article']['title']); ?></a></li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						</ul>
					</div>
					<div class="lpdh"><h3>关于我们</h3>
						<ul>
							<?php $_from = $this->_var['art_all']['38']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'article');if (count($_from)):
    foreach ($_from AS $this->_var['article']):
?>
								<li><a href="<?php echo url('app=article&act=view&article_id=' . $this->_var['article']['article_id']. ''); ?>" title="<?php echo htmlspecialchars($this->_var['article']['title']); ?>">
									<?php echo htmlspecialchars($this->_var['article']['title']); ?></a></li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						</ul>
					</div>
					<div class="lbxg"><h3>关于易货</h3>
						<ul>
							<?php $_from = $this->_var['art_all']['39']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'article');if (count($_from)):
    foreach ($_from AS $this->_var['article']):
?>
								<li><a href="<?php echo url('app=article&act=view&article_id=' . $this->_var['article']['article_id']. ''); ?>" title="<?php echo htmlspecialchars($this->_var['article']['title']); ?>">
									<?php echo htmlspecialchars($this->_var['article']['title']); ?></a></li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						</ul>
					</div>
		   		</div>
				
				
		   </div>
		   
		   <div class="copyrightbg">
		   	  <div class="copyright">
			 	 荣鑫华亚旗下荣誉出品，最终解释权归荣鑫华亚所有<br>
				 Copyright 2014-2017 linglegou.com All rights reserved.<br>
				《中华人民共和国电信与信息服务业务经营许可证》编号：<a href="http://www.miit.gov.cn" target="_blank" rel="nofollow">鄂ICP备13013377号-2</a><br>
				<br>
				<img src="<?php echo $this->res_base . "/" . 'img/di.png'; ?>">
		 	  </div>
		   </div>
		   
		    <script type="text/javascript" src="http://c.ibangkf.com/i/c-llg888.js"></script>
<?php echo $this->_var['async_sendmail']; ?>
</body>
</html>
