<?php

namespace App\Repository;

abstract class BaseRepository implements RepositoryInterface
{
    protected static $model;
    public static function all()
    {
        return static::$model::all();
    }

    public static function find($id)
    {
        return static::$model::find($id);
    }
}