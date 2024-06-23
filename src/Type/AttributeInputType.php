<?php

namespace App\Type;

use GraphQL\Type\Definition\InputObjectType;
use GraphQL\Type\Definition\Type;

class AttributeInputType extends InputObjectType
{
    public function __construct()
    {
        $config = [
            'name' => 'AttributeInput',
            'fields' => [
                'id' => Type::nonNull(Type::string()),
                'value' => Type::nonNull(Type::string()),
            ],
        ];

        parent::__construct($config);
    }
}