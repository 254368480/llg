<?php

return array(
    'code'      => 'alipayto',
    'name'      => '支付宝转账',
    'desc'      => '通过支付宝转账付款,无需签约，无手续费，需要人工确认到账（有短信提醒）！',
    'is_online' => '0',
    'author'    => 'tianwei',
    'website'   => 'http://www.alipay.com',
    'version'   => '1.0',
    'currency'  => Lang::get('alipay_currency'),
    'config'    => array(
        'alipay_account'   => array(        //账号
            'text'  => '支付宝账号',
            'desc'  => '用于收款的支付宝账号',
            'type'  => 'text',
        ),
        'tel'       => array(        //密钥
            'text'  => '手机号码',
            'desc'  => '接收短信通知的手机号码',
            'type'  => 'text',
        ),  
    ),
);

?>