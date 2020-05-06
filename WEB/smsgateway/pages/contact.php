<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"transaksi></script>
    <![endif]-->
	
<?php
$a = !empty($_GET['a']) ? $_GET['a'] : "reset";
$id_kontak = !empty($_GET['id']) ? $_GET['id'] : " "; 
$kdb = koneksidatabase();
$a = @$_GET["a"];
$sql = @$_POST["sql"];
switch ($sql) {
    case "insert": sql_insert(); break;
	case "update": sql_update(); break;
    case "delete": sql_delete(); break;
}
	?>


</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <?php
			include 'includes/navigasi.php';
			?>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Phonebooks</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
					<?php
							switch ($a) {
							case "reset" :  curd_read();   break;
							case "tambah":  curd_create(); break;
							case "edit"  :  curd_update($id_kontak); break;
							case "hapus"  :  curd_delete($id_kontak); break; 
							default : curd_read(); break;
						}
							mysqli_close($kdb);

							function curd_read()
							{
								$hasil = sql_select();
								$i=1;
						?>
                        <div class="panel-heading">
                            
                        </div>
                        <!-- /.panel-heading -->
						
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
											<th>No</th>
											<th>Nama </th>
											<th>No Telepon</th>
											<th>Nama Kecamatan</th>
											<th>Jabatan</th>
											<th>Publish</th>
											<th>Aksi</th>
										</tr>
                                    </thead>
									<?php
										while ($row = mysqli_fetch_array($hasil))
										{
											//$id_kontak = $row['id_kontak'];
											$id_keca = $row['id_kec'];
											global $kdb;
											$qry=" select nama_kec from t_kecamatan where id_kec='$id_keca' ";
											$slctpost = mysqli_query($kdb,$qry);
											$rwpst = mysqli_fetch_array($slctpost);
											$nama_kec = $rwpst['nama_kec'];
									?>
                                    <tbody>
										<tr>
											<td><?php echo $i; ?></td>
											<td><?php echo $row['nama']; ?></td>
											<td><?php echo $row['telepon']; ?></td>
											<td><?php echo $nama_kec; ?></td>
											<td><?php echo $row['jabatan']; ?></td>
											<td><?php echo $row['publish']; ?></td>
											<td>
												<a href="contact.php?a=edit&id=<?php echo $row['id_kontak'] ?>"class="btn btn-warning btn-xs" >UPDATE</a> 
												<a href="contact.php?a=hapus&id=<?php echo $row['id_kontak'] ?>" class="btn btn-danger btn-xs">DELETE</a>
											</td>
										</tr>
									</tbody>
									<?php
									$i++;
									}
									?>
									<a href="contact.php?a=tambah" class="btn btn-success btn-sm">CREATE</a>
                                </table>
								
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
						<?php
						mysqli_free_result($hasil);
						}
						?>
						<?php
						function forminsert($row)
						{
						?>
						        <table class="table table-striped table-bordered table-hover">
								<tr>
									<td width="200px">Nama</td>
									<td><input class="form-control" required="" type="text" name="nama" id="nama" value="<?php  echo trim($row["nama"]) ?>" >
									</td>
								</tr>
								
								<tr>
									<td width="200px">No Telepon</td>
									<td><input class="form-control" required="" type="number" id="replyNumber" data-bind="value:replyNumber" name="telepon" id="telepon" value="<?php  echo trim($row["telepon"]) ?>" >
									</td>
								</tr>
								
								<tr>
									<td width="200px">Nama Kecamatan</td>
									<td>
									
									
									<select class="form-control" type="text" name="nama_kec" id="nama_kec" >
									<?php
									global $kdb;
									$qry=" select nama_kec from t_kecamatan ";
											$slctpost = mysqli_query($kdb,$qry);
											while($rwpst = mysqli_fetch_array($slctpost))
											{
											
									?>
									
											<option><?php echo $rwpst['nama_kec'];?> </option>
									<?php
											}
											mysqli_free_result($slctpost);
									?>
									</select>
									</td>
								</tr>
								<tr>
									<td >Jabatan</td>
									<td >
									<?php  $status = str_replace('"', '"', trim($row["jabatan"])); ?>
									<input type="radio" name="jabatan" id="jabatan" value="P3A" <?php  if($status=='P3A' || $status=='') {echo "checked=\"checked\""; } else {echo ""; }  ?> />
									<label>P3A</label><br>
									<input type="radio" name="jabatan" id="jabatan" value="Ili-ili" <?php  if($status=='Ili-ili') {echo "checked=\"checked\""; } else {echo ""; } ?> />
									<label>Ili-ili</label>
									</td>
								</tr>
								<tr>
									<td >PUBLIKASI</td>
									<td >
									<?php  $status = str_replace('"', '"', trim($row["publish"])); ?>
									<input type="radio" name="publish" id="publish" value="1" <?php  if($status==1 || $status=='') {echo "checked=\"checked\""; } else {echo ""; }  ?> />
									<label>Dipublikasikan</label><br>
									<input type="radio" name="publish" id="publish" value="0" <?php  if($status==0) {echo "checked=\"checked\""; } else {echo ""; } ?> />
									<label>Tidak dipublikasikan</label>
									</td>
								</tr>
								</table>
						<?php
						}
						?>
						<?php
						function formeditor($row)
						{
						?>
						        <table class="table table-striped table-bordered table-hover">
								<tr>
									<td width="200px">Nama</td>
									<td><input class="form-control" required="" type="text" name="nama" id="nama" value="<?php  echo trim($row["nama"]) ?>" >
									</td>
								</tr>
								
								<tr>
									<td width="200px">No Telepon</td>
									<td><input class="form-control" required="" type="text" id="replyNumber" data-bind="value:replyNumber" name="telepon" id="telepon" value="<?php  echo trim($row["telepon"]) ?>" >
									</td>
								</tr>
								
								<tr>
									<td width="200px">Nama Kecamatan</td>
									<td>
									<?php  
									global $kdb; 	
									$id_keca = trim($row['id_kec']);
									 
									$qry1 = " select nama_kec from t_kecamatan where id_kec=".$id_keca;
									$select1 = mysqli_query($kdb,$qry1);
									$row1 = mysqli_fetch_array($select1);
									$nama_kec1 = $row1['nama_kec'];
									
									?>
									
									<select class="form-control" type="text" name="nama_kec" id="nama_kec" >
									<?php
									global $kdb;
									$qry=" select nama_kec from t_kecamatan ";
											$slctpost = mysqli_query($kdb,$qry);
											while($rwpst = mysqli_fetch_array($slctpost))
											{
											
									?>
									
											<option <?php if ($nama_kec1 == $rwpst['nama_kec']){echo "selected";}?> value="<?php echo $rwpst['nama_kec']; ?>"><?php echo $rwpst['nama_kec'];?> </option>
									<?php
											}
											mysqli_free_result($slctpost);
									?>
									</select>
									</td>
								</tr>
								<tr>
									<td >Jabatan</td>
									<td >
									<?php  $status = str_replace('"', '"', trim($row["jabatan"])); ?>
									<input type="radio" name="jabatan" id="jabatan" value="P3A" <?php  if($status=='P3A' || $status=='') {echo "checked=\"checked\""; } else {echo ""; }  ?> />
									<label>P3A</label><br>
									<input type="radio" name="jabatan" id="jabatan" value="Ili-ili" <?php  if($status=='Ili-ili') {echo "checked=\"checked\""; } else {echo ""; } ?> />
									<label>Ili-ili</label>
									</td>
								</tr>
								<tr>
									<td >PUBLIKASI</td>
									<td >
									<?php  $status = str_replace('"', '"', trim($row["publish"])); ?>
									<input type="radio" name="publish" id="publish" value="1" <?php  if($status==1 || $status=='') {echo "checked=\"checked\""; } else {echo ""; }  ?> />
									<label>Dipublikasikan</label><br>
									<input type="radio" name="publish" id="publish" value="0" <?php  if($status==0) {echo "checked=\"checked\""; } else {echo ""; } ?> />
									<label>Tidak dipublikasikan</label>
									</td>
								</tr>
								</table>
						<?php
						}
						?>
						
						<?php
						function curd_create()
						{
						?>
							<div class="panel-heading">
								Form Tambah
							</div>
							<!-- /.panel-heading -->
							
							<div class="panel-body">
								<div class="table-responsive">
									<a href="contact.php?a=reset">Batal</a>
									<br>
									<form action="contact.php?a=reset" method="post">
									<input type="hidden" name="sql" value="insert" >
									<?php
									$row = array(
										"nama"=>"",
										"telepon"=> "",
										"nama_kec"=>"",
										"jabatan"=> "P3A",
										"publish"=>"1");
									forminsert($row)

									?>
									<p><input type="submit" name="action" value="simpan" ></p>
									</form>
								</div>
								<!-- /.table-responsive -->
							</div>
						<?php	
						}
						?>
						
						<?php
						function curd_update($id_kontak)
						{
						global $kdb;
						$hasil2 = sql_select_byid($id_kontak);
						$row = mysqli_fetch_array($hasil2);
						?>
						
							<div class="panel-heading">
								Form Edit
							</div>
							<!-- /.panel-heading -->
							
							<div class="panel-body">
								<div class="table-responsive">
									<a href="contact.php?a=reset">Batal</a>
									<br>
									<form action="contact.php?a=reset" method="post">
									<input type="hidden" name="sql" value="update" >
									<input type="hidden" name="id_kontakx" value="<?php echo $id_kontak?>" >
									<?php
									
									formeditor($row)

									?>
									<p><input type="submit" name="action" value="update" ></p>
									</form>
								</div>
								<!-- /.table-responsive -->
							</div>
						<?php	
						}
						?>
						<?php
						function curd_delete($id_kontak)
						{
						global $kdb;
						$hasil2 = sql_select_byid($id_kontak);
						$row = mysqli_fetch_array($hasil2);
						?>
						
							<div class="panel-heading">
								Form Delete
							</div>
							<!-- /.panel-heading -->
							
							<div class="panel-body">
								<div class="table-responsive">
									<a href="kontak.php?a=reset">Batal</a>
									<br>
									<form action="contact.php?a=reset" method="post">
									<input type="hidden" name="sql" value="delete" >
									<input type="hidden" name="id_kontakx" value="<?php echo $id_kontak;?>" >
									<h3> Anda yakin akan menghapus data kontak atas nama <?php echo $row['nama'];?> </h3>
					
									<p><input type="submit" name="action" value="update" ></p>
									</form>
								</div>
								<!-- /.table-responsive -->
							</div>
						<?php	
						}
						?>
                    </div>
					
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>
	
