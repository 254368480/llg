<?php

/**
 *    ֧����֧����ʽ���
 *
 *    @author    Garbin
 *    @usage    none
 */

class AlipaytoPayment extends BasePayment
{
    /* ֧�������� */
  	var $_code      =   'alipayto';

    /**
     *    ��ȡ֧����
     *
     *    @author    Garbin
     *    @param     array $order_info  ��֧���Ķ�����Ϣ����������ܷ��ü�Ψһ�ⲿ���׺�
     *    @return    array
     */
    function get_payform($order_info)
    {
        $params = array(

            /* ������Ϣ */
			
           

            /* ҵ����� */
			
            'subject'           => '�����ţ�'.$order_info['order_sn'].�ķ���,
			'order_sn'		    => $order_info['order_sn'],
            //����ID�ɲ���ǩ����֤��һ���֣������п��ܱ��ͻ������޸ģ������ڽ�������֪ͨʱҪ��ָ֤���Ķ���ID���ⲿ���׺��Ƿ������ش�������һ��
            'out_trade_no'      => $this->_get_trade_sn($order_info),
            'price'             => $order_info['order_amount'],   //Ӧ���ܼ�
            'quantity'          => 1,
            'payment_type'      => 1,
			'desc'     		    => $this->_info['payment_desc'],
			
			/* ����˫����Ϣ */
            'seller_email'      => $this->_config['alipay_account'],
			'seller_tel'      => $this->_config['tel']
        );

       
		
		
		
		
        return $params;
		
    }

    
}

?>