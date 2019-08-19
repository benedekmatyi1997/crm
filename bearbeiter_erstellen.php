<?php
require_once("setup.inc.php");
$smarty=new Smarty();
$stmt=$db->prepare("INSERT INTO bearbeiter(telefon,email,name) VALUES (:telefon,:email,:name)");

//("INSERT INTO bearbeiter(telefon,email,name) VALUES ($telefon,$email,$name)");
$stmt->bindValue(":telefon",filter_input(INPUT_GET,"telefon"));
$stmt->bindValue(":email",filter_input(INPUT_GET,"email"));
$stmt->bindValue(":name",filter_input(INPUT_GET,"name"));
$smarty->assign("telefon",filter_input(INPUT_GET,"telefon"));
$smarty->assign("email",filter_input(INPUT_GET,"email"));
$smarty->assign("name",filter_input(INPUT_GET,"name"));

if($stmt->execute())
{
	$id=$db->lastInsertId();
	$smarty->assign("id",$id);
	
	$smarty->display("bearbeiter_erstellt.tpl");
}
else
{
	$smarty->assign("error",$stmt->errorInfo()[2]);
	$smarty->display("bearbeiter_fehler.tpl");
}
?>