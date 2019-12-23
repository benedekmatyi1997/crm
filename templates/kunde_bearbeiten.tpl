{include file="header.tpl" title="Kundeneingabe"}
	<h1>Kundeneingabe</h1>
	<div style="float:right;"><img src="http://localhost/phpmyadmin/themes/pmahomme/img/logo_left.png"></div>
<form action="kunde_bearbeiten_schreiben.php" method="POST">
<input type="hidden" name="id" value="{$dataset.Id}" />
<table>
	<tr>
		<td>Name</td>
		<td><input type="text" name="name" value="{$dataset.Name}" /></td>
	</tr>
	<tr>
		<td>Email</td>
		<td><input type="email" name="email" value="{$dataset.Email}"/></td>
	</tr>
	<tr>
		<td>Telefonnummer</td>
		<td><input type="text" name="telefon"  value="{$dataset.Telefon}"  /></td>
	</tr>
	<tr>
		<td>Adresse</td>
		<td><input type="text" name="adresse"  value="{$dataset.Adresse}"  /></td>
	</tr>	
	<tr>
		<td colspan="2"><input type="submit" value="Speichern" /></td>
	</tr>
</table>
</form>
{include file="footer.tpl"}