<?php

namespace App\Type;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

use App\Service\OrderService;



class MutationType extends ObjectType
{
    public function __construct()
    {

        $orderType = new OrderInputType();

        $config = [
            'name' => 'Mutation',
            'fields' => [
                'echo' => [
                    'type' => Type::string(),
                    'args' => [
                        'message' => ['type' => Type::string()],
                    ],
                    'resolve' => static fn ($rootValue, array $args): string => $rootValue['prefix'] . $args['message'],
                ],
                'sum' => [
                    'type' => Type::int(),
                    'args' => [
                        'x' => ['type' => Type::int()],
                        'y' => ['type' => Type::int()],
                    ],
                    'resolve' => static fn ($rootValue, array $args): int => $args['x'] + $args['y'],
                ],
                'checkout' => [
                    'type' => Type::int(),
                    'args' => [
                        'input' => ['type' => $orderType],
                    ],
                    'resolve' => function ($rootValue, array $args) {
                        $orderService = new OrderService();

                        

                        return $orderService->checkout($args['input']);
                    },
                ],
            ],
        ];

        parent::__construct($config);
    }
}
