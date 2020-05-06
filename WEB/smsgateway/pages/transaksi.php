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
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
<?php
$a = !empty($_GET['a']) ? $_GET['a'] : "reset";
$id_transaksi = !empty($_GET['id']) ? $_GET['id'] : " "; 
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
                    <h1 class="page-header">Jadwal</h1>
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
							case "edit"  :  curd_update($id_transaksi); break;
							case "hapus"  :  curd_delete($id_transaksi); break; 
							default : curd_read(); break;
						}
							mysqli_close($kdb);
							

							function curd_read()
							{
								$hasil = sql_select();
								$i=1;
						?>
                        <div class="panel-heading">
                            Tabel Jadwal
                        </div>
                        <!-- /.panel-heading -->
						
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
											<th>No</th>
											<th>Tanggal Broadcast </th>
											<th>Tanggal Pintu Air Dibuka</th>
											<th>Tanggal Pintu Air Ditutup</th>
											<th>Jenis Tanam</th>
											<th>Nama Kecamatan</th>
											<th>Status</th>
											<th>Aksi</th>
										</tr>
                                    </thead>
									<?php
										while ($row = mysqli_fetch_array($hasil))
										{
											$id_keca = $row['id_kec'];
											$id_tana = $row['id_tanaman'];
											global $kdb;
											$qry=" select nama_kec from t_kecamatan where id_kec='$id_keca' ";
											$slctpost = mysqli_query($kdb,$qry);
											$rwpst = mysqli_fetch_array($slctpost);
											$nama_kec = $rwpst['nama_kec'];
											$qury="select tanaman from t_tanaman where id_tanaman='$id_tana'";
											$selctpost=mysqli_query($kdb,$qury);
											$rowpst=mysqli_fetch_array($selctpost);
											$tanaman = $rowpst['tanaman'];
									?>
                                    <tbody>
										<tr>
											<td><?php echo $i; ?></td>
											<td><?php echo $row['tgl_broadcast']; ?></td>
											<td><?php echo $row['tgl_buka']; ?></td>
											<td><?php echo $row['tgl_tutup']; ?></td>
											<td><?php echo $tanaman; ?></td>
											<td><?php echo $nama_kec; ?></td>
											<td><?php echo $row['status']; ?></td>
											<td>
												<a href="transaksi.php?a=edit&id=<?php echo $row['id_transaksi'] ?>"class="btn btn-warning btn-xs" >UPDATE</a> 
												<a href="transaksi.php?a=hapus&id=<?php echo $row['id_transaksi'] ?>" class="btn btn-danger btn-xs">DELETE</a>
											</td>
										</tr>
									</tbody>
									
									<?php
									$i++;
									}
									?>
									<a href="transaksi.php?a=tambah" class="btn btn-success btn-sm">CREATE</a>
                                </table>
								<?php
								mysqli_free_result($hasil);
							}
							?>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
						<?php
						function forminsert($row)
						{
						?>
						        <table class="table table-striped table-bordered table-hover">
								<tr>
									<td width="200px">Tanggal Broadcast</td>
				
									<td><input class="form-control" required="" type="date" name="tgl_broadcast" id="tgl_broadcast" value="<?php  echo trim($row["tgl_broadcast"]) ?>" >
									
								
									</tr>
									<tr>
									<td width="200px">Tanggal Buka</td>
									<td><input class="form-control" required="" type="date" name="tgl_buka" id="tgl_buka" value="<?php  echo trim($row["tgl_buka"]) ?>" ></td>
									</tr>
									<tr>
									<td width="200px">Tanggal Tutup</td>
									<td><input class="form-control" required="" type="date" name="tgl_tutup" id="tgl_tutup" value="<?php  echo trim($row["tgl_tutup"]) ?>" ></td>
									</tr>
									<td width="200px">Nama Kecamatan</td>
									<td>
									<?php  
									global $kdb; 	
									
									?>
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
									<td width="200px">Nama Tanaman</td>
									
									<td>
									<select class="form-control" type="text" name="tanaman" id="tanaman">
									<?php
									$qry=" select tanaman from t_tanaman ";
											$slctpost = mysqli_query($kdb,$qry);
											while($rwpst = mysqli_fetch_array($slctpost))
											{
											
									?>
										
									    <option><?php echo $rwpst['tanaman'];?> </option>
									<?php
											}
											
											mysqli_free_result($slctpost);
									?>
									</select>
									</td>
								</tr>
								<tr>
									<td >PUBLIKASI</td>
									<td >
									<?php  $status = str_replace('"', '"', trim($row["status"])); ?>
									<input type="radio" name="status" id="status" value="T" <?php  if($status=='T' || $status=='') {echo "checked=\"checked\""; } else {echo ""; }  ?> />
									<label>Dipublikasikan</label><br>
									<input type="radio" name="status" id="status" value="F" <?php  if($status=='F') {echo "checked=\"checked\""; } else {echo ""; } ?> />
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
									<td width="200px">Tanggal Broadcast</td>
				
									<td><input class="form-control" required="" type="date" name="tgl_broadcast" id="tgl_broadcast" value="<?php  echo trim($row["tgl_broadcast"]) ?>" >
									
									
									</tr>
									<tr>
									<td width="200px">Tanggal Buka</td>
									<td><input class="form-control" required="" type="date" name="tgl_buka" id="tgl_buka" value="<?php  echo trim($row["tgl_buka"]) ?>" ></td>
									</tr>
									<tr>
									<td width="200px">Tanggal Tutup</td>
									<td><input class="form-control" required="" type="date" name="tgl_tutup" id="tgl_tutup" value="<?php  echo trim($row["tgl_tutup"]) ?>" ></td>
									</tr>
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
									<td width="200px">Nama Tanaman</td>
									<?php
									$id_tanaman1 = trim($row['id_tanaman']);
									
									$qry2 = " select tanaman from t_tanaman where id_tanaman=".$id_tanaman1;
									$select2 = mysqli_query($kdb,$qry2);
									$row2 = mysqli_fetch_array($select2);
									$tanaman1 = $row2['tanaman'];
								
						
									?>
									<td>
									<select class="form-control" type="text" name="tanaman" id="tanaman">
									<?php
									$qry=" select tanaman from t_tanaman ";
											$slctpost = mysqli_query($kdb,$qry);
											while($rwpst = mysqli_fetch_array($slctpost))
											{
											
									?>
										
									    <option <?php if ($tanaman1 == $rwpst['tanaman']){echo "selected";}?> value="<?php echo $rwpst['tanaman']; ?>"><?php echo $rwpst['tanaman'];?> </option>
									<?php
											}
											
											mysqli_free_result($slctpost);
									?>
									</select>
									</td>
								</tr>
								<tr>
									<td >PUBLIKASI</td>
									<td >
									<?php  $status = str_replace('"', '"', trim($row["status"])); ?>
									<input type="radio" name="status" id="status" value="T" <?php  if($status=='T' || $status=='') {echo "checked=\"checked\""; } else {echo ""; }  ?> />
									<label>Dipublikasikan</label><br>
									<input type="radio" name="status" id="status" value="F" <?php  if($status=='F') {echo "checked=\"checked\""; } else {echo ""; } ?> />
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
									<a href="transaksi.php?a=reset">Batal</a>
									<br>
									<form action="transaksi.php?a=reset" method="post">
									<input type="hidden" name="sql" value="insert" >
									<?php
									$row = array(
										"tgl_broadcast"=>"",
										"jam"=> "",
										"menit"=>"",
										"tgl_buka"=> "",
										"tgl_tutup"=>"",
										"nama_kec"=> "",
										"tanaman"=>"",
									  "status" => "T");
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
						function curd_update($id_transaksi)
						{
						global $kdb;
						$hasil2 = sql_select_byid($id_transaksi);
						$row = mysqli_fetch_array($hasil2);
						?>
						
							<div class="panel-heading">
								Form Edit
							</div>
							<!-- /.panel-heading -->
							
							<div class="panel-body">
								<div class="table-responsive">
									<a href="transaksi.php?a=reset">Batal</a>
									<br>
									<form action="transaksi.php?a=reset" method="post">
									<input type="hidden" name="sql" value="update" >
									<input type="hidden" name="id_transaksix" value="<?php echo $id_transaksi?>" >
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
						function curd_delete($id_transaksi)
						{
						global $kdb;
						$hasil2 = sql_select_byid($id_transaksi);
						$row = mysqli_fetch_array($hasil2);
						?>
						
							<div class="panel-heading">
								Form Delete
							</div>
							<!-- /.panel-heading -->
							
							<div class="panel-body">
								<div class="table-responsive">
									<a href="transaksi.php?a=reset">Batal</a>
									<br>
									<form action="transaksi.php?a=reset" method="post">
									<input type="hidden" name="sql" value="delete" >
									<input type="hidden" name="id_transaksix" value="<?php echo $id_transaksi;?>" >
									<h3> Anda yakin akan menghapus data transaksi tanggal <?php echo $row['tgl_broadcast'];?> </h3>
					
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
			$sql = " select * from t_transaksi order by tgl_broadcast desc;"; 
			$hasil = mysqli_query($kdb, $sql)or die(mysql_error());
			return $hasil;
			}
		function sql_insert()
			{
			global $kdb;
			global $_POST; 
			$nama_keca=$_POST["nama_kec"];
			$tanam=$_POST["tanaman"];
			
			$query=" select id_kec from t_kecamatan where nama_kec='$nama_keca' ";
			$slctpost = mysqli_query($kdb,$query);
			$rwpost = mysqli_fetch_array($slctpost);
			$id_kecamatan = $rwpost['id_kec'];
			
			$qury=" select id_tanaman from t_tanaman where tanaman='$tanam' ";
			$selctpost = mysqli_query($kdb,$qury);
			$rwopst = mysqli_fetch_array($selctpost);
			$id_tanaman = $rwopst['id_tanaman'];
			echo $_POST["status"];
			echo $id_kecamatan;
			echo $id_tanaman;
			$sql  = " insert into t_transaksi (tgl_broadcast, tgl_buka, tgl_tutup, id_tanaman, id_kec,  status) values ('".$_POST["tgl_broadcast"]."', '".$_POST["tgl_buka"]."', '".$_POST["tgl_tutup"]."', '".$id_tanaman."', '".$id_kecamatan."', '".$_POST["status"]."' )";			  
			mysqli_query($kdb, $sql) or die(mysql_error()); 
			
			}
		function sql_select_byid($id_transaksi)
		{
			global $kdb;
			$sql = " select * from t_transaksi where id_transaksi =".$id_transaksi;
			$hasil2 = mysqli_query($kdb, $sql) or die(mysql_error());
			return $hasil2;
			
			
		}
		function sql_update()
		{
			global $kdb;
			global $_POST; 
			$nama_keca=$_POST["nama_kec"];
			$tanam=$_POST["tanaman"];
			
			$query=" select id_kec from t_kecamatan where nama_kec='$nama_keca' ";
			$slctpost = mysqli_query($kdb,$query);
			$rwpost = mysqli_fetch_array($slctpost);
			$id_kecamatan = $rwpost['id_kec'];
			
			$qury=" select id_tanaman from t_tanaman where tanaman='$tanam' ";
			$selctpost = mysqli_query($kdb,$qury);
			$rwopst = mysqli_fetch_array($selctpost);
			$id_tanaman = $rwopst['id_tanaman'];
			echo $_POST["status"];
			echo $id_kecamatan;
			echo $id_tanaman;
			
			$sql = " update t_transaksi set tgl_broadcast = '".$_POST["tgl_broadcast"]."', tgl_buka = '".$_POST["tgl_buka"]."', tgl_tutup = '".$_POST["tgl_tutup"]."', id_tanaman = '".$id_tanaman."', id_kec = '".$id_kecamatan."', status = '".$_POST["status"]."' where id_transaksi = ".$_POST["id_transaksix"];
			mysqli_query($kdb, $sql) or die( mysql_error());
		}
		function sql_delete()
		{
		  global $kdb;
		  global $_POST; 
		  $sql  = " delete from t_transaksi where id_transaksi = ".$_POST["id_transaksix"];			  
		  mysqli_query($kdb, $sql) or die( mysql_error()); 
		}
?>
</body>

</html>
