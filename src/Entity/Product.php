<?php

namespace App\Entity;

global $db;
class Product extends BaseModel
{
    protected static $table = "products";


    public static function find($id): array|null {
        global $db;
        $sql = "SELECT * 
        FROM products 
        WHERE query_id = :id";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":id", $id, \PDO::PARAM_STR);
    
        $stmt->execute();
        
        $product = $stmt->fetch();
        if (!$product) {
            return null;
        }
        return $product;
    }

    public static function findManyByQueryId(array $query_ids): array {

        $query_ids = implode(",", $query_ids);
        global $db;
        $sql = "SELECT * 
        FROM products 
        WHERE query_id IN (:query_ids)";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":query_ids", $query_ids, \PDO::PARAM_STR);
    
        $stmt->execute();
        
        $products = $stmt->fetchAll();
        return $products;
    }

    public static function findByQueryId($query_id): array|null {
        try {

            global $db;
            $sql = "SELECT p.id as product_id, a.id as attribute_id, a.query_id as attribute_query_id, aset.query_id as attribute_set_query_id, pr.amount as price
            FROM products p
            LEFT JOIN product_attributes pa ON pa.product_id = p.id
            LEFT JOIN attributes a ON a.id = pa.attribute_id
            LEFT JOIN attribute_sets aset ON aset.id = a.attribute_set_id
            LEFT JOIN prices pr ON pr.product_id = p.id
            WHERE p.query_id = :query_id
            ";
            $stmt = $db->prepare($sql);
            $stmt->bindValue(":query_id", $query_id, \PDO::PARAM_STR);
            
            $stmt->execute();
            $product = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            if (!$product) {
                return null;
            }
        } catch (\Exception $e) {
            dd($e);
        }
        return $product;
    }

}
// dd($db->exec("
// UPDATE attributes
// set value=41
// where id=2
// "));