<?php
require '../lib/vendor/autoload.php';

use Spipu\Html2Pdf\Html2Pdf;

require_once("setup.inc.php");

$smarty=new Smarty;

$html2pdf = new Html2Pdf('P', 'A4', 'fr');
//<!--<link rel="stylesheet" type="text/css" href="css/style.css">-->
$html2pdf->setTestTdInOnePage(false);
for($i=1;$i<=10;$i++)
{
	$smarty->assign("i",$i);
	$html2pdf->writeHTML($smarty->fetch("pdf_page.tpl"));
}
//$html2pdf->writeHTML("<h1>HelloWorld</h1>This is my first test");
//$html2pdf->writeHTML("</page>");
$html2pdf->output();