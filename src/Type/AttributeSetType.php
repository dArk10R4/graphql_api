<?php

namespace App\Type;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

class AttributeSetType extends ObjectType
{
    public function __construct()
    {
        $attributeType = AttributeType::getInstance();
        $config = [
            "description" => "AttributeSet",
            'fields' => [
                'id' => Type::nonNull(Type::id()),
                'name' => Type::nonNull(Type::string()),
                'type' => Type::nonNull(Type::string()),
                'items' => Type::nonNull(Type::listOf(Type::nonNull($attributeType))),
            ]
        ];

        parent::__construct($config);
    }
}