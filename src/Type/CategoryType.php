<?php

namespace App\Type;

use App\Service\CategoryService;
use App\Service\ProductService;
use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

// $productType = require_once __DIR__ . '/ProductType.php';

class CategoryType extends ObjectType
{
    private static $instance;
    public function __construct()
    {
        $productType = ProductType::getInstance();
        $config = [
            "description" => "Category",
            'fields' => [
                'name' => Type::nonNull(Type::string()),
                'products' => [
                    "type" => Type::listOf($productType),
                    "resolve" => function ($category, $args, $context, $info): array {
                        if ($category['name'] === 'all') {
                            return ProductService::all();
                        }
                        return CategoryService::get_products($category['id']);
                    },
                ],
            ]
        ];

        parent::__construct($config);
    }

    public static function getInstance() {
        // Check if the instance is not already initialized
        if (!isset(self::$instance)) {
            // Initialize the instance here
            self::$instance = new CategoryType();
        }
        // Return the instance
        return self::$instance;
    }
}