 {include file="header.tpl" title="Bearbeiter nicht erfolgreich erstellt"}
 <body>
 Der Bearbeiter mit der ID {$id} wurde nicht erfolgreich durchgefuehrt!
 Fehlermeldung: {$error}
 <table>
 	<tr>
		<th>Name:</th>
		<td>{$name}</td>
	</tr>
	<tr>
		<th>Email:</th>
		<td>{$email}</td>
	</tr>
	<tr>
		<th>Telefonnummer:</th>
		<td>{$telefon}</td>
	</tr>
	
 </table>
 {include file="footer.tpl"}