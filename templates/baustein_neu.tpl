{include file="header.tpl" title="Baustein Eingabe"}
	<h1>Bausteineingabe</h1>
	<form action="baustein_erstellen.php" method="GET">
<table>
	<tr>
		<td>Name</td>
		<td><input type="text" name="name" /></td>
	</tr>
	<tr>
		<td>Beschreibung</td>
		<td><textarea name="beschreibung"></textarea></td>
	</tr>
	<tr>
		<td>Nettopreis</td>
		<td><input type="text" name="nettopreis" /></td>
	</tr>
	<tr>
		<td>Mehrwertsteuer</td>
		<td><input type="text" name="mwst" /></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="Speichern" /></td>
	</tr>
</table>
</form>
{include file="footer.tpl"}