{include file="header.tpl" title="Bearbeiter eingabe"}
	<h1>Bearbeiter Eingabe</h1>
	<div style="float:right;"><img src="http://localhost/phpmyadmin/themes/pmahomme/img/logo_left.png"></div>
<form action="bearbeiter_erstellen.php" method="GET">
<table>
	<tr>
		<td>Name</td>
		<td><input type="text" name="name" /></td>
	</tr>
	<tr>
		<td>Email</td>
		<td><input type="email" name="email" /></td>
	</tr>
	<tr>
		<td>Telefonnummer</td>
		<td><input type="text" name="telefon" /></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="Speichern" /></td>
	</tr>
</table>
</form>
{include file="footer.tpl"}