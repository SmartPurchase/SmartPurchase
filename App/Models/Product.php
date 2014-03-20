<?php 
class Product extends AppModel
{
	static $belong_to = array(
		array('category')
	);
	
	static $has_many = array(
		array('prices')
	);
}