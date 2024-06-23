<?php

namespace App\Type;

use GraphQL\Type\Definition\InputObjectType;
use GraphQL\Type\Definition\Type;

class OrderInputType extends InputObjectType
{
    public function __construct()
    {
        $config = [
            'name' => 'OrderInput',
            'fields' => [
                'products' => Type::nonNull(Type::listOf(new OrderProductInputType()))
            ],
            // 'resolve' => function ($rootValue, array $args){
            //     // dd($args);
            //     return 31;
            // } ,
        ];

        parent::__construct($config);
    }
}