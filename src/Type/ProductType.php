<?php

namespace App\Type;

use App\Service\ProductService;
use App\Service\AttributeService;
use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;


class ProductType extends ObjectType
{
    private static $instance;
    public function __construct()
    {
        $config = [
            "description" => "Product",
            'fields' => [
                'id' => [
                    "type" => Type::nonNull(Type::id()),
                    "resolve" => fn ($product): string => $product['query_id']
                ],
                'name' => Type::nonNull(Type::string()),
                'inStock' => Type::nonNull(Type::boolean()),
                'gallery'=> [
                    "type" => Type::nonNull(Type::listOf(Type::nonNull(Type::string()))),
                    "resolve" => function($product){
                        return ProductService::get_gallery_urls($product['id']);
                    }
                ],
                'attributes'=>[
                    "type" => Type::nonNull(Type::listOf(Type::nonNull(new AttributeSetType()))),
                    "resolve" => function($product) {
                        return AttributeService::get_product_attributes($product['id']);
                    }
                ],//fix
                'prices' => [
                    "type" => Type::nonNull(Type::listOf(Type::nonNull(new PriceType()))),
                    "resolve" => function($product){
                        return ProductService::get_prices($product['id']);
                    }
                ],
                'description' => Type::nonNull(Type::string()),
                'brand' => Type::nonNull(Type::string()),
                'category' => [
                    "type"=>Type::nonNull(Type::string()),
                    "resolve"=>function($product){
                        // dd($product);
                        return ProductService::get_category($product['category_id']);
                    }
                ],
            ]
        ];

        parent::__construct($config);
    }

    public static function getInstance() {
        // Check if the instance is not already initialized
        if (!isset(self::$instance)) {
            // Initialize the instance here
            self::$instance = new ProductType();
        }
        // Return the instance
        return self::$instance;
    }
}
