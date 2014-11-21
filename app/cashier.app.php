<?php

/**
 *    ����̨������������ݵ�������Ա�Ľ�ɫ����ֻ��Ҫ����Ķ�����������Ա������Ա����������������רע���������
 *
 *    @author    Garbin
 */
class CashierApp extends ShoppingbaseApp
{
    /**
     *    �����ṩ�Ķ�����Ϣ����֧��
     *
     *    @author    Garbin
     *    @param    none
     *    @return    void
     */
    function index()
    {
        /* �ⲿ�ṩ������ */
        $order_id = isset($_GET['order_id']) ? intval($_GET['order_id']) : 0;
        if (!$order_id)
        {
            $this->show_warning('no_such_order');

            return;
        }
        /* �ڲ����ݶ���������,��ȡ�ն���Ǯ��ʹ���ĸ�֧���ӿ� */
        $order_model =& m('order');
        $order_info  = $order_model->get("order_id={$order_id} AND buyer_id=" . $this->visitor->get('user_id'));
        if (empty($order_info))
        {
            $this->show_warning('no_such_order');

            return;
        }
        /* ������Ч���ж� */
        if ($order_info['payment_code'] != 'cod' && $order_info['status'] != ORDER_PENDING)
        {
            $this->show_warning('no_such_order');
            return;
        }
        $payment_model =& m('payment');
        if (!$order_info['payment_id'])
        {
            /* ����û��ѡ��֧����ʽ��������ѡ��֧����ʽ */
            $payments = $payment_model->get_enabled($order_info['seller_id']);
            if (empty($payments))
            {
                $this->show_warning('store_no_payment');

                return;
            }
            /* �ҳ����ͷ�ʽ���ж��Ƿ����ʹ�û������� */
            $model_extm =& m('orderextm');
            $consignee_info = $model_extm->get($order_id);
            if (!empty($consignee_info))
            {
                /* ��Ҫ���ͷ�ʽ */
                $model_shipping =& m('shipping');
                $shipping_info = $model_shipping->get($consignee_info['shipping_id']);
                $cod_regions   = unserialize($shipping_info['cod_regions']);
                $cod_usable = true;//Ĭ�Ͽ���
                if (is_array($cod_regions) && !empty($cod_regions))
                {
                    /* ȡ��֧�ֻ�����������������¼����� */
                    $all_regions = array();
                    $model_region =& m('region');
                    foreach ($cod_regions as $region_id => $region_name)
                    {
                        $all_regions = array_merge($all_regions, $model_region->get_descendant($region_id));
                    }

                    /* �鿴������ָ���ĵ����Ƿ��ڿɻ�������ĵ����б��У�������ڣ�����ʾ��������ĸ��ʽ */
                    if (!in_array($consignee_info['region_id'], $all_regions))
                    {
                        $cod_usable = false;
                    }
                }
                else
                {
                    $cod_usable = false;
                }
                if (!$cod_usable)
                {
                    /* ���б���ȥ����������ķ�ʽ */
                    foreach ($payments as $_id => $_info)
                    {
                        if ($_info['payment_code'] == 'cod')
                        {
                            /* �����װ�������˻����������ӿ�ѡ�б���ȥ�� */
                            unset($payments[$_id]);
                        }
                    }
                }
            }
            $all_payments = array('online' => array(), 'offline' => array());
            foreach ($payments as $key => $payment)
            {
                if ($payment['is_online'])
                {
                    $all_payments['online'][] = $payment;
                }
                else
                {
                    $all_payments['offline'][] = $payment;
                }
            }
            $this->assign('order', $order_info);
            $this->assign('payments', $all_payments);
            $this->_curlocal(
                LANG::get('cashier')
            );

            $this->_config_seo('title', Lang::get('confirm_payment') . ' - ' . Conf::get('site_title'));
            $this->display('cashier.payment.html');
        }
        else
        {
            /* ����ֱ�ӵ�����֧�� */
            /* ��֤֧����ʽ�Ƿ���ã������ڰ������У�������ʹ�� */
            if (!$payment_model->in_white_list($order_info['payment_code']))
            {
                $this->show_warning('payment_disabled_by_system');

                return;
            }

            $payment_info  = $payment_model->get("payment_code = '{$order_info['payment_code']}' AND store_id={$order_info['seller_id']}");
            /* ������û�����ã�������ʹ�� */
            if (!$payment_info['enabled'])
            {
                $this->show_warning('payment_disabled');

                return;
            }
			
            /* ����֧��URL��� */
            $payment    = $this->_get_payment($order_info['payment_code'], $payment_info);
            $payment_form = $payment->get_payform($order_info);
			
			
			if( $order_info['payment_code'] == 'alipayto'){
				$button = '
				<form id="payment" accept-charset="GBK" action="https://shenghuo.alipay.com/send/payment/fill.htm" method="post">
					<input name="optEmail" type="hidden" value="' .$payment_form['seller_email']. '" />
					<input name="payAmount" type="hidden" value="' .$payment_form['price']. '" />
					<input name="title" type="hidden" value="' .$payment_form['subject']. '" />
					<input name="smsNo" type="hidden" value="' .$payment_form['seller_tel']. '" />
			    </form>
				<input type="button" onclick="javascript:document.charset=\'GBK\';document.getElementById(\'payment\').submit()" value="����ʹ��֧��������" />';
			}

            /* �����������ʾ��ʾҳ�� */
            if ($payment_info['payment_code'] == 'cod')
            {
                $this->show_message('cod_order_notice',
                    'view_order',   'index.php?app=buyer_order',
                    'close_window', 'javascript:window.close();'
                );

                return;
            }

            /* ���¸���� */
            if (!$payment_info['online'])
            {
                $this->_curlocal(
                    Lang::get('post_pay_message')
                );
            }

            /* ��ת����ʵ����̨ */
            $this->_config_seo('title', Lang::get('cashier'));
			$this->assign('button', $button);
            $this->assign('payform', $payment_form);
            $this->assign('payment', $payment_info);
            $this->assign('order', $order_info);
            header('Content-Type:text/html;charset=' . CHARSET);
            $this->display('cashier.payform.html');
        }
    }

