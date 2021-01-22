<?php

Class CategoriesReport extends \koolreport\KoolReport
{
	use \koolreport\clients\Bootstrap;
	//Create settings()
	protected function settings()
	{
		return array(
			"dataSources"=>array(
				"navitec"=>array(
					"connectionString"=>"mysql:host=localhost;dbname=navitec",
					"username"=>"root",
					"password"=>"",
					"charset"=>"utf8"
				)
			)
		);
	}
	//Setup report
	protected function setup()
	{
		$this->src("navitec")
		->query("
			SELECT *
			FROM parent
			LIMIT 10
		")
		->pipe($this->dataStore("result"));
	}
}
?>