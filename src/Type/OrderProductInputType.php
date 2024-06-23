<?php

namespace App\Type;

use GraphQL\Type\Definition\InputObjectType;
use GraphQL\Type\Definition\Type;

class OrderProductInputType extends InputObjectType
{
    public function __construct()
    {
        $config = [
            "description" => "OrderProduct",
            'fields' => [
                'id' => Type::nonNull(Type::string()),
                'quantity' => Type::nonNull(Type::int()),
                'selectedAttributes' => Type::nonNull(Type::listOf(new AttributeInputType())),
            ]
        ];

        parent::__construct($config);
    }
}