<?php

namespace App\Type;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

class CurrencyType extends ObjectType
{
    public function __construct()
    {
        $config = [
            "description" => "Currency",
            'fields' => [
                'label' => Type::string(),
                'symbol' => Type::string(),
            ]
        ];

        parent::__construct($config);
    }
}