    /**
     *    ȷ��֧��
     *
     *    @author    Garbin
     *    @return    void
     */
    function goto_pay()
    {
        $order_id = isset($_GET['order_id']) ? intval($_GET['order_id']) : 0;
        $payment_id = isset($_POST['payment_id']) ? intval($_POST['payment_id']) : 0;
        if (!$order_id)
        {
            $this->show_warning('no_such_order');

            return;
        }
        if (!$payment_id)
        {
            $this->show_warning('no_such_payment');

            return;
        }
        $order_model =& m('order');
        $order_info  = $order_model->get("order_id={$order_id} AND buyer_id=" . $this->visitor->get('user_id'));
        if (empty($order_info))
        {
            $this->show_warning('no_such_order');

            return;
        }

        #���ܲ�����
        if ($order_info['payment_id'])
        {
            $this->_goto_pay($order_id);
            return;
        }

        /* ��֤֧����ʽ */
        $payment_model =& m('payment');
        $payment_info  = $payment_model->get($payment_id);
        if (!$payment_info)
        {
            $this->show_warning('no_such_payment');

            return;
        }

        /* ����֧����ʽ */
        $edit_data = array(
            'payment_id'    =>  $payment_info['payment_id'],
            'payment_code'  =>  $payment_info['payment_code'],
            'payment_name'  =>  $payment_info['payment_name'],
        );

        /* ����ǻ��������ı䶩��״̬ */
        if ($payment_info['payment_code'] == 'cod')
        {
            $edit_data['status']    =   ORDER_SUBMITTED;
        }

        $order_model->edit($order_id, $edit_data);

        /* ��ʼ֧�� */
        $this->_goto_pay($order_id);
    }

    /**
     *    ����֧����Ϣ
     *
     *    @author    Garbin
     *    @return    void
     */
    function offline_pay()
    {
        if (!IS_POST)
        {
            return;
        }
        $order_id       = isset($_GET['order_id']) ? intval($_GET['order_id']) : 0;
        $pay_message    = isset($_POST['pay_message']) ? trim($_POST['pay_message']) : '';
        if (!$order_id)
        {
            $this->show_warning('no_such_order');
            return;
        }
        if (!$pay_message)
        {
            $this->show_warning('no_pay_message');

            return;
        }
        $order_model =& m('order');
        $order_info  = $order_model->get("order_id={$order_id} AND buyer_id=" . $this->visitor->get('user_id'));
        if (empty($order_info))
        {
            $this->show_warning('no_such_order');

            return;
        }
        $edit_data = array(
            'pay_message' => $pay_message
        );

        $order_model->edit($order_id, $edit_data);

        /* ����֧����ɲ�����pay_message,���͸����Ҹ��������ʾ�ʼ� */
        $model_member =& m('member');
        $seller_info   = $model_member->get($order_info['seller_id']);
        $mail = get_mail('toseller_offline_pay_notify', array('order' => $order_info, 'pay_message' => $pay_message));
        $this->_mailto($seller_info['email'], addslashes($mail['subject']), addslashes($mail['message']));

        $this->show_message('pay_message_successed',
            'view_order',   'index.php?app=buyer_order',
            'close_window', 'javascript:window.close();');
    }

    function _goto_pay($order_id)
    {
        header('Location:index.php?app=cashier&order_id=' . $order_id);
    }
}

?>
