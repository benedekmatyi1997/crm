<page backtop="50mm" backbottom="7mm" backleft="5mm" backright="5mm">
<link rel="stylesheet" type="text/css" href="css/style.css">
<page_header><img src="img/header.jpg" alt="Permanent Make Up Academy..." style="max-width:100%"></page_header>

<page_footer><div style="text-align:center;font-weight:bold;">Bankverbindung<br />
<br />  
Raiffeisen Bank Name: Kamila Stetsenko<br /> 
IBAN: AT05 3200 0000 1277 7124<br /> 
BIC: RLNWATWW</div>
</page_footer>
<div class="kundendaten">
<b>Kunde:</b> {$angebot.Kunde_Name}<br />
<b>Adresse:</b>{$angebot.Kunde_Adresse}<br />
<b>Telefon:</b> {$angebot.Kunde_Telefon}<br />
<b>E-mail:</b> {$angebot.Kunde_Email}<br />
<b>Datum:</b> {$angebot.Datum}<br />
<b>Angebot Nr.:</b> {$angebot.AngebotNummer}
</div>
<br /><br /><br /><br /><br /><br /><br /><br />

<table style="width: 90%;">
<tr>
<td style="width: 100%;">
<table class="ourtable">
	<tr class="header">
		<th style="width: 5%;">Pos</th>
		<th style="width: 38%;">Beschreibung</th>
		<th style="width: 19%;">Einzelpreis &euro;</th>
		<th style="width: 19%;">Menge</th>
		<th style="width: 19%;">Summe &euro;</th>
	</tr>
	{foreach $bausteine as $baustein}
	<tr style="width: 100%;">
		<td style="height: 100%;">&nbsp;</td>
		<td style="width: 20%;">{$baustein.Beschreibung}</td>
		<td>Kurs&nbsp;Preis:  Netto {$baustein.Nettopreis}  &euro;</td>
		<td>1</td>
		<td>{$baustein.Nettopreis} &euro;</td>
	</tr>
	<tr style="width: 100%;">
		<td>&nbsp;</td>
		<td style="width: 20%;">&nbsp;</td>
		<td>Gesamt-Netto</td>
		<td>:</td>
		<td>{$baustein.Nettopreis} &euro;</td>
	</tr>
	<tr style="width: 100%;">
		<td>&nbsp;</td>
		<td style="width: 20%;">&nbsp;</td>
		<td>USt. {$baustein.MwSt}%</td>
		<td>:</td>
		<td>{$baustein.MwStSumme} &euro;</td>
	</tr>
	<tr style="width: 100%;">
		<td>&nbsp;</td>
		<td style="width: 20%;">&nbsp;</td>
		<td>Zu zahlen</td>
		<td>:</td>
		<td>{$baustein.Bruttopreis} &euro;</td>
	</tr>
	{/foreach}
	<tr style="width: 100%;">
		<td>&nbsp;</td>
		<td style="width: 20%;">&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr style="width: 100%;border-bottom: solid 1px black;">
		<td>&nbsp;</td>
		<td style="width: 20%;">&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
</td>
</tr>
</table>
</page>