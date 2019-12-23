<?php
require_once("class.kunde.php");
require_once("smarty.inc.php");
$kunde=new Kunde(filter_input(INPUT_POST,"id",FILTER_VALIDATE_INT));
$kunde->setValues(filter_input(INPUT_POST,"telefon"),
                  filter_input(INPUT_POST,"email",FILTER_VALIDATE_EMAIL),
				  filter_input(INPUT_POST,"name"),
				  filter_input(INPUT_POST,"adresse"));
try
{
	$kunde->update();
}
catch(Exception $e)
{
	$error=$e->getMessage();
}
$smarty=new Smarty();
$smarty->assign("dataset",$kunde->get_as_array());
if(!strlen($error))
{
	$smarty->display("kunde_bearbeiten_erfolgreich.tpl");
}
else
{
	$smarty->display("kunde_bearbeiten_fehler.tpl");
}