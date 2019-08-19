{include file="header.tpl" title="Kunden&uuml;bersicht"}
	<table>
	<tr>
		<th>Loeschen</th>
		<th>Name</th>
		<th>Telefon</th>
		<th>Email</th>
	</tr>
	{foreach $data as $dataset}
	<tr>
		<td><a href="delete.php?id={$dataset.ID}">X</a></td>
		<td>{$dataset.Name|htmlentities}</td>
		<td>{$dataset.Telefon|htmlentities}</td>
		<td>{$dataset.Email|htmlentities}</td>
	</tr>
	{/foreach}
	</table>
 {include file="footer.tpl"}