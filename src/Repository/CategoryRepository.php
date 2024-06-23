<?php

namespace App\Repository;
use App\Entity\Category;
use App\Entity\Product;

class CategoryRepository extends BaseRepository
{
    protected static $model = Category::class;

    public static function get_products($id)
    {
        if ($id == -1) {
            return Product::all();
        }
        return Category::get_products($id);
    }

    public static function findByName($name)
    {
        if ($name == "all") {
            return [
                "name" => "all",
                "id" => -1,
            ];
        }
        return Category::findByName($name);
    }
}