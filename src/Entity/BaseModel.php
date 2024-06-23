<?php

namespace App\Entity;


abstract class BaseModel 
{
    protected static $table;
    public static function all(): array|null 
    {
        global $db;
        $sql = "SELECT * FROM " . static::$table;
        $result = $db->query($sql);
        $items = [];
        $items = $result->fetchAll();

        if (!$items) {
            return null;
        }

        return $items;
    }

    public static function find($id): array|null 
    {
        global $db;
        $sql = "SELECT * 
        FROM " . static::$table . " 
        WHERE id = :id";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":id", $id, \PDO::PARAM_INT);
    
        $stmt->execute();
        
        $item = $stmt->fetch();
        if (!$item) {
            return null;
        }
        return $item;
    }
}