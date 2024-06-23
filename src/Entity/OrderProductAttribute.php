<?php

namespace App\Entity;

class OrderProductAttribute extends BaseModel
{
    public static $table = 'order_product_attributes';

    public static function create($orderProductAttribute)
    {
        global $db;
        $sql = "INSERT INTO order_product_attributes (order_product_id, attribute_id) VALUES (:order_product_id, :attribute_id)";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":order_product_id", $orderProductAttribute['order_product_id'], \PDO::PARAM_INT);
        $stmt->bindValue(":attribute_id", $orderProductAttribute['attribute_id'], \PDO::PARAM_INT);
        $stmt->execute();

        return $db->lastInsertId();
    }
}