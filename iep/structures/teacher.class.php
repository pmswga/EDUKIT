<?php
    declare(strict_types = 1);
	namespace IEP\Structures;
    
	require_once "user.class.php";

	class Teacher extends User
	{
		private $info;
		private $subjects;
		private $tests;
		
		function __construct($user, $info)
		{
			parent::__construct($user->sn, $user->fn, $user->pt, $user->email, $user->password, $user->typeUser);
			$this->info = $info;
			$this->subjects = array();
		}
	
		public function setSubjects(array $subjects)
		{
			$this->subjects = $subjects;
		}
		
		public function setTests($tests)
		{
			$this->tests = $tests;
		}
	
		public function getInfo() : string
		{
			return $this->info;
		}
		
		public function getSubjects() : array
		{
			return $this->subjects;
		}
		
		public function getTests() : array
		{
			return $this->tests();
		}
	}
?>