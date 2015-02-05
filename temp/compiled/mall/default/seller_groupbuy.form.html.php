<?php echo $this->fetch('member.header.html'); ?>
<style>
.txt {margin-right:20px}
.spec ul {width: 530px; overflow: hidden;}
.spec .td {padding-bottom: 10px;}
.spec li {float: left; margin-left: 6px; display: inline;}
.spec li input {text-align: center;}
.spec .th {padding: 3px 0; margin-bottom: 10px; border-top: 2px solid #e3e3e3; border-bottom: 1px solid #e3e3e3; background: #f8f8f8;}
</style>
<script type="text/javascript">
//<!CDATA[
$(function(){
    $('#start_time input').datepicker({dateFormat: 'yy-mm-dd'});
    $('#end_time input').datepicker({dateFormat: 'yy-mm-dd'});
    if_show();
    //check_spec();
    $('input[name="if_publish"]').click(function(){
        if_show();
    });


    $('#group_form').validate({
        errorPlacement: function(error, element){
            $(element).next('.field_notice').hide();
            $(element).after(error);
        },
        success       : function(label){
            label.addClass('validate_right').text('OK!');
        },
        onkeyup : false,
        rules : {
            group_name : {
                required   : true
            },
            group_desc : {
                maxlength   : 255
            },
            end_time      : {
                required     : true
            },
            /*goods_id      : {
                required   :true,
                min    : 1
            },*/
            min_quantity :{
                required   :true,
                min    :1
            }
        },
        messages : {
            group_name  : {
                required   : '����д�Ź�����'
            },
            group_desc  : {
                maxlength   : '�Ź�˵���������ܴ���255��'
            },
            end_time       : {
                required     : '����д����ʱ��'
            },
            /*goods_id      : {
                required:  '���������Ź���Ʒ',
                min   : '���������Ź���Ʒ'
            },*/
            min_quantity: {
                required : '����ȷ��д���ż���',
                min   : '����ȷ��д���ż���'
            }
        }
    });

});

function gs_callback(){
    query_spec($('#goods_id').val());
}
function if_show(){
    if($('input[name="if_publish"]:checked').val() == 1){
            $('#start_time').hide();
        }else{
            $('#start_time').show();
    }
}

function check_spec(){
    $('input[name="spec_id[]"]').click(function(){
        var obj_group_price = $(this).parent().parent().find('input[name="group_price[]"]')
        if($(this).attr('checked') == true){
            obj_group_price.show();
            obj_group_price.attr('disabled', false);
        }else{
            obj_group_price.hide();
            obj_group_price.attr('disabled', true);
            obj_group_price.val('');
            $('label.error').remove();
        }
    });

    $('#submit_group').unbind('click');
    $('#submit_group').click(function(){
        $('label.error').remove();
        var qty = 0;
        var error = false;
        var price_empty = false;

        $('*[ectype="spec_item"]').each(function(){
            var obj_group_price = $(this).find('input[name="group_price[]"]');
            var group_price = obj_group_price.val();
            var if_checked = $(this).find('input[name="spec_id[]"]').attr('checked');
            if_checked && qty++;
            if(group_price != '' && (group_price < 0 || isNaN(group_price))){
                error = obj_group_price;
            }
            if(if_checked && group_price == ''){
                price_empty = obj_group_price;
            return false;
            }
        })
        if(qty == 0){
            alert('���ȹ�ѡ�Ź���Ʒ���');
            return false;
        }
        if(error != false){
            error.focus();
            error.addClass('error');
            error.after('<label class="error" for="group_price[]" generated="true">����ȷ��д�Ź��۸�</label>');
            return false;
        }
        if(price_empty != false){
            price_empty.focus();
            price_empty.addClass('error');
            price_empty.after('<label class="error" for="group_price[]" generated="true">����д�Ź��۸�</label>');
            return false;
        }

    });
}

function query_spec(goods_id){
    $.getJSON('index.php?app=seller_groupbuy&act=query_goods_info',{
        'goods_id':goods_id
        },
        function(data){
            if(data.done){
                var goods = data.retval;
                $('#spec_name').html(goods.spec_name);
                $('ul[ectype="spec_item"]').remove();
                    $.each(goods._specs,function(i,item){
                        $('#group_spec').append('<ul ectype="spec_item" class="td"><li class="distance2"><input name="spec_id[]" value="'+ item.spec_id +'" type="checkbox" checked="checked" />'+ item.spec +'</li><li class="distance1">' + item.stock + '</li><li class="distance1">'+ item.price +'</li><li><input name="group_price[]" type="text" class="text width2" /></li></ul>');
                });
                check_spec();
            }
        });
}
//]]>
</script>
<div class="content">
  <div class="totline"></div>
  <div class="botline"></div>
  <?php echo $this->fetch('member.menu.html'); ?>
  <div id="right">
     <?php echo $this->fetch('member.submenu.html'); ?>

        <div id="seller_groupbuy_form" class="wrap">

            <div class="public">
                <form method="post" id="group_form" enctype="multipart/form-data">
                    <div class="information_index">
                        <h4>�Ź�������Ϣ</h4>
                        <div class="add_wrap">
                            <div class="assort">
                                <p class="txt">�����:
                                <input type="text" name="group_name" value="<?php echo htmlspecialchars($this->_var['group']['group_name']); ?>" class="text width7" /> <span class="red">*</span></p>
                            </div>
                            <div class="assort">
                                <p class="txt">
                                    ��������:
                                    <span class="distance">
                                        <label for="publish"><input id="publish" name="if_publish" value="1" type="radio" <?php if (! $this->_var['group']['group_id']): ?>checked="checked" <?php endif; ?>/> ��</label>
                                        <label for="not_publish"><input id="not_publish" name="if_publish" value="0" type="radio" <?php if ($this->_var['group']['group_id']): ?>checked="checked" <?php endif; ?>/> ��</label> <span class="red">*</span>
                                        <span class="field_notice">����������������������Ź�˵���������Ϣ�������ٱ�����</span>
                                    </span>
                                </p>
                            </div>
                            <div class="assort">
                                <p class="txt" id="start_time">
                                    ��ʼʱ��:
                                    <input name="start_time" value="<?php echo local_date("Y-m-d",$this->_var['group']['start_time']); ?>" type="text" class="text width2" />
                                </p>
                                <p class="txt" id="end_time">
                                    ����ʱ��:
                                    <input name="end_time" value="<?php echo local_date("Y-m-d",$this->_var['group']['end_time']); ?>" type="text" class="text width2" /> <span class="red">*</span>
                                </p>
                            </div>
                            <div class="assort">
                                <p class="txt" id="start_time">
                                    �Ź�˵��:
                                    <textarea style="height: 150px; overflow-y: auto; width: 250px; vertical-align: top;" id="group_desc" name="group_desc" class="text"><?php echo htmlspecialchars($this->_var['group']['group_desc']); ?></textarea>
                                </p>
                            </div>
                        </div>

                        <h4>�Ź���Ʒ��Ϣ</h4>
                        <div class="add_wrap">

                            <div class="assort">
                                <p class="txt">��Ʒ����:
                                <input type="text" name="goods_name" class="text width3" value="<?php echo $this->_var['goods']['goods_name']; ?>">
                                </p>
                            </div>
                            <div class="assort">
                                <p class="txt">���ż���:
                                <input type="text" name="min_quantity" value="<?php echo $this->_var['group']['min_quantity']; ?>" class="text width2" /> <span class="red">*</span><span class="field_notice">������Ź���������������</span></p>
                            </div>
                            <div class="assort">
                                <p class="txt">ÿ���޹�:
                                <input type="text" name="max_per_user" value="<?php echo $this->_var['group']['max_per_user']; ?>" class="text width2" /><span class="field_notice">ÿ������������ܶ����ļ�����0Ϊ������</span></p>
                            </div>
                            <div class="assort">
                                <p class="txt">��Ʒԭ��:
                                    <input type="text" name="price" class="text width2" value="<?php echo $this->_var['goods']['price']; ?>">
                                </p>
                            </div>
                            <div class="assort">
                                <p class="txt">�Ź��۸�:
                                    <input type="text" name="group_price" class="text width2" value="<?php echo $this->_var['goods']['group_price']; ?>">
                                </p>
                            </div>
                            <div class="assort">
                                <p class="txt">ԭ&nbsp;&nbsp;��&nbsp;&nbsp;��:
                                    <input type="text" name="integral" class="text width2" value="<?php echo $this->_var['goods']['integral']; ?>">
                                </p>
                            </div>
                            <div class="assort">
                                <p class="txt">�Ź�����:
                                    <input type="text" name="group_integral" class="text width2" value="<?php echo $this->_var['goods']['group_integral']; ?>">
                                </p>
                            </div>
                            <div class="assort">
                                <p class="txt">��ƷͼƬ:
                                    <input type="file" name="image" value="">
                                </p>
                            </div>

                            <div class="issuance"><input id="submit_group" type="submit" class="btn" value="�ύ" /></div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="wrap_bottom"></div>
        </div>

        <div class="clear"></div>
        <div class="adorn_right1"></div>
        <div class="adorn_right2"></div>
        <div class="adorn_right3"></div>
        <div class="adorn_right4"></div>
    </div>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>