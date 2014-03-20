<?php 

$app->get('/', function () use ($app)
{
	return $app->render('start.html.twig');
});

 ?>