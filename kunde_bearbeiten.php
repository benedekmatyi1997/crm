<?php
require_once("class.kunde.php");
require_once("smarty.inc.php");
$kunde=new Kunde(filter_input(INPUT_GET,"id",FILTER_VALIDATE_INT));
$smarty=new Smarty();
$smarty->assign("dataset",$kunde->get_as_array());
$smarty->display("kunde_bearbeiten.tpl");