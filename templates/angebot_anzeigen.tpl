{include file="header.tpl" title="Bearbeiter erfolgreich erstellt"}
 <table>
	<tr>
		<th>Kunde Name:</th>
		<td>{$angebot.Kunde_Name}</td>
	</tr>
	<tr>
		<th>Kunde Telefon:</th>
		<td>{$angebot.Kunde_Telefon}</td>
	</tr>
	<tr>
		<th>Kunde Email:</th>
		<td>{$angebot.Kunde_Email}</td>
	</tr>
	
	<tr>
		<th>Bearbeiter Name:</th>
		<td>{$angebot.Bearbeiter_Name}</td>
	</tr>
	<tr>
		<th>Bearbeiter Telefon:</th>
		<td>{$angebot.Bearbeiter_Telefon}</td>
	</tr>
	<tr>
		<th>Bearbeiter Email:</th>
		<td>{$angebot.Bearbeiter_Email}</td>
	</tr>
	
	<tr>
		<th>Datum:</th>
		<td>{$angebot.Datum}</td>
	</tr>
	<tr>
		<th>Angebot Nummer:</th>
		<td>{$angebot.AngebotNummer}</td>
	</tr>
	<tr>
		<th>Termin Start:</th>
		<td>{$angebot.TerminStart}</td>
	</tr>
	<tr>
		<th>Termin End:</th>
		<td>{$angebot.TerminEnd}</td>
	</tr>
	
 </table>
 
 <table>
	<tr>
		<th>Name</th>
		<th>Beschreibung</th>
		<th>Netto-Preis</th>
		<th>MwSt</th>
	</tr>
	{foreach $bausteine as $baustein}
	<tr>
		<td>{$baustein.name}</td>
		<td>{$baustein.Beschreibung}</td>
		<td>{$baustein.Nettopreis}</td>
		<td>{$baustein.MwSt}</td>
	</tr>
	{foreachelse}
	<tr>
		<td colspan="4" style="text-align:center;">Keine Bausteine verknüpft mit diesem Angebot!</td>
	</tr>
	{/foreach}
 </table>
 {include file="footer.tpl"}