<?php
//require_once("setup.inc.php");
require_once("../lib/smarty-3.1.33/libs/Smarty.class.php");
require_once("class.kunde.php");

$smarty=new Smarty();
//$smarty->default_modifiers=array("htmlentities");
try
{
	$results=Kunde::getAllKunden();
	$smarty->assign("data",$results);
	$smarty->display("kunden_uebersicht.tpl");
}
catch(Exception $e)
{
	echo("Fehler:".$e->getMessage());
}
 /*
 $stmt=$db->prepare("SELECT * FROM kunde");
 if($stmt->execute())
 {
	$results=$stmt->fetchAll();
	$smarty->assign("data",$results);
	$smarty->display("kunden_uebersicht.tpl");
 }
 else
 {
   echo("Fehler:".$stmt->errorInfo());
 }
 */
 ?>