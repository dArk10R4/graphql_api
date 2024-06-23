<?php

namespace App\Entity;

class Order extends BaseModel
{
    public static $table = 'orders';

    public static function create($order)
    {
        global $db;
        $sql = "INSERT INTO orders (total) VALUES (:total)";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":total", $order['total'], \PDO::PARAM_INT);
        $stmt->execute();

        return $db->lastInsertId();
    }
}

