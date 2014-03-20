<?php 
class List extends AppModel
{
	static $belong_to = array(
		array('author', 'class_name' => 'User')
	);

	static $has_many = array(
		array('list_items')
	);
}