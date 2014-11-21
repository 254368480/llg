<?php echo $this->fetch('header.html'); ?>
<script type="text/javascript">
//注册表单验证
$(function(){
    $('#register_form').validate({
        errorPlacement: function(error, element){
            var error_td = element.parent('td').next('td');
            error_td.find('.field_notice').hide();
            error_td.append(error);
        },
        success       : function(label){
            label.addClass('validate_right').text('OK!');
        },
        onkeyup: false,
        rules : {
            user_name : {
                required : true,
                byteRange: [3,15,'<?php echo $this->_var['charset']; ?>'],
                remote   : {
                    url :'index.php?app=member&act=check_user&ajax=1',
                    type:'get',
                    data:{
                        user_name : function(){
                            return $('#user_name').val();
                        }
                    },
                    beforeSend:function(){
                        var _checking = $('#checking_user');
                        _checking.prev('.field_notice').hide();
                        _checking.next('label').hide();
                        $(_checking).show();
                    },
                    complete :function(){
                        $('#checking_user').hide();
                    }
                }
            },
			deposit : {
                required : true,
                byteRange: [3,15,'<?php echo $this->_var['charset']; ?>'],
                remote   : {
                    url :'index.php?app=member&act=check_deposit&ajax=1',
                    type:'get',
                    data:{
                        deposit : function(){
                            return $('#deposit').val();
                        }
                    },
                    beforeSend:function(){
                        var _checking = $('#checking_user1');
                        _checking.prev('.field_notice').hide();
                        _checking.next('label').hide();
                        $(_checking).show();
                    },
                    complete :function(){
                        $('#checking_user1').hide();
                    }
                }
            },
            password : {
                required : true,
                minlength: 6
            },
            password_confirm : {
                required : true,
                equalTo  : '#password'
            },
            email : {
                required : true,
                email    : true
            },
			im_msn : {
                required : true,
            },
			sfz : {
                required : true,
				minlength: 18
            },
            captcha : {
                required : true,
                remote   : {
                    url : 'index.php?app=captcha&act=check_captcha',
                    type: 'get',
                    data:{
                        captcha : function(){
                            return $('#captcha1').val();
                        }
                    }
                }
            },
            agree : {
                required : true
            }
        },
        messages : {
            user_name : {
                required : '您必须提供一个用户名',
                byteRange: '用户名必须在3-15个字符之间',
                remote   : '您提供的用户名已存在'
            },
			deposit : {
                required : '请提供正确的开户单位',
				byteRange: '请提供正确长度的开户单位',
                remote   : '该开户单位不存在'
            },
            password  : {
                required : '您必须提供一个密码',
                minlength: '密码长度应在6-20个字符之间'
            },
            password_confirm : {
                required : '您必须再次确认您的密码',
                equalTo  : '两次输入的密码不一致'
            },
            email : {
                required : '您必须提供您的电子邮箱',
                email    : '这不是一个有效的电子邮箱'
            },
			im_msn : {
                required : '您必须提供您的联系电话',
            },
			
			sfz : {
                required : '您必须提供您的身份证',
				minlength: '请输入18位身份证号码'
            },
            captcha : {
                required : '请输入右侧图片中的文字',
                remote   : '验证码错误'
            },
            agree : {
                required : '您必须阅读并同意该协议,否则无法注册'
            }
        }
    });
});
</script>
<div class="content">
    <div class="module_common">
        <h2><b class="register" title="JOIN US用户注册"></b></h2>
        <div class="wrap">
            <div class="wrap_child">
                <div class="login_con">
                    <div class="login_fill_in">
                        <form name="" id="register_form" method="post" action="">
                        <table>
                            <tr>
                                <td colspan="3"><h4>填写注册信息</h4></td>
                            </tr>
                            <tr>
                                <td>用户名:</td>
                                <td><input type="text" id="user_name" name="user_name" class="text width10" /></td>
                                <td class="padding3 fontColor4"><label class="field_notice">用于登录的名字</label><label id="checking_user" class="checking">检查中...</label></td>
                            </tr>
                            <tr>
                                <td>密&nbsp;&nbsp;&nbsp;码:</td>
                                <td><input type="password" id="password" name="password" class="text width10" /></td>
                                <td class="padding3 fontColor4"><label class="field_notice">您的密码</label></td>
                            </tr>
                            <tr>
                                <td>确认密码:</td>
                                <td><input type="password" name="password_confirm" class="text width10" /></td>
                                <td class="padding3 fontColor4"><label class="field_notice">重复输入您的密码</label></td>
                            </tr>
                            <tr>
                                <td>电子邮箱:</td>
                                <td><input type="text" name="email" class="text width10" /></td>
                                <td class="padding3 fontColor4"><label class="field_notice">请输入一个有效的电子邮箱地址</label></td>
                            </tr>
						    <tr>
                                <td>联系电话:</td>
                                <td><input type="text" name="im_msn" class="text width10" /></td>
                                <td class="padding3 fontColor4"><label class="field_notice">请输入一个有效的联系方式</label></td>
                            </tr>
							<tr>
                                <td>身份证号:</td>
                                <td><input type="text" name="sfz" class="text width10" /></td>
                                <td class="padding3 fontColor4"><label class="field_notice">请输入您的身份证号码</label></td>
                            </tr>
							<tr>
                                <td>开户单位:</td>
                                <td><input type="text" name="deposit" class="text width10" id="deposit" /></td>
                                <td class="padding3 fontColor4"><label class="field_notice">没有则填gongsi</label><label id="checking_user1" class="checking">检查中...</label></td>
                            </tr>
                            <?php if ($this->_var['captcha']): ?>
                            <tr>
                                <td>验证码:</td>
                                <td>
                                    <input type="text" name="captcha" class="text" id="captcha1" />
                                    <a href="javascript:change_captcha($('#captcha'));" class="renewedly"><img id="captcha" src="index.php?app=captcha&amp;<?php echo $this->_var['random_number']; ?>" /></a>
                                </td>
                                <td class="padding3 fontColor4"><label class="field_notice">请输入图片中的文字,点击图片以更换</label></td>
                            </tr>
                            <?php endif; ?>
                            <tr>
                                <td></td>
                                <td><input id="clause" type="checkbox" name="agree" value="1" /> <label for="clause">我已阅读并同意 <a href="<?php echo url('app=article&act=system&code=eula'); ?>" target="_blank" class="agreement">用户服务协议</a></label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="2"><input type="submit" name="Submit" value="" class="login_btn" title="立即注册" /></td><input type="hidden" name="ret_url" value="<?php echo $this->_var['ret_url']; ?>" />
                            </tr>
                        </table>
                        </form>
                    </div>

                    <div class="login_right">
                        <h4>友情提示:<br />如果您还不是会员，请注册</h4>
                        <p>注册之后你就可以</p>
                        <ol>
                            <li><strong>1.</strong> 保存您的个人资料</li>
                            <li><strong>2.</strong> 收藏您关注的商品</li>
                            <!--<li><strong>3.</strong> 享受会员积分制度</li>-->
                            <li><strong>3.</strong> 订阅本店商品信息</li>
                        </ol>
                        <h4>已经拥有账号</h4>
                        <a href="<?php echo url('app=member&act=login&ret_url=' . $this->_var['ret_url']. ''); ?>" class="enter" title="立即登录"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php echo $this->fetch('footer.html'); ?>
