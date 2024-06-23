<?php

namespace App\Entity;

class Category extends BaseModel
{
    protected static $table = "categories";
    
    public static function get_products($id)
    {
        global $db;
        $sql = "SELECT * FROM products WHERE category_id = :id";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":id", $id, \PDO::PARAM_INT);
        $stmt->execute();

        $items = $stmt->fetchAll();

        if (!$items) {
            return null;
        }

        return $items;
    }

    public static function findByName($name)
    {
        global $db;
        $sql = "SELECT * FROM categories WHERE name = :name";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":name", $name, \PDO::PARAM_STR);
        $stmt->execute();

        $item = $stmt->fetch();

        if (!$item) {
            return null;
        }

        return $item;
    }
}

