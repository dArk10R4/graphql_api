<?php

namespace App\Controller;

use GraphQL\GraphQL as GraphQLBase;
use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use GraphQL\Type\Schema;
use GraphQL\Type\SchemaConfig;
use RuntimeException;
use Throwable;


use App\Type\QueryType;
use App\Type\MutationType;



class GraphQL {
    static public function handle() {
        
        try {
            $queryType = new QueryType();
        
            $mutationType = new MutationType();
        
            // See docs on schema options:
            // https://webonyx.github.io/graphql-php/schema-definition/#configuration-options
            $schema = new Schema(
                (new SchemaConfig())
                ->setQuery($queryType)
                ->setMutation($mutationType)
            );
        
            $rawInput = file_get_contents('php://input');
            if ($rawInput === false) {
                throw new RuntimeException('Failed to get php://input');
            }
            
            $input = json_decode($rawInput, true);
            $query = $input['query'];
            $variableValues = $input['variables'] ?? null;
            
        
            $rootValue = ['prefix' => 'You said: '];
            
            $result = GraphQLBase::executeQuery($schema, $query, $rootValue, null, $variableValues);
            // dd($result);
            $output = $result->toArray();
        } catch (Throwable $e) {
            
            $output = [
                'error' => [
                    'message' => $e->getMessage(),
                ],
            ];
        }

        header('Content-Type: application/json; charset=UTF-8');
        return json_encode($output);
    }
}