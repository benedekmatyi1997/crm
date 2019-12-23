 <?php
 print_r($_GET);
 print("Hallo ".filter_input(INPUT_GET,"name")."! ");
 print("Deine Email-Adresse ist ".filter_input(INPUT_GET,"email",FILTER_SANITIZE_EMAIL)."! ");
 print("Du bist ".filter_input(INPUT_GET, "text")." Jahre alt!");
 print(filter_input(INPUT_GET, "search"));
 ?>