<?php 
session_start();
error_reporting(E_ALL);

define('DS', DIRECTORY_SEPARATOR);

define('ROOT', dirname(dirname(__FILE__)));
define('APP', ROOT . DS . 'App');
define('VENDOR', ROOT . DS . 'vendor');
define('PUBLIC_HTML', ROOT . DS . 'public_html');
define('THEME', APP . DS . 'Views' . DS . 'default');
define('HELPERS', APP.DS.'Helpers');
define('ROUTES', APP.DS.'Routes');
define('MODELS', APP.DS.'Models');

require VENDOR . DS . 'autoload.php';
require HELPERS . DS . 'Toolkit.php';

\ActiveRecord\Config::initialize(function($cfg) {
	$cfg->set_model_directory( MODELS );
	$cfg->set_connections([
		'development' => 'mysql://root:123@localhost/smartpurchase'
	]);
});

$app = new \Slim\Slim([
	'templates.path' => THEME,
	'view' => new \Slim\Views\Twig()
]);

\Slim\Route::setDefaultConditions([
	'id' => '[0-9]+'
]);

foreach ( glob(ROUTES.DS.'*') as $route) 
	require ROUTES.DS.basename($route);

$app->run();