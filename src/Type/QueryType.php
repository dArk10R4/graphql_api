<?php

namespace App\Type;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\EnumType;
use GraphQL\Type\Definition\Type;

use App\Service\ProductService;
use App\Service\CategoryService;


class QueryType extends ObjectType
{
    public function __construct()
    {
        // dd("salam");
        $productType = ProductType::getInstance();
        $categoryType = CategoryType::getInstance();

        $config = [
            'name' => 'Query',
            'fields' => [
                'echo' => [
                    'type' => Type::string(),
                    'args' => [
                        'message' => ['type' => Type::string()],
                    ],
                    'resolve' => static fn ($rootValue, array $args): string => $rootValue['prefix'] . $args['message'],
                ],
                'product' => [
                    "type" => $productType,
                    "args" => [
                        "id" => Type::nonNull(Type::string())
                    ],
                    "resolve" => fn ($rootValue, array $args): array|null => ProductService::find($args['id'])
                ],
                'products' => [
                    "type" => Type::listOf($productType),
                    "resolve" => fn (): array => ProductService::all()
                ],
                'categories' => [
                    "type" => Type::listOf($categoryType),
                    "resolve" => fn ($rootValue, array $args): array => array_merge([[
                        "name" => "all"
                    ]],CategoryService::all()) ,
                ],
                'category' => [
                    "type" => $categoryType,
                    "args" => [
                        "name" => Type::nonNull(Type::string())
                    ],
                    "resolve" => fn ($rootValue, array $args): array|null => CategoryService::findByName($args['name'])
                ],

            ],
        ];



        parent::__construct($config);
    }
}
