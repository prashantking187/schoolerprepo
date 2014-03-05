<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mobily FDH Monitoring Station login</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <style>
  
body{
			
			overflow-y:hidden;
		background: url("images/bg_default.jpg") repeat;
		font-size: 1.35em;
		
		}
  
.container {
 color: #eee;
 width:1200px;
}

.loginform{

color:#fff;
}
.loginDetails{

margin-left: 60%;
padding-left:5em; 
margin-top: 15%;

}
#dangeralert{

margin: -5% 0% 2% 55%;
width: 500px;
position: absolute;
}
.login{

height: auto;
padding: 2em;
width: 400px;
border: 0px solid rgb(191, 191, 209);

background-size:150%;
color: black;
}
.logo-fixed{

position: absolute;
background: url("images/login_logo_left.jpg") no-repeat;
background-size: 60% 100%;
width: 100%;
top: 0px;
height: 100%;
display: block;
left: -10%;
}
  </style>
 
  </head>
<%
String alert="";
if(request.getAttribute("userAlert")!=null)
	alert=(String)request.getAttribute("userAlert");
 %>
  <script>
  $(function(){
  
   //	$('.alert-danger').hide();
   //code for remember me
    var remember1 = $.cookie('remember1');

  if (remember1!= undefined && remember1!="false") {
    $('#username').val($.cookie('username1'));
    $('#password').val($.cookie('password1'));
    $('#rememberme').attr("checked", true);
  }


  var alertInfo='<%=alert%>';
  
  if(alertInfo!=null && alertInfo !='' && alertInfo.length>0){
  
  var alertArray=alertInfo.split("~");
  $('.alert-danger').find('span').html("&nbsp;&nbsp"+alertArray[1]);
  if("1"==alertArray[0])
  	$('.alert-danger').toggleClass('alert-danger').toggleClass('alert-success');
  else if("2"==alertArray[0])
  	$('.alert-danger').toggleClass('alert-danger').toggleClass('alert-info');
  	
  	$('.alert-dismissable').addClass('in');
  	}
  
  $('form[name=loginform]').submit(function(){
	 
	  //code for remember me
	  var expires_day = 365;
	  if ($('#rememberme').is(':checked')) {
	    $.cookie('username1', $('#username').val(), { expires: expires_day });
	    $.cookie('password1', $('#password').val(), { expires: expires_day });
	    $.cookie('remember1', true, { expires: expires_day });
	  }
	  else {
		    // reset cookies.
		    $.cookie('username1', '');
		    $.cookie('password1', '');
		    $.cookie('remember1',false);
		  }
	  
  });
  });
  
  </script>
  <body>
 
    <div class="container">
    
<div class="container-content" >
	<div class="logo-fixed"></div>
      <form class="form-horizontal loginform" role="form" action="loginaction" method="post" name="loginform" >
    <div class="alert alert-danger alert-dismissable fade" id="dangeralert" >
  		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
 		 <strong><img src="images/Danger1.png" /><span></span></strong>
	</div>
<div class="loginDetails">
	<div class="login">
	 <div class="form-group">
  </div>
  <div class="form-group">
   <div class="col-sm-12">
      <img alt="logo" src="images/logo_Symbol_Icon.png" style="width: 50px;
height: 50px;
padding: .5em;"/><span style="color:#019DDD">MOBILY FDH MONITORING SYSTEM</span>
    </div>
    <div class="col-sm-7">
      <input type="text" class="form-control" id="username" name="username" placeholder="User Name"  required="required">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-7 ">
      <input type="password" class="form-control" id="password" name ="password" placeholder="Password" required="required">
    </div>
  </div>
  <div class="form-group">
    <div class=" col-sm-7">
      <div class="checkbox">
        <label>
          <input type="checkbox" name="rememberme" id="rememberme"> Remember me
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-7">
      <button type="submit" class="btn btn-primary">Sign in</button>
    </div><br><br>
    <div class="col-sm-7">
      <img alt="logo" src="images/rm.png" style="width: 100px;
height: 50px;
padding: .5em;"/>
    </div>
  </div>
 </div></div>
</form>
</div>
    </div>
</head>
<body>

</body>
</html>