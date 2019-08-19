<?php

require '../lib/vendor/autoload.php';

use Spipu\Html2Pdf\Html2Pdf;

require_once("setup.inc.php");

$smarty=new Smarty;


$html2pdf = new \Spipu\Html2Pdf\Html2Pdf('P', 'A4', 'en');
$html2pdf->writeHTML($smarty->fetch("pdf_page_test.tpl")); 
$html2pdf->Output();