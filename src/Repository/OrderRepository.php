<?php

namespace App\Repository;

use App\Entity\Order;
use App\Entity\Product;
use App\Entity\OrderProduct;
use App\Entity\OrderProductAttribute;

class OrderRepository
{
    public static function create($order)
    {
        // dd($order);
        $total = 0;
        $orderProducts = [];
        foreach ($order['products'] as $productInfo) {
            $product = Product::findByQueryId($productInfo['id']);
            if (!$product) {
                continue;
            }
            $attributes = [];
            foreach ($productInfo['selectedAttributes'] as $sa) {
                foreach ($product as $p) {
                    if ($p['attribute_set_query_id'] == $sa['id'] && $p['attribute_query_id'] == $sa['value']) {
                        $attributes[] = $p['attribute_id'];
                        break;
                    }
                }
            }

            if (count($attributes) != count($productInfo['selectedAttributes'])) {
                continue;
            }

            $orderProducts[] = [
                'product_id' => $product[0]['product_id'],
                'quantity' => $productInfo['quantity'],
                'attributes' => $attributes
            ];
            $total += $product[0]['price'] * $productInfo['quantity'];
        }
        
        if (empty($orderProducts)) {
            return null;
        }

        $orderId = Order::create(['total' => $total]);

        foreach ($orderProducts as $orderProduct) {
            $orderProduct['order_id'] = $orderId;
            $orderProductId = OrderProduct::create($orderProduct);
            if (!$orderProductId) {
                return null;
            }
            foreach ($orderProduct['attributes'] as $attribute) {
                $orderProductAttribute = [
                    'order_product_id' => $orderProductId,
                    'attribute_id' => $attribute
                ];
                $orderProductAttributeId = OrderProductAttribute::create($orderProductAttribute);
                if (!$orderProductAttributeId) {
                    return null;
                }
            }
        }

        return $orderId;
    }
}