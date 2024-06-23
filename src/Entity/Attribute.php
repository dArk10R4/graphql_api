<?php

namespace App\Entity;

class Attribute extends BaseModel
{
    protected static $table = "attributes";

    public static function get_product_attributes($product_id): array
    {
        global $db;
        $sql = "SELECT a_s.id as attribute_set_id, a_s.query_id as attribute_set_query_id, 
        a_s.name, a_s.type as attribute_set_name, 
        a.id as attribute_id, a.query_id as attribute_query_id,
        a.value as attribute_value,
        a.displayValue as attribute_displayValue 
        FROM product_attributes pa
        JOIN attributes a ON pa.attribute_id = a.id 
        JOIN attribute_sets a_s ON a.attribute_set_id = a_s.id
        WHERE pa.product_id = :product_id
        GROUP BY a_s.id, a.id
        ";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":product_id", $product_id, \PDO::PARAM_STR);
    
        $stmt->execute();
        
        $attributes = $stmt->fetchAll();


        return $attributes;
    }
}