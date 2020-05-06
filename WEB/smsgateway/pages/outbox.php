<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SMS Gateway</title>

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
$ID = !empty($_GET['id']) ? $_GET['id'] : " ";
$kdb = koneksidatabase();
$a = @$_GET["a"];
$sql = @$_POST["sql"];
switch ($sql) {
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
                    <h1 class="page-header">Outbox</h1>
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
							case "hapus"  :  curd_delete($ID); break; 
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
											<th>Nomor  Tujuan</th>
											<th>Isi Pesan</th>
											<th>Tanggal Kirim Pesan</th>
											<th>Aksi</th>
										</tr>
                                    </thead>
									<?php
										while ($row = mysqli_fetch_array($hasil))
										{
											
									?>
                                    <tbody>
										<tr>
											<td><?php echo $i; ?></td>
											<td><?php echo $row['DestinationNumber']; ?></td>
											<td><?php echo $row['TextDecoded']; ?></td>
											<td><?php echo $row['SendingDateTime']; ?></td>
											<td><a href="outbox.php?a=hapus&id=<?php echo $row['ID'] ?>" class="btn btn-danger btn-xs">DELETE</a></td>
											
										</tr>
									</tbody>
									<?php
									$i++;
									}
									?>
                                </table>
								
                            </div>
                            <!-- /.table-responsive -->
                        </div>
						<?php
								mysqli_free_result($hasil);
								}
								?>
                        <!-- /.panel-body -->
						<?php
						function curd_delete($ID)
						{
						global $kdb;
						$hasil2 = sql_select_byid($ID);
						$row = mysqli_fetch_array($hasil2);
						?>
						
							<div class="panel-heading">
								Form Delete
							</div>
							<!-- /.panel-heading -->
							
							<div class="panel-body">
								<div class="table-responsive">
									<a href="outbox.php?a=reset" >Batal</a>
									<br>
									<form action="outbox.php?a=reset" method="post">
									<input type="hidden" name="sql" value="delete" >
									<input type="hidden" name="IDX" value="<?php echo $ID;?>" >
									<h3> Anda yakin akan menghapus pesan ini?</h3>
					
									<p><input type="submit" name="action" class="btn btn-danger btn-xs value="Delete" ></p>
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
			$sql = " select ID,DestinationNumber, TextDecoded, SendingDateTime from outbox Order By SendingDateTime DESC;"; 
			$hasil = mysqli_query($kdb, $sql);
			return $hasil;
			}
		function sql_select_byid($ID)
		{
			global $kdb;
			$sql = " select * from outbox where ID =".$ID;
			$hasil2 = mysqli_query($kdb, $sql) or die(mysql_error());
			return $hasil2;	
		}
		function sql_delete()
		{
		  global $kdb;
		  global $_POST; 
		  $sql  = " delete from outbox where ID = ".$_POST["IDX"];			  
		  mysqli_query($kdb, $sql) or die( mysql_error()); 
		}
?>
</body>

</html>
