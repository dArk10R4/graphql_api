<?php

namespace App\Type;

use App\Service\ProductService;
use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;


class PriceType extends ObjectType
{
    public function __construct()
    {
        $config = [
            "description" => "Price",
            'fields' => [
                'amount' => Type::float(),
                'currency' => [
                    'type' => Type::nonNull(new CurrencyType()),
                    "resolve" => function ($price) {
                        return ProductService::get_currency($price['currency_id']);
                    }
                ],
            ]
        ];

        parent::__construct($config);
    }
}