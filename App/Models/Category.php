<?php 
class Category extends AppModel
{
	static $belong_to = array();
	
	static $has_many = array(
		array('products')
	);
}