<?php
require_once("setup.inc.php");
$smarty=new Smarty();
$stmt=$db->prepare("SELECT ID,Name FROM kunde");
$error="";
if($stmt->execute())
{
	$kunden=$stmt->fetchAll();
	$smarty->assign("kunden",$kunden);
	$stmt=$db->prepare("SELECT ID,Name FROM bearbeiter");
	if($stmt->execute())
	{
		$bearbeiter=$stmt->fetchAll();
		$smarty->assign("bearbeiter",$bearbeiter);
		$stmt=$db->prepare("SELECT ID,Name FROM angebotbaustein");
		if($stmt->execute())
		{
			$angebotbausteine=$stmt->fetchAll();
			$smarty->assign("angebotbausteine",$angebotbausteine);
			$smarty->display("angebot_neu.tpl");
		}
		else
		{
			$error=$stmt->errorInfo()[2];
		}
	}
	else
	{
		$error=$stmt->errorInfo()[2];
	}
}
else
{
	$error=$stmt->errorInfo()[2];
}
if(strlen($error))
{
	$smarty->assign("error",$error);
	$smarty->display("angebot_error.tpl");
}