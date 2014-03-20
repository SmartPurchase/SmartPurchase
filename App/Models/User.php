<?php 
class User extends AppModel
{
	static $before_create = array(
		'before'
	);

	static $has_many = array(
		array('lists'),
		array('prices')
	);
	static $validates_presence_of = array(
		array('name'),
		array('email')
	);

	static $validates_uniqueness_of = array(
		array('email')
	);
	
	static $validates_format_of = array(
 		array('email', 'with' => '/^[^0-9][A-z0-9_]+([.][A-z0-9_]+)*[@][A-z0-9_]+([.][A-z0-9_]+)*[.][A-z]{2,4}$/']),
 		array('password', 'with' => '/^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*$/', 'message' => 'É muito fraco!')
	);

	public function before()
	{
		$this->created = date('Y-m-d H:i:s');
	}
}