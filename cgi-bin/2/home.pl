#!/usr/bin/perl
use CGI; 
$query   = new CGI;

$uname = $query -> param("name");
$rankOpt = $query -> param("rankOpt");
$rankVal = $query -> param("rankVal");


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
    <script>
        function sortRank(n) {

            var i, x, y, shouldSwitch, count = 0;

            var table = document.getElementById("bookTable");
            var tableB = table.getElementsByTagName("tbody")[0];
            var rows = tableB.getElementsByTagName("tr");

            var switching = true;

	    var dir = "asc";

            while (switching) {

                switching = false;

                for (i = 0; i < (rows.length - 1); i++) {
		    console.log(i);
		    var Switch = false;
	
                    x = rows[i].getElementsByTagName("TD")[2];
                    y = rows[i + 1].getElementsByTagName("TD")[2];

		  if (dir == "asc") {
                    if (Number(x.innerHTML) > Number(y.innerHTML)) {
                        Switch = true;
                        break;
                    }
		  } else if (dir == "desc"){
	      	      if (Number(x.innerHTML) < Number(y.innerHTML)) {
                        Switch = true;
                        break;
                      }
		    }
                }

                if (Switch ) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
		    count++;
                } else {
		    if (count == 0 && dir == "asc"){
			dir = "desc";
			switching = true;
		    }
		}
            }
        }
    </script>
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
  	    <script>

              function updateRank(x,y) {
		 
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200 ){
				alert("You have ranked a book!");
				location.reload();
			}
		};

                xhttp.open("GET", "http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/UpdateRank.cgi?id="+x+"&rank="+y,true);
		xhttp.send();

              }			
		
		
            </script>
        <a href="#" onClick = "demo(event); return false;" class="simple-text logo-normal">
          513 Book Store
          <!-- <div class="logo-image-big">
            <img src="../../../513/1//assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
	 <li class="active ">
            <a href=
ENDOFTAG

	print("http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/home.cgi?name=$uname");

print <<ENDOFTAG;

>
              <i class="fa fa-home"></i>
              <p>Home</p>
            </a>
          </li>

          <li>
            <a href=

ENDOFTAG

	print("http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/ListBooks.cgi?name=$uname");

print <<ENDOFTAG;
>
              <i class="fa fa-book"></i>
              <p>List Books</p>
            </a>
          </li>
    	  <li>
            <a href=
ENDOFTAG

	print("http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/ListCustomers.cgi?name=$uname");

print <<ENDOFTAG;

>
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
            <a class="navbar-brand" href="javascript:;">
ENDOFTAG
	print ("Welcome to the Book Store,<strong> $uname </strong>");

print <<ENDOFTAG;
</a>
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
                    href="http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/DisplayCode.cgi?act=2">Display Code</a>
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
          <div class="col-md-12">
		 <div class="card">
              <div class="card-header">
                <h5 class="card-title">Search for Books</h5>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12">
                    <div class="card card-plain">
                      <div class="card-header">
                      </div>
                      <div class="card-body">
			<script>
			        var purchased_book = [];

				function purchaseBook(n,uname) {
					
					if (n == -1) {

		var itr = purchased_book.values();
		var url = "http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/PurchaseBooks.cgi?uname="+uname+"&";
		purchased_book.forEach(net);
		
		function net(item,index){
			url += "id="+item+"&";
		}

		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200 ){
				location.reload();
			}
		};

                xhttp.open("GET", url,true);
		xhttp.send();


					} else {

						var x = purchased_book.indexOf(n);
						if(x == -1){

						  purchased_book.push(n);	


						}else{

						   delete purchased_book[x];	

						} 

					}
				}
			</script>
	
ENDOFTAG

if ($rankVal ne "" && $rankOpt ne ""){
	#--------------print body of search page-------------
	print("<h5 class='card-title'>Result:</h5></br>");
	$cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom SearchBooks $uname $rankVal $rankOpt";
	system($cmd);
} else {

#--------------print body of search page-------------
print <<ENDOFTAG;
			<form action="http://undcemcs02.und.edu/~fraol.ahmed/cgi-bin/513/2/home.cgi" method="get">
ENDOFTAG

	print ("<input type='text' name='name' id='name' value='$uname' hidden>");

print <<ENDOFTAG;
			Ranking: <input type="number" name="rankVal" id="rankVal" max="5" min="0" required></br>
			Search for books with ? : 
				<div class="form-check form-check-inline">
  					<input class="form-check-input" type="radio" name="rankOpt" id="high" value="max" required>
  					<label class="form-check-label" for="high">Higher Values</label>
				</div>
				<div class="form-check form-check-inline">
  					<input class="form-check-input" type="radio" name="rankOpt" id="low" value="min">
  					<label class="form-check-label" for="low">Lower Values</label>
				</div>	
				
			 <input type="submit" class="btn btn-primary" value="Search">		
			</form>
  
ENDOFTAG
}

print <<ENDOFTAG;
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
                <!-- <li><a href="#" target="_blank">Creative Tim</a></li> -->
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
