<?php
$db['db_host']="localhost";
$db['db_user']="root";
$db['db_pass']="";
$db['db_name']="sms";

foreach ($db as $key => $value){
	define(strtoupper ($key), $value);
}
$kdb = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
if (!$kdb) {
    echo('Tidak dapat terkoneksi ke Database Engine MySQL: ' . mysqli_connect_error());

	}
?>
