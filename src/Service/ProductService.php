<?php

namespace App\Service;

use App\Repository\ProductRepository;

class ProductService
{
    static public function all()
    {

        return ProductRepository::all();
    }

    static public function find($id)
    {
        return ProductRepository::find($id);
    }

    static public function get_category($id)
    {
        return ProductRepository::get_category($id);
    }

    static public function get_gallery_urls($id)
    {

        $gallery = ProductRepository::get_gallery($id);

        $gallery_urls = [];

        foreach ($gallery as $image) {
            $gallery_urls[] = $image['url'];
        }

        return $gallery_urls;
    }

    static public function get_prices($id)
    {
        return ProductRepository::get_prices($id);
    }

    static public function get_currency($currency_id)
    {
        return ProductRepository::get_currency($currency_id);
    }

    static public function filter_by_category($category_id)
    {
        // return ProductRepository::filter_by_category($category_id);
    }
}
