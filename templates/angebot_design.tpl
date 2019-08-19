{include file="header.tpl" title="Angebot"}
<img src="header.jpg" alt="Permanent Make Up Academy<br>...">
<div style="position:60%;">
<strong>Kunde:</strong>{$kunde.Name}<br />
<strong>Adresse:</strong><div>{$kunde.Adresse}</div><br />
<strong>Telefon:</strong>{$kunde.Telefon}<br/>
<strong>E-mail:</strong>{$kunde.Email}<br/>
<strong>Datum:</strong>{$datum}<br/>
<strong>Rechnung Nummer:</strong>{$angebotnummer}<br/>

<table>
	<tr>
		<th>Pos</th>
		<th>Beschreibung</th>
		<th>Einzelpreis &euro;</th>
		<th>Menge</th>
		<th>Summe &euro;</th>
	</tr>
	{foreach $bausteine as $baustein}
	<tr>
		<td>&nbsp;</td>
		<td>{$baustein.Beschreibung}</td>
		<td>{$baustein.Nettopreis}</td>
		<td>1</td>
		<td>{$baustein.Nettopreis}</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	{/foreach}
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td class="gesamt">Gesamt Netto</td>
		<td class="gesamt">:</td>
		<td class="gesamt">{$gesamtsumme} &euro;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td class="gesamt">USt. {$durchschnittmwst}%</td>
		<td class="gesamt">:</td>
		<td class="gesamt">{$gesamtmwst} &euro;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td class="gesamt">Zu zahlen</td>
		<td class="gesamt">:</td>
		<td class="gesamt">{$gesamtmwst+$gesamtsumme} &euro;</td>
	</tr>
</table>
<div style="text-align:center;">
Bankverbindung<br/>  
 
Raiffeisen Bank<br/>
Name: Kamila Stetsenko<br/>
IBAN: AT05 3200 0000 1277 7124<br/>
BIC: RLNWATWW 
</div>
</body>
</html>