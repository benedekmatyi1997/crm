{include file="header.tpl" title="Neues Angebot erstellen"}
<form action="angebot_erstellen.php" method="GET">
<table>
	<tr>
		<td>Angebotsnummer</td>
		<td><input type="text" name="angebotnummer" /></td>
	</tr>
	<tr>
		<td>Termin-Start</td>
		<td><input type="date" name="terminstart" /></td>
	</tr>
	<tr>
		<td>Termin-Ende</td>
		<td><input type="date" name="terminend" /></td>
	</tr>
	<tr>
		<td>Kunde:</td>
		<td><select name="kunde">
			{foreach $kunden as $kunde}
				<option value="{$kunde.ID}">{$kunde.Name}</option>
			{/foreach}
			</select>
		</td>
	</tr>
	
	<tr>
		<td>Bearbeiter:</td>
		<td><select name="bearbeiter">
			{foreach $bearbeiter as $bearbeiter_einzel}
				<option value="{$bearbeiter_einzel.ID}">{$bearbeiter_einzel.Name}</option>
			{/foreach}
			</select>
		</td>
	</tr>
	
	<tr>
		<td>Angebotsbausteine:</td>
		<td><select name="angebotbausteine[]" multiple size="5">
			{foreach $angebotbausteine as $angebotbaustein}
				<option value="{$angebotbaustein.ID}">{$angebotbaustein.Name}</option>
			{/foreach}
			</select>
		</td>
	</tr>	
	<tr>
		<td colspan="2"><input type="submit" value="Speichern" /></td>
	</tr>
</table>
</form>
{include file="footer.tpl"}