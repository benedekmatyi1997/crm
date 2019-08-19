<?php

require_once("setup.inc.php");

$smarty=new Smarty();
$stmt=$db->prepare("INSERT INTO angebotkunde(angebotnummer,terminstart,terminend,datum,bearbeiterID,kundeID)".
				   " VALUES (:angebotnummer,:terminstart,:terminend,NOW(),:bearbeiterID,:kundeID)");
$stmt->bindValue(":angebotnummer",filter_input(INPUT_GET,"angebotnummer"));
$stmt->bindValue(":terminstart",filter_input(INPUT_GET,"terminstart"));
$stmt->bindValue(":terminend",filter_input(INPUT_GET,"terminend"));
$stmt->bindValue(":bearbeiterID",filter_input(INPUT_GET,"bearbeiter"));
$stmt->bindValue(":kundeID",filter_input(INPUT_GET,"kunde"));
$error="";
$id="";
if($stmt->execute())
{
	$id=$db->lastInsertId();
	$stmt=$db->prepare("INSERT INTO angebotposition (KundeID,BausteinID) VALUES (:kundeID,:bausteinID)");
	$stmt->bindValue(":kundeID",$id);
	echo("x".PHP_EOL);
	print_r($_GET);
	echo("y".print_r(filter_input(INPUT_GET,"angebotbausteine"),true)."y".print_r(filter_input(INPUT_GET,"angebotbausteine[]"),true)."y");
	echo("y".print_r(filter_input(INPUT_GET,"angebotbausteine"),true)."y".print_r(filter_input(INPUT_GET,"angebotbausteine[]"),true)."y");
	echo("x".PHP_EOL);
	if(isset($_GET["angebotbausteine"]) && is_array($_GET["angebotbausteine"]) && count($_GET["angebotbausteine"]))
	{
		
		foreach($_GET["angebotbausteine"] as $angebotbaustein)//TODO: stackoverflow fragen wegen filter_input multiple select
		{
			$stmt->bindValue(":bausteinID",$angebotbaustein);
			if(!$stmt->execute())
			{
				$error.=$stmt->errorInfo()[2].PHP_EOL;
			}
		}
	}
	if(!strlen($error))
	{
		$stmt=$db->prepare("SELECT * FROM kunde WHERE id=:kundeID");
		$stmt->bindValue(":kundeID",$id);
		if($stmt->execute())
		{
			$kunde=$stmt->fetchAll();
			$smarty->assign("kunde",$kunde);
			$stmt=$db->prepare("SELECT * FROM angebotbaustein WHERE id IN(:bausteinIDs)");
			$stmt->bindValue(":bausteinIDs",implode(",",$_GET["angebotbausteine"]));
			if($stmt->execute())
			{
				$bausteine=$stmt->fetchAll();
				$smarty->assign("bausteine",$bausteine);
				$gesamtsumme=$gesamtmwst=0;
				foreach($bausteine as $baustein)
				{
					$gesamtsumme+=$baustein->Nettopreis;
					$gesamtmwst+=$baustein->Nettopreis*$baustein->MwSt/100.;
				}
				$smarty->assign("gesamtsumme",$gesamtsumme);
				$smarty->assign("gesamtmwst",$gesamtmwst);
				$smarty->assign("durchschnittmwst",$gesamtmwst/(double)$gesamtsumme*100);
			}
			else
			{
				$error.=$stmt->errorInfo()[2].PHP_EOL;
			}
		}
		else
		{
			$error.=$stmt->errorInfo()[2].PHP_EOL;
		}
	}
}
else
{
	$error=$stmt->errorInfo()[2].PHP_EOL;
}

$smarty->assign("id",$id);
if(!strlen($error))
{
	$smarty->assign("angebotnummer",filter_input(INPUT_GET,"angebotnummer"));
	$smarty->assign("datum",date("d/m/Y"));
	$smarty->assign("terminstart",filter_input(INPUT_GET,"terminstart"));
	$smarty->assign("terminend",filter_input(INPUT_GET,"terminend"));
	$smarty->assign("bearbeiterID",filter_input(INPUT_GET,"bearbeiter"));
	$smarty->assign("kundeID",filter_input(INPUT_GET,"kunde"));
	$smarty->display("angebot_erfolgreich.tpl");
}
else
{
	$smarty->assign("error",$error);
	$smarty->display("angebot_fehler.tpl");
}