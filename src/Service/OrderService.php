<?php

namespace App\Service;

use App\Repository\OrderRepository;

class OrderService
{
    public function checkout($order)
    {
        return OrderRepository::create($order);
    }
}


/**
 * orders: 
 * id
 * total
 * 
 * order_products:
 * product_id
 * order_id
 * quantity
 * 
 * order_product_attributes:
 * order_product_id
 * attribute_id
 */