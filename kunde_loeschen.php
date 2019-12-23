<?php
 require_once("../lib/smarty-3.1.33/libs/Smarty.class.php");
 
 $smarty=new Smarty();
 require_once("class.kunde.php");
 
 $smarty->assign("id",filter_input(INPUT_GET,"id"));
 try
 {
	$kunde=new Kunde(filter_input(INPUT_GET,"id"));
	$kunde->remove();
	$smarty->display("kunde_geloescht.tpl");
 }
 catch(Exception $e)
 {
	 $smarty->assign("error",$e->getMessage());
	 $smarty->display("kunde_geloescht_error.tpl");
 }
 /*$stmt=$db->prepare("DELETE FROM kunde WHERE id=:id");
 $stmt->bindValue(":id",filter_input(INPUT_GET,"id"));
 if($stmt->execute())
 {
	$smarty->assign("id",filter_input(INPUT_GET,"id"));
	$smarty->display("kunde_geloescht.tpl");
 }
 else
 {
	 echo(htmlentities("Der Datensatz $id konnte nicht gel&ouml;scht werden!"));
 }*/
