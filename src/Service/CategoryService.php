<?php

namespace App\Service;

use App\Repository\CategoryRepository;

class CategoryService
{
    static public function all()
    {
        return CategoryRepository::all();
    }

    static public function find($id)
    {
        return CategoryRepository::find($id);
    }

    static public function get_products($id)
    {
        return CategoryRepository::get_products($id);
    }
    
    static public function findByName($name)
    {
        return CategoryRepository::findByName($name);
    }
}