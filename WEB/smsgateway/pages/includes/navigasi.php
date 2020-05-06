<?php

session_start();
if(!isset($_SESSION['uname'])){
	header("location:../index.php");
}
?>
<div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php">SMS Gateway</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
                     
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Halo <?php echo $_SESSION['uname']; ?></a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout.php"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
			<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">						
                        <li>
                            <a href="index.php"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
							<a href="#"><i class="fa fa-envelope-o fa-fw"></i> Pesan<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="inbox.php">Inbox</a>
                                </li>
                                <li>
                                    <a href="sent-items.php">Sent-items</a>
                                </li>
                                <li>
                                    <a href="outbox.php">Outbox</a>
                                </li>
                            </ul>
                        </li>
						<li>
                            <a href="contact.php"><i class="fa fa-book fa-fw"></i> Phonebook</a>
                            <!-- /.nav-second-level -->
                        </li>
						<li>
                            <a href="transaksi.php"><i class="fa fa-table fa-fw"></i> Jadwal</a>
                        </li>
						<li>
                            <a href="admin.php"><i class="fa fa-users fa-fw"></i> Admin</a>
                        </li>
					</ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>