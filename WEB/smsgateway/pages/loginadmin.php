<?php


session_start();

//memanggil file koneksi
include('./includes/koneksi.php');


//mengambil data  dari form
$uname=$_POST['uname'];
$pass=$_POST['password'];
//$pas=($pass);

//membandingkan isi form dengan database
$sql="select * from t_admin where username='$uname' and password='$pass'";

//mengambil data dari tabel
$hasil=mysqli_query($kdb, $sql)or die(mysql_error());
if(mysqli_num_rows($hasil)==1){
	$_SESSION['uname']=$uname;
	header("location:./index.php");
}

else{?>
	<script type='text/javascript'>
	alert('Username atau Password salah, Silahkan cek kembali');
	window.location='../index.php';
	</script>
	<?php
	//header("location:../index.php?pesan=gagal")or die(mysql_error());
	// mysql_error();
}


//set variable session_star
//$_SESSION['uname']=$uname;


//check koneksi
	
?>