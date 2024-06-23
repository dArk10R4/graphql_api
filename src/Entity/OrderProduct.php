<?php

namespace App\Entity;

class OrderProduct extends BaseModel
{
    public static $table = 'order_products';

    public static function create($orderProduct)
    {
        global $db;
        $sql = "INSERT INTO order_products (product_id, order_id, quantity) VALUES (:product_id, :order_id, :quantity)";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":product_id", $orderProduct['product_id'], \PDO::PARAM_INT);
        $stmt->bindValue(":order_id", $orderProduct['order_id'], \PDO::PARAM_INT);
        $stmt->bindValue(":quantity", $orderProduct['quantity'], \PDO::PARAM_INT);
        $stmt->execute();

        return $db->lastInsertId();
    }
}