<?php
		function koneksidatabase()
			{
			include('./includes/koneksi.php');
			return $kdb;
			}
		function sql_select()
			{
			global $kdb;
			$sql = " select * from t_kontak ;"; 
			$hasil = mysqli_query($kdb, $sql);
			return $hasil;
			}
		function sql_select_byid($id_kontak)
		{
			global $kdb;
			$sql = " select * from t_kontak where id_kontak =".$id_kontak;
			$hasil2 = mysqli_query($kdb, $sql) or die(mysql_error());
			return $hasil2;
			
			
		}
		function sql_insert()
			{
			global $kdb;
			global $_POST; 
			$nama_keca=$_POST["nama_kec"];
		
			
			$query=" select id_kec from t_kecamatan where nama_kec='$nama_keca' ";
			$slctpost = mysqli_query($kdb,$query);
			$rwpost = mysqli_fetch_array($slctpost);
			$id_kecamatan = $rwpost['id_kec'];
						

			$sql  = " insert into t_kontak (nama, telepon, id_kec, jabatan, publish) values ('".$_POST["nama"]."','".$_POST["telepon"]."','".$id_kecamatan."','".$_POST["jabatan"]."','".$_POST["publish"]."')";			  
			mysqli_query($kdb, $sql) or die('error'.mysql_error()); 
			
			}
		function sql_update()
		{
			global $kdb;
			global $_POST; 
			$nama_keca=$_POST["nama_kec"];
			
			
			$query=" select id_kec from t_kecamatan where nama_kec='$nama_keca' ";
			$slctpost = mysqli_query($kdb,$query);
			$rwpost = mysqli_fetch_array($slctpost);
			$id_kecamatan = $rwpost['id_kec'];
			

			
			$sql = " update t_kontak set nama = '".$_POST["nama"]."', telepon = '".$_POST["telepon"]."', id_kec = '".$id_kecamatan."', jabatan = '".$_POST["jabatan"]."', publish = '".$_POST["publish"]."' where id_kontak = ".$_POST["id_kontakx"];
			mysqli_query($kdb, $sql) or die( mysql_error());
		}
		function sql_delete()
		{
		  global $kdb;
		  global $_POST; 
		  $sql  = " delete from t_kontak where id_kontak = ".$_POST["id_kontakx"];			  
		  mysqli_query($kdb, $sql) or die( mysql_error()); 
		}
?>
</body>

</html>
