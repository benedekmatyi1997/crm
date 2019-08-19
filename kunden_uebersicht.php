 <?php
 require_once("setup.inc.php");
 
 $smarty=new Smarty();
 //$smarty->default_modifiers=array("htmlentities");
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
 ?>