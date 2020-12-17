#!/usr/bin/perl
use CGI; 
$query   = new CGI;


print ("Content-type: text/html\n\n");

print <<ENDOFTAG;

 
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Book Store | Home
  </title>


  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
    name='viewport' />

  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

  <link href="../../../513/2/assets/css/bootstrap.min.css" rel="stylesheet" />

  <link href="../../../513/2/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />

</head>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="#" class="simple-text logo-mini">
          <!-- <div class="logo-image-small">
            <img src="../../../513/1//assets/img/logo-small.png">
          </div> -->
          <!-- <p>CT</p> -->
        </a>
        <a href="#" class="simple-text logo-normal">
          513 Book Store
          <!-- <div class="logo-image-big">
            <img src="../../../513/1//assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active ">
            <a href="http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/AdminPage.cgi">
              <i class="fa fa-book"></i>
              <p>Register a Book</p>
            </a>
          </li>
	  <li>
            <a href="http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/ListBooks.cgi?name=admin">
              <i class="fa fa-book"></i>
              <p>List Books</p>
            </a>
          </li>
	  <li>
            <a href="http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/ListCustomers.cgi?name=admin">
              <i class="fa fa-book"></i>
              <p>List Customer</p>
            </a>
          </li>

        </ul>
      </div>
    </div>
    <div class="main-panel" style="height: 100vh;">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:;">Register A Book</a>
          </div>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <ul class="navbar-nav">
              <li class="nav-item btn-rotate dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
                  aria-haspopup="true" aria-expanded="false">
                  <i class="fa fa-user-circle-o"></i>

                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="../../../513/2/index.html">Log out</a>
                  <a class="dropdown-item"
                    href="http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/DisplayCode.cgi?act=1">Display Code</a>
                  <a class="dropdown-item"
                    href="http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/ResetSystem.cgi">Reset System</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h5 class="card-title">Register New Books</h5>
              </div>
              <div class="card-body">
                <div class="row">

                  <div class="col-md-12">
                    <div class="card card-plain">
                      <div class="card-header">
                      </div>
                      <div class="card-body">

                        <!-- The forms to register a book -->
                        <form method="post" action="http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/RegisterBooks.cgi">

                          <div class="row">
                            <div class="col-md-6 pr-1">
                              <div class="form-group">
                                <label>Book Title</label>
                                <input type="text" class="form-control" placeholder="Book Title..." name="title" id="title" required>
                              </div>
                            </div>
                            <div class="col-md-6 pl-1">
                              <div class="form-group">
                                <label>ISBN</label>
                                <input type="text" class="form-control" placeholder="ISBN..." name="isbn" id="isbn" required>
                              </div>
                            </div>
                            <div class="col-md-6 pl-1">
                              <div class="form-group">
                                <label>Price</label>
                                <input type="number" class="form-control" step="0.1" placeholder="Price..." name="price" id="price" required>
                              </div>
                            </div>
                            <div class="col-md-6 pl-1">
                              <div class="form-group">
                                <label>Rate</label>
                                <input type="number" class="form-control" value="3" name="rate" id="rate" readonly>
                              </div>
                            </div>

                          </div>
                          <div class="row">
                            <div class="update ml-auto mr-auto">
                              <button type="submit" class="btn btn-primary btn-round">Register</button>
                            </div>
                          </div>
                        </form>

                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <footer class="footer" style="position: absolute; bottom: 0; width: -webkit-fill-available;">
        <div class="container-fluid">
          <div class="row">
            <nav class="footer-nav">
              <ul>
                <!-- <li><a href="https://www.creative-tim.com" target="_blank">Creative Tim</a></li> -->
              </ul>
            </nav>
            <div class="credits ml-auto">
              <span class="copyright">
                © 2020, made with <i class="fa fa-heart heart"></i> by Fraol
              </span>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src=".../../../../../513/2/assets/js/core/jquery.min.js"></script>
  <script src=".../../../../../513/2/assets/js/core/bootstrap.min.js"></script>
  <script language="JavaScript" src="https://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>

</body>

</html>

ENDOFTAG
