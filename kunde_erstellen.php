<?php
require_once("setup.inc.php");

print_r($_GET);
$stmt=$db->prepare("INSERT INTO kunde(telefon,email,name) VALUES (:telefon,:email,:name)");
$stmt->bindValue(":telefon",filter_input(INPUT_GET,"telefon"));
$stmt->bindValue(":email",filter_input(INPUT_GET,"email"));
$stmt->bindValue(":name",filter_input(INPUT_GET,"name"));
if($stmt->execute())
{
	echo("Datensatz erfolgreich &euro;ingef&uuml;gt!");
}
else
{
	echo("Fehler:".$stmt->errorInfo()[2]);
}
?>
