<?php

/**
 *    支付宝支付方式插件
 *
 *    @author    Garbin
 *    @usage    none
 */

class AlipaytoPayment extends BasePayment
{
    /* 支付宝网关 */
  	var $_code      =   'alipayto';

    /**
     *    获取支付表单
     *
     *    @author    Garbin
     *    @param     array $order_info  待支付的订单信息，必须包含总费用及唯一外部交易号
     *    @return    array
     */
    function get_payform($order_info)
    {
        $params = array(

            /* 基本信息 */
			
           

            /* 业务参数 */
			
            'subject'           => '订单号：'.$order_info['order_sn'].的费用,
			'order_sn'		    => $order_info['order_sn'],
            //订单ID由不属签名验证的一部分，所以有可能被客户自行修改，所以在接收网关通知时要验证指定的订单ID的外部交易号是否与网关传过来的一致
            'out_trade_no'      => $this->_get_trade_sn($order_info),
            'price'             => $order_info['order_amount'],   //应付总价
            'quantity'          => 1,
            'payment_type'      => 1,
			'desc'     		    => $this->_info['payment_desc'],
			
			/* 买卖双方信息 */
            'seller_email'      => $this->_config['alipay_account'],
			'seller_tel'      => $this->_config['tel']
        );

       
		
		
		
		
        return $params;
		
    }

    
}

?>