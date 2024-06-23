<?php

namespace App\Entity;

class Gallery extends BaseModel
{
    protected static $table = "gallery";
    
    public static function get_by_product_id($product_id): array|null {
        global $db;
        $sql = "SELECT * FROM images WHERE product_id = :id";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":id", $product_id, \PDO::PARAM_INT);
        $stmt->execute();
        $gallery = $stmt->fetchAll();

        if (!$gallery) {
            return null;
        }



        return $gallery;
    }
}