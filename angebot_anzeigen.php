<?php
require_once("setup.inc.php");
$smarty=new Smarty;
/*$stmt=$db->prepare("SELECT ak.*,".
				   "k.Name as Kunde_Name,k.Telefon as Kunde_Telefon,k.Email as Kunde_Email,".
				   "b.Name as Bearbeiter_Name,b.Telefon as Bearbeiter_Telefon,b.Email as Bearbeiter_Email".
				   "FROM angebotkunde ak". 
				   "LEFT JOIN kunde k ON ak.KundeID=k.ID ".
				   "LEFT JOIN bearbeiter b ON ak.BearbeiterID ".
				   "WHERE ak.ID=:id");*/
$stmt=$db->prepare("SELECT * FROM angebotdetails WHERE ID=:id");
$stmt->bindValue(":id",filter_input(INPUT_GET,"id"));
if($stmt->execute())
{
	$angebot=$stmt->fetch();
	print_r($angebot);
	$smarty->assign("angebot",$angebot);
	$stmt=$db->prepare("SELECT ab.* FROM angebotposition ap ".
					   "LEFT JOIN angebotbaustein ab ON ap.BausteinID=ab.ID ".
					   "WHERE ap.angebotID=:id");
	$stmt->bindValue(":id",filter_input(INPUT_GET,"id"));
	if($stmt->execute())
	{
		$bausteine=$stmt->fetchAll();
		print_r($bausteine);
		$smarty->assign("bausteine",$bausteine);
		$smarty->display("angebot_anzeigen.tpl");
	}
}
else
{
	$smarty->assign("error",$stmt->errorInfo()[2]);
	$smarty->display("angebot_anzeigen_fehler.tpl");
}