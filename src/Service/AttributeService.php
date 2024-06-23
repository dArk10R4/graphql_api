<?php

namespace App\Service;

use App\Repository\AttributeRepository;

class AttributeService 
{
    public static function get_product_attributes($product_id)
    {
        $attributes = AttributeRepository::get_product_attributes($product_id);

        return $attributes;
    }
}