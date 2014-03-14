<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.main.telephone.DTO.UserInfoBean"%>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
		<title>Mobily FDH Monitoring Station</title>
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
		.container{
		width:1200px;
		}
			.dark{
		position: relative;
		border-radius: 10px 10px 0px 0px;
		top: 0px;
		width: 85%;
		height: 55px;
		/*background: #2A3333;*/
		background: rgb(105, 114, 105); /* Old browsers */
		background: -moz-linear-gradient(top,  rgb(105, 114, 105) 50%, #45474C 81%); /* FF3.6+ */
		background: -webkit-gradient(linear, left top, left bottom, color-stop(50%,rgb(105, 114, 105)), color-stop(81%,#45474C)); /* Chrome,Safari4+ */
		background: -webkit-linear-gradient(top,  rgb(105, 114, 105) 50%,#45474C 81%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top,  rgb(105, 114, 105) 50%,#45474C 81%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top,  rgb(105, 114, 105) 50%,#45474C 81%); /* IE10+ */
		background: linear-gradient(to bottom,rgb(105, 114, 105) 50%,#45474C 81%)/* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='rgb(105, 114, 105)', endColorstr='#45474C',GradientType=0 ); /* IE6-9 */
		
		
		
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
		
		font-size: 1em;
text-align: left;
left: 2em;
top: .8em;
padding-top: 6em;
color: #529DDF;
margin-top: 50em;
position: relative;
		}
	

	
.modal-content{

background: #E3E7E7; /* Old browsers */
background: -moz-linear-gradient(top,  #E3E7E7 50%, #9D9FA5 81%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(50%,#E3E7E7), color-stop(81%,#9D9FA5)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  #E3E7E7 50%,#9D9FA5 81%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  #E3E7E7 50%,#9D9FA5 81%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  #E3E7E7 50%,#9D9FA5 81%); /* IE10+ */
background: linear-gradient(to bottom,  #E3E7E7 50%,#9D9FA5 81%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#E3E7E7', endColorstr='#9D9FA5',GradientType=0 ); /* IE6-9 */

}
.widgetElement{


}
.widget{


width: 160px;
height: 200px;
float: left;
list-style: none;
margin-right: 60px;
margin-left: 70px;
margin-top: 20px;
text-align: center;

}
.spantext{
text-align: center;
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
.widget img{
width: 80%;
padding-bottom: 10px;

}
.imageClass{

	height:55px;
	width:55px;
	cursor:pointer;
	
}
.logo_top_left{
position: absolute;
top: 15px;
left: 500px;
z-index:100;
background: url("images/logo_Symbol_Icon.png") no-repeat;
background-size: contain;
width: 50px;
height: 50px

}
.logo_bottom_right{
position: absolute;
top: 90%;
left: 90%;
background: url("images/rm.png") no-repeat;
background-size: contain;
width: 100px;
height: 50px

}
.settings{

float: right;
height: 35px;
width: 35px;
cursor: pointer;
margin-right: 20px;
}
#settings:hover {
	
	background: #D5CECE;
	border-radius:10px;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    /* display: none; <- Crashes Chrome on hover */
    -webkit-appearance: none;
    margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
}
.defaultEmailLabel,.defaultNumberLabel{color:#529DDF }
		</style>
	<%
String alertBulk="";
if(request.getAttribute("userAlertBulk")!=null)
	alertBulk=(String)request.getAttribute("userAlertBulk");
 %>
		<script>
		
		$(function(){
			
			var alertInfoBulk='<%=alertBulk%>';
			//confirm(alertInfoBulk.length);
			//confirm(alertInfoBulk);
			  if(alertInfoBulk!=null && alertInfoBulk !='' && alertInfoBulk.length>0){
				  var dataInfo=alertInfoBulk.split("~");
				  if(dataInfo[0]=="200")
				  	bootbox.alert("<img src='images/Success.png' />"+dataInfo[1]);
				  else
					 bootbox.alert("<img src='images/Error.png' />"+dataInfo[1]);
			  }
			$.ajax({
        		url:'updates?firstCall=yes',
        		cache:false,
        		success:function(d){
        		
        			var data="";
        			if(d.length>0)
        			data=JSON.parse(d);
        			var tableTempate=$.trim($('#listTemplate').html());
        			var tempTR=$('<tr/>');
   
        			$.each(data,function(){
        	    		//confirm("S1");
        				
        				var boothid=this.boothid;
        				var boothName=this.boothname;
        				var locationName=this.location_name;
					
        					
        				var tdTemplate=$.trim($('#listTdTemplate').html());
        			
        				tdTemplate=tdTemplate.replace(/{{markerVal}}/,boothid)
        						  .replace(/{{markerName}}/,boothName)
        						  .replace(/{{location}}/,locationName);
        				$(tempTR).append(tdTemplate);
        				
        				
        			});
        			tableTempate=tableTempate.replace(/{{tableData}}/,$(tempTR).html());
        			$('#markerLst').find('#listInfo').append(tableTempate);
        		}
        		});
			$('[name=deleteMarker]').on('click',function(){
				
				var loadingImg=$('<center><img src="images/ajax_loading.gif" /></center>');
				var $form=$(this).closest('form');
				var tempModelFooterHtml=$form.find(".modal-footer .buttons").clone(true,true);
				$form.find('.modal-footer').html(loadingImg);
			
				var checkedBoxes=$form.find('input[type="checkbox"]:checked');
				var markerInfo="";
				$.each(checkedBoxes,function(){
					
				//confirm("asda-->"+$(this).val());
					if(markerInfo=="")
						markerInfo=$(this).val();
					else
						markerInfo+="~"+$(this).val();
					
				});
				//confirm(deletemarkers);
							$.ajax({
							 url:"updates?method=delMarker",
						data:{"markerInfo":markerInfo},
						success:function(data){ 
							
							//confirm(data);
							var dataArray=data.split("~");
							 if(dataArray[0]=="200"){
								bootbox.alert("<img src='images/Success.png' />"+dataArray[1]);
								$form.find('.modal-footer').html('');
								$form.find('.modal-footer').append(tempModelFooterHtml);
								$(checkedBoxes).closest('tr').fadeOut('slow',function(){$(this).remove()});
							}
							else if(dataArray[0]=="204"){
								bootbox.alert("<img src='images/Error.png' />"+dataArray[1]);
								$form.find('.modal-footer').html('');
								$form.find('.modal-footer').append(tempModelFooterHtml);
							}
							
						}
							});
				//var markername=$(this).find('input[name=markername]').val();
				//var lat=$(this).find('input[name=lat]').val();
				//var lng=$(this).find('input[name=lng]').val();
				//var locationName=$(this).find('input[name=locationName]').val();
			});
			
			$('button[name=selectAll]').on('click',function(){				
				$(this).closest('form').find('input[type=checkbox]').attr('checked','checked');
			});
			
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
				var locationName=$(this).find('input[name=locationName]').val();
				var lat=$(this).find('input[name=lat]').val();
				var lng=$(this).find('input[name=lng]').val();
			
				$.ajax(
						{
							url:"updates",
							data:{"method":"addMarker","markername":markername,"lat":lat,"lng":lng,"locationName":locationName},
							success:function(data){
								$('button[data-dismiss="modal"]:visible').trigger('click');
								var dataArray=data.split("~");
								if(dataArray[0]=="200")
									bootbox.alert("<img src='images/Success.png' />"+dataArray[1]);
								else if(dataArray[0]=="204")
									bootbox.alert("<img src='images/Success.png' />"+dataArray[1]);
							}
							
						}		
						);
				
				return false;
			});

			$('button[name=goToMap]').click(function(){

				location.href="TelephoneTrack.jsp"
				});
				
			$('button[name=signout]').on('click',function(){
				
				location.href="updates?method=logoff";
			});
			$('#editConfButton').on('click',function(){

			var $numDivDefault=$(this).closest('form').find('.defaultNumDiv,.defaultEmailDiv').children('div');
				$numDivDefault.find('label,input').toggleClass('hide');
				$(this).addClass('hide');
				$(this).next().removeClass('hide');
				});
			$('form[name=editConfForm]').submit(function(){

				var confNum=$(this).find('input[name=confNum]').val();
				var confEmail=$(this).find('input[name=confEmail]').val();
				var $numDivDefault=$(this).closest('form').find('.defaultNumDiv,.defaultEmailDiv').children('div');
				//$numDivDefault.find('label,input').toggleClass('hide');
				
				$.ajax(
				{
					url:"updates",
					cache:false,
					data:{"method":"editConf","confNum":confNum,"confEmail":confEmail},
					success:function(data){
						$('button[data-dismiss="modal"]:visible').trigger('click');
						var dataArray=data.split("~");
						if(dataArray[0]=="200"){
							bootbox.alert("<img src='images/Success.png' />"+dataArray[1]);	
							$numDivDefault.find('.defaultNumberLabel').html(dataArray[2]);
							$numDivDefault.find('.defaultEmailLabel').html(dataArray[3]);
							
						}
						else if(dataArray[0]=="204")
							bootbox.alert("<img src='images/Error.png' />"+dataArray[1]);

						$('#editConfButton').removeClass('hide');
						$('#editConfButton').next().addClass('hide');
						$numDivDefault.find('input').addClass('hide');
						$numDivDefault.find('label').removeClass('hide');
						
					}
					
					
				}
						
				);
				return false;
				});	
			
			
			
		});
		</script>
		<%
	
		UserInfoBean objUserInfo=null;
		String userName="";
		 int role=-1;
		 String emgyNum="";
		 String emgyEmail="";
		System.out.println("asdasd");
		if(session.getAttribute("userInfo")!=null){
			objUserInfo=(UserInfoBean)session.getAttribute("userInfo");
			if(objUserInfo.getUsername()!=null)
				userName=objUserInfo.getUsername();
			if(objUserInfo.getRole()!=0)
			role=objUserInfo.getRole();	
			if(objUserInfo.getEmgyNum()!=null)
				emgyNum=objUserInfo.getEmgyNum();
			if(objUserInfo.getEmgyEmail()!=null)
				emgyEmail=objUserInfo.getEmgyEmail();
			
		}
		else
		{
			request.setAttribute("userAlert", "3~Session Expired.Please login to continue!!!");
			RequestDispatcher dispatch=request.getRequestDispatcher("/");
			dispatch.forward(request, response);
		} 
		

		%>
		
			<script id="listTemplate" type="tabelTemplate">
	<table class="table table-bordered">
        <thead>
          <tr style="background:darkgrey">
            <th>Select</th>
            <th>Cabinet Name</th>
            <th>Location</th>
          </tr>
        </thead>
        <tbody>
{{tableData}}
     </tbody>
    </table>
		</script>
	<script id="listTdTemplate" type="tabelTemplate">
	<tr>
		<td style="text-align:center"><input type="checkbox" value={{markerVal}} /></td>
		<td>{{markerName}}</td>
		<td>{{location}}</td>	
	</tr>
		</script>
		<body>
		<div class="logo_top_left"><span style="white-space: nowrap;
			font-size: 12px;
			color: #019DDD;
			left: 50px;
			top: 30px;
			position: absolute;
			text-transform: uppercase;">Mobily FDH Monitoring System</span></div>
		<div class="logo_bottom_right"></div>
		<div class="container">
		<header class="dark">
			<span >Welcome <label><%=userName %></label></span>
			<button class="btn btn-sm btn-primary signout" type="submit" style="float:right" name="signout" >Sign out</button>
			<img src="images/cogwheel.png"  data-toggle="modal" data-target="#editSettings" href="#modal" class="settings" id="settings" ></img>
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
		 <li class="widget"><a data-toggle="modal" data-target="#addUser" href="#mymodal"><span class="imageClass" ><img src="images/add-user.png" /></span><span  class="spantext"><br></br>Add User</span></a></li>
		<li class="widget"><a data-toggle="modal" data-target="#addMarker" href="#modal"><span class="imageClass" ><img src="images/add-marker.png" /></span><span  class="spantext"><br>Add Single Cabinet</span></a></li>
		<li class="widget"><a data-toggle="modal" data-target="#bulkUploadMarker" href="#modal"><span class="imageClass" ><img src="images/multiplemarker.png" /></span><span  class="spantext"><br>Add Multiple Cabinets</span></a></li>
			<li class="widget"><a href="TelephoneTrack.jsp"><span class="imageClass" ><img src="images/lcd-monitor-icon.png" /></span><span  class="spantext">Mobily FDH Monitoring System</span></a></li>
			<li class="widget"><a href="http://fibernet.dyndns.info:8085/cgi-bin/reports"><span class="imageClass" ><img src="images/reports-icon.png" /></span><span  class="spantext">Report</span></a></li>
			<li class="widget"><a data-toggle="modal" data-target="#markerLst" href="#modal"><span class="imageClass" ><img src="images/delete_icon_blue.ico" /></span><span  class="spantext">Delete Cabinet</span></a></li>
			
			
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
       						<label for ="role" class="col-lg-3 control-label" > Access Level:</label>
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
       								<input type="file"  class="form-control"  id="file" name="file" placeholder="Upload File" required="required"/>
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
		<!-- Edit Settings starts -->
			<div class="modal fade" id="editSettings" tabindex="-1" role="dialog" aria-labelledby="editSettings" aria-hidden="true">
  		<div class="modal-dialog">
    		<div class="modal-content">
    			<form class="form-horizontal" name="editConfForm" method="post" action="bulkUpload" enctype="multipart/form-data">
     				 <div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        					<h4 class="modal-title" id="editSettingsTitle"><img src="images/cogwheel.png" width="30px" height="30px"/></h4>
      				</div>
      				<div class="modal-body">
  						<div class="form-group defaultNumDiv">
      						 <label for ="markername" class="col-lg-6 control-label" > Emergency SMS Number:</label>
       							<div class="col-lg-6">
       								 <label class="col-lg-4 control-label defaultNumberLabel" ><%=emgyNum %></span></label>								 
       								<input type="number" class="form-control hide" id="confNum" name="confNum" placeholder="Emergency SMS Number" value=<%=emgyNum %> required="required" />
       							</div>
       					</div>
       						<div class="form-group defaultEmailDiv">
      						 <label for ="markername" class="col-lg-6 control-label" > Emergency Email ID:</label>
       							<div class="col-lg-6">
       								 <label class="col-lg-4 control-label defaultEmailLabel" ><%=emgyEmail %></span></label>								 
       								<input type="email" class="form-control hide" id="confEmail" name="confEmail" placeholder="Emergency Email id" value=<%=emgyEmail %> required="required" />
       							</div>
       					</div>
       					
      				</div>
      				<div class="modal-footer">
        					<button type="button"  name="editConfButton" id="editConfButton" class="btn btn-primary" data-loading-text="Editting...">Edit</button>
        					<button type="submit"  name="saveConf" id=" saveConf" class="btn btn-primary hide" data-loading-text="Saving...">Save</button>
      				</div>
      		</form>
    	</div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</div>
<!-- Edit Settings ends -->
</div>

		</body>
</html>