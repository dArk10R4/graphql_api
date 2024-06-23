<?php

namespace App\Entity;

class Price extends BaseModel
{
    protected static $table = "prices";

    public static function get_by_product_id($product_id): array|null
    {
        global $db;
        $sql = "SELECT * FROM prices WHERE product_id = :id";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":id", $product_id, \PDO::PARAM_INT);
        $stmt->execute();
        $prices = $stmt->fetchAll();

        if (!$prices) {
            return null;
        }
        return $prices;
    }
  
}