<?php

require_once "../NaviTEC_Reports/vendor/autoload.php";

require_once "categoriesReport.php";

$report = new CategoriesReport;

$report->run()->render();
?>