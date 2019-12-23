 <?php
require_once("setup.inc.php");

print_r($_GET);
$stmt=$db->prepare("INSERT INTO angebotbaustein(Name,Beschreibung,Nettopreis,mwst) VALUES (:name,:beschreibung,:nettopreis,:mwst)");
$stmt->bindValue(":name",filter_input(INPUT_GET,"name"));
$stmt->bindValue(":beschreibung",filter_input(INPUT_GET,"beschreibung"));
$stmt->bindValue(":nettopreis",filter_input(INPUT_GET,"nettopreis"));
$stmt->bindValue(":mwst",filter_input(INPUT_GET,"mwst"));
if($stmt->execute())
{
	//TODO:tpl erstellen
	echo("Datensatz erfolgreich &euro;ingef&uuml;gt!");
}
else
{
	//TODO:tpl erstellen
	echo("Fehler:<br />");
	print_r($stmt->errorInfo()[2]);
}
?>