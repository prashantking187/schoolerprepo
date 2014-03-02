<!doctype html>

<%@page import="com.main.telephone.DTO.UserInfoBean"%>
<html lang="en">
   <head>
		<title>Cabinet tracker</title>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta http-equiv="content-language" content="en" />
		<meta name="viewport" content="width=device-width,intial-scale=4.0" />
		<meta name="author" content="Sarath" />
		  <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
   <script type="text/javascript" src="js/bootbox.min.js"></script>
		<style type="text/css">
		body{
		overflow-y:hidden;
		background: url("images/bg_default.jpg") repeat;
		
		}
		.container{
		padding: 1em;
		}
		
			.dark{
		position: relative;
		border-radius: 10px 10px 0px 0px;
		top: 0px;
		width: 85%;
		height: 45px;
		background: #2A3333;
		margin: 0px auto;
		padding-top: .5em;
		padding-right: 1em;
		
		}
		.dark label:FIRST-LETTER{
		
		text-transform: capitalize;
		}
		.widgetContainer{
		border-radius:0px 0px 10px 10px;
		position:relative;
		width:85%;
		margin:0px auto;
		height: auto;
		overflow-y:hidden;
		display: block;
		background: #ebebeb url('images/main_bg_home.gif')  repeat;
		height:550px;
		}
		.dark span{
		
		font:1em;
		text-align: left;
		padding-left:2em;
		padding-top:3em;
		color:#fff;
		}
	

		.widget img{
	width:inherit;
	height:inherit;
}
.modal-content{

background: #8B8D8D; /* Old browsers */
background: -moz-linear-gradient(top,  #8B8D8D 50%, #d3d3d3 81%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(50%,#8B8D8D), color-stop(81%,#d3d3d3)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  #8B8D8D 50%,#d3d3d3 81%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  #8B8D8D 50%,#d3d3d3 81%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  #8B8D8D 50%,#d3d3d3 81%); /* IE10+ */
background: linear-gradient(to bottom,  #8B8D8D 50%,#d3d3d3 81%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#8B8D8D', endColorstr='#d3d3d3',GradientType=0 ); /* IE6-9 */

}
.widgetElement{

margin: 20px 150px 151px 280px;
padding: 2em;
height: 520px;
width: 400px;
display: block;
border: 1px solid rgba(65, 49, 57, 0.5);
border-radius: 20px;
background: rgba(241, 240, 240, 1); /* Old browsers */
background: -moz-linear-gradient(top,  rgba(201, 198, 198, 1) 0%, rgba(246,246,246,1) 50%, rgba(241,241,241,1) 51%, rgba(241, 240, 240, 1) 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(201, 198, 198, 1)), color-stop(50%,rgba(246,246,246,1)), color-stop(51%,rgba(241,241,241,1)), color-stop(100%,rgba(241, 240, 240, 1))); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  rgba(201, 198, 198, 1) 0%,rgba(246,246,246,1) 50%,rgba(241,241,241,1) 51%,rgba(241, 240, 240, 1) 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  rgba(201, 198, 198, 1) 0%,rgba(246,246,246,1) 50%,rgba(241,241,241,1) 51%,rgba(241, 240, 240, 1) 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  rgba(201, 198, 198, 1) 0%,rgba(246,246,246,1) 50%,rgba(241,241,241,1) 51%,rgba(241, 240, 240, 1) 100%); /* IE10+ */
background: linear-gradient(to bottom, rgba(201, 198, 198, 1) 0%,rgba(238, 232, 232, 1) 50%,rgba(235, 223, 223, 1) 51%,rgba(241, 240, 240, 1) 100%) /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='rgba(201, 198, 198, 1)', endColorstr='#ffffff',GradientType=0 ); /* IE6-9 */

}
.widget{

    display: block;
width: 100%;
height: 70px;
cursor:pointer;
border: 2px solid grey;
padding:.3em;
margin: 0 0 10px 0;
background: rgb(233,246,253); /* Old browsers */
background: -moz-linear-gradient(top,  rgba(237, 240, 241, 1) 50%, rgba(204, 210, 213, 1) 81%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(50%,rgba(237, 240, 241, 1)), color-stop(81%,rgba(204, 210, 213, 1))); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,rgba(237, 240, 241, 1) 50%,rgba(204, 210, 213, 1) 81%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,rgba(237, 240, 241, 1) 50%,rgba(204, 210, 213, 1) 81%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,rgba(237, 240, 241, 1) 50%,rgba(204, 210, 213, 1) 81%); /* IE10+ */
background: linear-gradient(to bottom,rgba(237, 240, 241, 1)50%,rgba(204, 210, 213, 1) 81%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=rgba(237, 240, 241, 1), endColorstr=rgba(204, 210, 213, 1),GradientType=0 ); /* IE6-9 */

    


}
.roleList{

margin:0px auto;
display:block;
width:300px;
height:200px;

}.widget a{

width:100%;
text-decoration: none;

}
.widget span{

padding:1em;
}
.imageClass{

	height:55px;
	width:55px;
	cursor:pointer;
	
}


		</style>
		<script>
		
		$(function(){
			
			$('form[name=addUserForm]').submit(function(){
				
				var username=$(this).find('input[name=username]').val();
				var password=$(this).find('input[name=password]').val();
				var role=$(this).find('select[name=role]').val();
				
				$.ajax(
				{
					url:"updates",
					data:{"method":"addUser","username":username,"password":password,"role":role},
					success:function(data){
						$('button[data-dismiss="modal"]:visible').trigger('click');
						var dataArray=data.split("~");
						if(dataArray[0]=="200")
							bootbox.alert("<img src='images/Success.png' />"+dataArray[1]);
						else if(dataArray[0]=="204")
							bootbox.alert("<img src='images/Error.png' />"+dataArray[1]);
						
					}
					
				}		
				);
				return false;
			});
			

			$('form[name=addMarkerForm]').submit(function(){
			
				var markername=$(this).find('input[name=markername]').val();
				var lat=$(this).find('input[name=lat]').val();
				var lng=$(this).find('input[name=lng]').val();
			
				$.ajax(
						{
							url:"updates",
							data:{"method":"addMarker","markername":markername,"lat":lat,"lng":lng},
							success:function(data){
								
								$('button[data-dismiss="modal"]:visible').trigger('click');
								var dataArray=data.split("~");
								if(dataArray[0]=="200")
									bootbox.alert("<img src='images/Success.png' />"+dataArray[1]);
								else if(dataArray[0]=="204")
									bootbox.alert("<img src='images/Error.png' />"+dataArray[1]);
							}
							
						}		
						);
				
				return false;
			});
			
			$('button[name=signout]').on('click',function(){
				
				location.href="updates?method=logoff";
			});
			
		});
		</script>
		<%
	
		UserInfoBean objUserInfo=null;
		String userName="";
		int role=-1;
		if(session.getAttribute("userInfo")!=null){
			objUserInfo=(UserInfoBean)session.getAttribute("userInfo");
			if(objUserInfo.getUsername()!=null)
				userName=objUserInfo.getUsername();
			if(objUserInfo.getRole()!=0)
			role=objUserInfo.getRole();	
			
		}
		else
		{
			request.setAttribute("userAlert", "3~Session Expired.Please login to continue!!!");
			RequestDispatcher dispatch=request.getRequestDispatcher("/");
			dispatch.forward(request, response);
		}
		

		%>
		
		
		<body>
		<div class="container">
		<header class="dark">
			<span >Welcome <label><%=userName %></label></span>
			<button class="btn btn-sm btn-primary" type="submit" style="float:right" name="signout" >Sign out</button>
		</header>
		<div class="widgetContainer">
		<!-- <ul class="widgetElement">
		<li class="widget"><a data-toggle="modal" data-target="#addUser" href="#mymodal"><img src="images/add-user.png" /><span>Add User</span></a></li>
		<li class="widget"><a data-toggle="modal" data-target="#addMarker" href="#modal"><img src="images/add-marker.png" /><span>Add Cabinet</span></a></li>
			<li class="widget"><a href="TelephoneTrack.jsp"><img src="images/images.jpg" /><span>Street Cabinet Monitoring System</span></a></li>
			<li class="widget"><a href="http://fibernet.dyndns.info:8085/cgi-bin/reports"><img src="images/reports-icon.png" /><span>Report</span></a></li>
		</ul>
		
		 -->
		 <ul class="widgetElement">
		 <li class="widget"><a data-toggle="modal" data-target="#addUser" href="#mymodal"><span class="imageClass" ><img src="images/add-user.png" /></span><span  class="spantext">Add User</span></a></li>
		<li class="widget"><a data-toggle="modal" data-target="#addMarker" href="#modal"><span class="imageClass" ><img src="images/add-marker.png" /></span><span  class="spantext">Add Cabinet</span></a></li>
			<li class="widget"><a href="TelephoneTrack.jsp"><span class="imageClass" ><img src="images/lcd-monitor-icon.png" /></span><span  class="spantext">Street Cabinet Monitoring System</span></a></li>
			<li class="widget"><a href="http://fibernet.dyndns.info:8085/cgi-bin/reports"><span class="imageClass" ><img src="images/reports-icon.png" /></span><span  class="spantext">Report</span></a></li>
			<li class="widget"><a data-toggle="modal" data-target="#bulkUploadMarker" href="#modal"><span class="imageClass" ><img src="images/add-marker.png" /></span><span  class="spantext">Bulk Upload Cabinets</span></a></li> 
			<li class="widget"><a data-toggle="modal" data-target="#markerLst" href="#modal"><span class="imageClass" ><img src="images/delete_icon_blue.ico" /></span><span  class="spantext">Delete Markers</span></a></li>
		</ul>
		 <div class="roleList" ></div>
		
		</div>
		
		<!--  Modal code for add user -->
	<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="addUserLabel" aria-hidden="true">
  		<div class="modal-dialog">
    		<div class="modal-content">
    			<form class="form-horizontal" name="addUserForm" method="post" >
     				<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        				<h4 class="modal-title" id="addUserLabel"><img src="images/add-user.png" width="30px" height="30px"/></h4>
      				</div>
      				<div class="modal-body">
  						<div class="form-group">
      						 <label for ="username" class="col-lg-3 control-label" > User Name:</label>
       							<div class="col-lg-9">
       								<input type="text" class="form-control" id="username" name="username" placeholder="User Name" required="required"/>
       							</div>
       					</div>
      					 <div class="form-group">
       						<label for ="username" class="col-lg-3 control-label" > Password:</label>
       						<div class="col-lg-9">
      							 <input type="text" class="form-control" id="password" name="password" placeholder="Password" required="required"/>
      						 </div>
      			 		</div> 
						 <div class="form-group">
       						<label for ="role" class="col-lg-3 control-label" > Role:</label>
       						<div class="col-lg-9">
						      <select id="role" class="form-control" name="role"  required="required">
							      <option value="">Select</option>
							      <option value="1">Admin</option>
							      <option value="2">View Only</option>
						      </select>
      						</div>
       					</div> 
         
      				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
        				<button type="submit" name="addUserBtn" class="btn btn-primary" data-loading-text="Saving...">Save</button>
      				</div>
      			</form>
    		</div><!-- /.modal-content -->
  		</div><!-- /.modal-dialog -->
	</div>
		
		<!--  Modal code for add user ENDS -->
		
			<!--  Modal code for add marker -->
	<jsp:include page="AddMarker.jsp"></jsp:include>
		<!--  Modal code for add marker ENDS -->
		<!--  Modal code for add marker -->
	<jsp:include page="MarkerList.jsp"></jsp:include>
		<!--  Modal code for add marker ENDS -->
		<!-- bulkUploadMarkers start -->
	<div class="modal fade" id="bulkUploadMarker" tabindex="-1" role="dialog" aria-labelledby="bulkUploadMarker" aria-hidden="true">
  		<div class="modal-dialog">
    		<div class="modal-content">
    			<form class="form-horizontal" name="bulkUploadFOrm" method="post" action="bulkUpload" enctype="multipart/form-data">
     				 <div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        					<h4 class="modal-title" id="addMarkerLabel"><img src="images/add-marker.png" width="30px" height="30px"/></h4>
      				</div>
      				<div class="modal-body">
  						<div class="form-group">
      						 <label for ="markername" class="col-lg-4 control-label" > Select file to upload:</label>
       							<div class="col-lg-8">
       								<input type="file" accept="application/vnd.ms-excel"  class="form-control"  id="file" name="file" placeholder="Upload File" required="required"/>
       							</div>
       					</div>
       					
      				</div>
      				<div class="modal-footer">
        					<button type="submit" class="btn btn-primary" data-loading-text="Uploading...">Upload</button>
      				</div>
      		</form>
    	</div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</div>
		<!-- bulkUploadMarkers ends -->

</div>
		</body>
</html>