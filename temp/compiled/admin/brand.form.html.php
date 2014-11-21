<?php echo $this->fetch('header.html'); ?>
<script type="text/javascript">
$(function(){
    $('#brand_form').validate({
        errorPlacement: function(error, element){
            $(element).next('.field_notice').hide();
            $(element).after(error);
        },
        success       : function(label){
            label.addClass('right').text('OK!');
        },
        onkeyup    : false,
        rules : {
            brand_name : {
                required : true,
                remote   : {                //唯一
                url :'index.php?app=brand&act=check_brand',
                type:'get',
                data:{
                    brand_name : function(){
                        return $('#brand_name').val();
                        },
                    id  : '<?php echo $this->_var['brand']['brand_id']; ?>'
                    }
                }
            },
            logo : {
                accept  : 'gif|png|jpe?g'
            },
            sort_order : {
                number   : true
            }
        },
        messages : {
            brand_name : {
                required : 'Ʒ�����Ʋ���Ϊ��',
                remote   : '��Ʒ�������Ѿ������ˣ�������һ��'
            },
            logo : {
                accept : '֧�ָ�ʽgif,jpg,jpeg,png'
            },
            sort_order  : {
                number   : '���������Ϊ����'
            }
        }
    });
});
</script>
<div id="rightTop">
    <p>��ƷƷ��</p>
    <ul class="subnav">
        <li><a class="btn1" href="index.php?app=brand">����</a></li>
        <?php if ($this->_var['brand']['brand_id']): ?>
        <li><a class="btn1" href="index.php?app=brand&amp;act=add">����</a></li>
        <?php else: ?>
        <li><span>����</span></li>
        <?php endif; ?>
        <li><a class="btn1" href="index.php?app=brand&wait_verify=1">�����</a></li>
    </ul>
</div>

<div class="info">
    <form method="post" enctype="multipart/form-data" id="brand_form">
        <table class="infoTable">
            <tr>
                <th class="paddingT15">
                    Ʒ������:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="brand_name" type="text" name="brand_name" value="<?php echo htmlspecialchars($this->_var['brand']['brand_name']); ?>" /> <label class="field_notice">Ʒ������</label>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    ���:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="tag" type="text" name="tag" value="<?php echo htmlspecialchars($this->_var['brand']['tag']); ?>" /> <label class="field_notice">���</label>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    ͼƬ��ʶ:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableFile2" id="brand_logo" type="file" name="logo" />
                    <label class="field_notice">֧�ָ�ʽgif,jpg,jpeg,png</label>
                </td>
            </tr>
            <?php if ($this->_var['brand']['brand_logo']): ?>
            <tr>
                <th class="paddingT15">
                </th>
                <td class="paddingT15 wordSpacing5">
                <img src="<?php echo $this->_var['brand']['brand_logo']; ?>" class="makesmall" max_width="120" max_height="90" />
                </td>
            </tr>
            <?php endif; ?>
            <tr>
                <th class="paddingT15">
                    �Ƿ��Ƽ�:</th>
                <td class="paddingT15 wordSpacing5">
                <?php echo $this->html_radios(array('options'=>$this->_var['yes_or_no'],'checked'=>$this->_var['brand']['recommended'],'name'=>'recommended')); ?></td>
            </tr>
            <tr>
                <th class="paddingT15">
                    ����:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="sort_order" id="sort_order" type="text" name="sort_order" value="<?php echo $this->_var['brand']['sort_order']; ?>" />
                    <label class="field_notice">��������</label>
                </td>
            </tr>
        <tr>
            <th></th>
            <td class="ptb20">
                <input class="formbtn" type="submit" name="Submit" value="�ύ" />
                <input class="formbtn" type="reset" name="Submit2" value="����" />
            </td>
        </tr>
        </table>
    </form>
</div>
<?php echo $this->fetch('footer.html'); ?>
