<?php

namespace App\Type;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

class AttributeType extends ObjectType
{
    private static $instance;
    public function __construct()
    {
        $config = [
            "description" => "Attribute",
            'fields' => [
                'id' => Type::nonNull(Type::id()),
                'displayValue' => Type::nonNull(Type::string()),
                'value' => Type::nonNull(Type::string()),
            ]
        ];

        parent::__construct($config);
    }

    public static function getInstance() {
        // Check if the instance is not already initialized
        if (!isset(self::$instance)) {
            // Initialize the instance here
            self::$instance = new AttributeType();
        }
        // Return the instance
        return self::$instance;
    }
}