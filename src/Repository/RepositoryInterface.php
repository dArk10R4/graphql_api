<?php

namespace App\Repository;

interface RepositoryInterface 
{
    public static function all();
    public static function find($id);
    // public function create($data);
    // public function update($id, $data);
    // public function delete($id);    
    
}