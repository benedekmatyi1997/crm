{include file="header.tpl" title="Kunden&uuml;bersicht"}
	<table>
	<tr>
		<th>L&ouml;schen</th>
		<th>Name</th>
		<th>Telefon</th>
		<th>Email</th>
		<th>Bearbeiten</th>
	</tr>
	{foreach $data as $dataset}
	<tr>
		<td><a href="kunde_loeschen.php?id={$dataset.ID}">X</a></td>
		<td>{$dataset.Name|htmlentities}</td>
		<td>{$dataset.Telefon|htmlentities}</td>
		<td>{$dataset.Email|htmlentities}</td>
		<td><a href="kunde_bearbeiten.php?id={$dataset.ID}">Bearbeiten</a></td>
	</tr>
	{/foreach}
	</table>
 {include file="footer.tpl"}