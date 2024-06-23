<?php

namespace App\Repository;

use App\Entity\Attribute;

class AttributeRepository extends BaseRepository
{
    public static function get_product_attributes($product_id): array
    {
        $attributes = Attribute::get_product_attributes($product_id);

        
        $result = [];

        foreach ($attributes as $attribute ) 
        {
            $result[$attribute['attribute_set_id']]['name'] = $attribute['name'];
            $result[$attribute['attribute_set_id']]['id'] = $attribute['attribute_set_query_id'];
            $result[$attribute['attribute_set_id']]['type'] = $attribute['attribute_set_name'];
            $result[$attribute['attribute_set_id']]['items'][] = [
                'id' => $attribute['attribute_query_id'],
                'value' => $attribute['attribute_value'],
                'displayValue' => $attribute['attribute_displayValue'],
                'query_id' => $attribute['attribute_query_id']
            ];
        }

        return $result;
    }
}