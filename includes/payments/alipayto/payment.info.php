<?php

return array(
    'code'      => 'alipayto',
    'name'      => '֧����ת��',
    'desc'      => 'ͨ��֧����ת�˸���,����ǩԼ���������ѣ���Ҫ�˹�ȷ�ϵ��ˣ��ж������ѣ���',
    'is_online' => '0',
    'author'    => 'tianwei',
    'website'   => 'http://www.alipay.com',
    'version'   => '1.0',
    'currency'  => Lang::get('alipay_currency'),
    'config'    => array(
        'alipay_account'   => array(        //�˺�
            'text'  => '֧�����˺�',
            'desc'  => '�����տ��֧�����˺�',
            'type'  => 'text',
        ),
        'tel'       => array(        //��Կ
            'text'  => '�ֻ�����',
            'desc'  => '���ն���֪ͨ���ֻ�����',
            'type'  => 'text',
        ),  
    ),
);

?>