<?php

namespace App\Repository;
use App\Entity\Product;
use App\Entity\Category;
use App\Entity\Currency;
use App\Entity\Gallery;
use App\Entity\Price;

class ProductRepository extends BaseRepository
{
    protected static $model = Product::class;

    public static function get_category($id)
    {
        return Category::find($id)['name'];
    }

    public static function get_gallery($product_id)
    {
        return Gallery::get_by_product_id($product_id);
    }

    public static function get_prices($id)
    {
        return Price::get_by_product_id($id);
    }

    public static function get_currency($currency_id)
    {
        return Currency::find($currency_id);
    }

}