<html>
	<head>
		<title> Categories List</title>
	</head>
	<body>
	<h1>List of categories</h1>

	<?php
	\koolreport\widgets\koolphp\Table::create(array(
		"dataSource"=>$this->dataStore("result")
	));
	?>
	</body>

</html>