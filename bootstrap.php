<?php

require 'vendor/autoload.php';

$config = (require 'config.php');
$db_config = $config['database']; 


$db = new PDO(
    'sqlite:db.sqlite',
    null,
    null,
    [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]
);

require 'src/Entity/Product.php';
// dd("salam");

/**
 * pdo sadece connection ucun bir seydir
 * menim classlarim olacaq hansiki databasedeki tableleri represent edecek 
 * pdo bootstrap.php de olacaq
 * vendor autoload.php de olacaq
 * 
 */