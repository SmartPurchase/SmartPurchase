<?php 
class Price extends AppModel
{
	static $belong_to = array(
		array('stablishment'),
		array('product'),
		array('author', 'class_name' => 'User')
	);

	static $has_many = array(
		array('list_items')
	);
}