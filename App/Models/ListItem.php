<?php 
class ListItem extends AppModel
{
	static $belong_to = array(
		array('list'),
		array('price')
	);
}