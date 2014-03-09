<!DOCTYPE html>
<%@page import="com.main.telephone.DTO.UserInfoBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
   <head>
		<title>Mobily FDH Monitoring Stattion</title>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta http-equiv="content-language" content="en" />
		<meta name="viewport" content="width=device-width,intial-scale=1.0" />
		<meta name="author" content="Sarath" />
		  <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
   <script type="text/javascript" src="js/bootbox.min.js"></script>
		<style>
		body{
			overflow-y:hidden;
		background: url("images/bg_default.jpg") repeat;
		
		}
		.container{
		width:1200px;
		}
		#map_canvas{
		
		border-radius:0px 0px 10px 10px;
		}
		.dark{
		position: relative;
		border-radius:10px 10px 0px 0px;
		top: 0px;
		width: 85%;
		height: 55px;
		background: #2A3333;
		background: rgb(105, 114, 105); /* Old browsers */
		background: -moz-linear-gradient(top,  rgb(105, 114, 105) 50%, #45474C 81%); /* FF3.6+ */
		background: -webkit-gradient(linear, left top, left bottom, color-stop(50%,rgb(105, 114, 105)), color-stop(81%,#45474C)); /* Chrome,Safari4+ */
		background: -webkit-linear-gradient(top,  rgb(105, 114, 105) 50%,#45474C 81%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top,  rgb(105, 114, 105) 50%,#45474C 81%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top,  rgb(105, 114, 105) 50%,#45474C 81%); /* IE10+ */
		background: linear-gradient(to bottom,rgb(105, 114, 105) 50%,#45474C 81%)/* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='rgb(105, 114, 105)', endColorstr='#45474C',GradientType=0 ); /* IE6-9 */
		
		
		
		margin: 0px auto;
		padding-top: .1em;
		padding-right: 1em;
		
		}
		.container{
		
		padding:1em;
		}
		.dark span{
		
		font-size: 1em;
text-align: left;
left: 2em;
top: .8em;
padding-top: 6em;
color:#529DDF;
margin-top: 50em;
position: relative;
		}
		.dark label:FIRST-LETTER{
		
		text-transform: capitalize;
		}
		.map{
		width: 85%;
		height: 550px;
		position:relative;
		margin:0px auto;
		padding-top: 1em;
		padding-right: 1em;
		
		}
		
		
		div[name=markerInfoDiv]{
		
		width:350px;
		height: 450px;
		overflow-x:hidden;
		}
	
		.markerInfoContent li{
		border:1px  solid #D8D8D8;
		height: 50px;
		padding:1em;
		}
		.markerInfoContent li:first-child{
		
		border-bottom: 0px;
		}
		
		
		
		.markerInfoHeader{
		
		text-align: center;
		}
		.markerInfoHeader span{
		
		padding:1em;
		text-align:center;
		color:blue;
	
		}
		
		
		div[name=markerInfoDiv],li{
		
		list-style: none;
		
		
		}
		
	.logo_top_left{
position: absolute;
top: 15px;
left: 500px;
z-index: 100;
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
.infobox-wrapper {
    display:none;
}
#infobox {
    border:2px solid black;
    margin-top: 8px;
    background:#333;
    color:#FFF;
    font-family:Arial, Helvetica, sans-serif;
    font-size:12px;
    padding: .5em 1em;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    text-shadow:0 -1px #000000;
    -webkit-box-shadow: 0 0  8px #000;
    box-shadow: 0 0 8px #000;
}

		</style>
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
		<script type="text/javascript" src="js/modernizr-2.0.6/modernizr.min.js"></script>
		<script type="infowindowTemplate" id="infoWindowTemplate">
		<div id="infobox" >
		<table class="table table-bordered" >
    		<thead style="background: rgb(238, 149, 35);color: black;" >
    			<tr>
    				<th>Cabinet Name/ID</th>
					<th>Location Name</th>
    				<th>Door Status</th>
    				<th>Smoke Status</th>
    				<th>Flood Status</th>
					<th>Humidity</th>
    			</tr>
    		</thead>
    		<tbody>
    			<tr>
    				<td style="text-align:center">{{cabinetid}}</td>
					<td style="text-align:center">{{locationName}}</td>
    				<td style="text-align:center">{{doorstatus}}</td>
    				<td style="text-align:center">{{smokestatus}}</td>
    				<td style="text-align:center">{{floodstatus}}</td>
					<td style="text-align:center">{{humidity}}</td>
    			</tr>
    
    </tbody>
    </table>
<div><span style="float: right;
margin-top: -15px;">Last updated on :{{lastUpdatedInfo}}</span></div>
</div>
		</script>
		<script>
		$(function(){
$('button[name=signout]').on('click',function(){
				
				location.href="updates?method=logoff";
			});
			
$('button[name=mainMenu]').on('click',function(){
	
	location.href="CreateUser.jsp";
});

		});
		
		</script>
    </head>
   <body>
		<div class="container">
				<div class="logo_top_left"><span style="white-space: nowrap;
				font-size: 12px;
				color: #019DDD;
				left: 50px;
				top: 30px;
				position: absolute;
				text-transform: uppercase;">Mobily FDH Monitoring System</span></div>
		<div class="logo_bottom_right"></div>
		<header class="dark">
			<span >Welcome <label> <%=userName %></label></span>
		
			<button class="btn btn-sm btn-primary" type="submit" style="float:right;margin-top:1em" name="signout" >Sign out</button>
			<% 
			if(role==1){%>
			<button class="btn btn-sm btn-primary" type="submit" style="margin-right:2em;float:right;margin-top:1em" name="mainMenu" >Main Menu</button>
			<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addMarker" href="#modal" name="markerAdd" id="markerAdd" style="display:none" >Show modal</button>
			<%}%>
		</header>
		
					<div id="map_canvas" class="map rounded"></div>
				
	
		
		
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
		<script type="text/javascript" src="js/jquery-1.7.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/underscore-1.2.2/underscore.min.js"></script>
		
		<script type="text/javascript" src="ui/jquery.ui.map.js"></script>
		<script type="text/javascript" src="ui/jquery.ui.map.services.js"></script>
		<script type="text/javascript" src="ui/jquery.ui.map.extensions.js"></script>
		<script type="text/javascript" src="js/eventsource.js"></script>
		<script type="text/javascript" src="js/infobox.js"></script>
		<script type="text/javascript">
		
	
		
		//marker images
		var imageGreen = new google.maps.MarkerImage('images/Circle_Green.png',
  new google.maps.Size(40, 40),
  new google.maps.Point(0,0),
  new google.maps.Point(0, 32));
    var imageRed = new google.maps.MarkerImage('images/Circle_Red.png',
  new google.maps.Size(40, 40),
  new google.maps.Point(0,0),
  new google.maps.Point(0, 32));
    
    //default markers
    
    var markers=[];
    
    
    var mapObj;
    
   $.fn.clearAll=function(){
	   
	 var elements=  $(this).find('input[type=text]');
	 //confirm($(this).find('input[type=text]').length);
	elements.val('');
	   
   }
	//default ajax call	
		function getBoothStat(){
			var image=imageGreen;
			$.ajax({
        		url:'updates?firstCall=yes',
        		cache:false,
        		success:function(d){
        		
        			var data="";
        			if(d.length>0)
        			data=JSON.parse(d);
        			
        		
        			$('#map_canvas').gmap({'zoom':7,'disableDoubleClickZoom': true,}).bind('init', function(event,the_map) {
        				var self=this;
        				//writing click function
        				$(the_map).dblclick(function(event){
        				$('form[name=addMarkerForm]').clearAll();
        				var latLng=event.latLng;

        				if(latLng!=null && latLng!="")
        					{
        					$('#addMarker #lat').val(latLng.lat());
        					$('#addMarker #lng').val(latLng.lng());
        					}
        				
        				 // var service = new google.maps.places.PlacesService(the_map);
        				  
        				//finding address
        			$('#map_canvas').gmap('search', {'location': latLng}, function(results, status) {
        				if ( status === 'OK' ) {
        					$('#addMarker #locationName').val('');
        					$.each(results[0].address_components, function(i,v) {
        						if ( v.types[0] == "sublocality")
        							$('#addMarker #locationName').val(v.long_name);
        						else if ( v.types[0] == "locality" && $('#addMarker #locationName').val()=="")
        							$('#addMarker #locationName').val(v.long_name);
        						else if( v.types[0]=="route" && $('#addMarker #locationName').val()=="")
        							$('#addMarker #locationName').val(v.long_name);
        						else if( v.types[0]=="administrative_area_level_2" && $('#addMarker #locationName').val()=="")
        							$('#addMarker #locationName').val(v.long_name);
        						else if( v.types[0]=="administrative_area_level_1" && $('#addMarker #locationName').val()=="")
        							$('#addMarker #locationName').val(v.long_name);
        						
        					});
        				}
        			});
			
        				$('#markerAdd').trigger('click');

            				
        				});

        				$('form[name=addMarkerForm]').submit(function(){
        					var loadingImg=$('<center><img src="images/ajax_loading.gif" /></center>');
        					var tempModelFooterHtml=$(this).find('.modal-footer').html();
        					$(this).find('.modal-footer').html(loadingImg);
        				
        					var markername=$(this).find('input[name=markername]').val();
        					var lat=$(this).find('input[name=lat]').val();
        					var lng=$(this).find('input[name=lng]').val();
        					var locationName=$(this).find('input[name=locationName]').val();
        					$.ajax(
        							{
        								url:"updates?parentPage=telephoneTracker",
        								data:{"method":"addMarker","markername":markername,"lat":lat,"lng":lng,"locationName":locationName},
        								success:function(data){
        									
        									$('form[name=addMarkerForm]').find('.modal-footer').html(tempModelFooterHtml);
        									$('button[data-dismiss="modal"]:visible').trigger('click');
        									var dataArray=data.split("~");
   
        									var newdata=JSON.parse(dataArray[0]);

        
        									if(dataArray[1]=="200"){
        										
        										prepareMarkers(newdata[0],the_map);
        										bootbox.alert("<img src='images/Success.png' />"+dataArray[2]);
        										
			
        									}
        									else if(dataArray[0]=="204"){
        										bootbox.alert("<img src='images/Error.png' />"+dataArray[1]);
        										$('form[name=addMarkerForm]').find('.modal-footer').html(tempModelFooterHtml);	
        									}
        								}
        								
        							}		
        							);
        					
        					return false;
        				});
        				
        			$.each(data,function(evt,map){    		
        			prepareMarkers(this,the_map);
        			});
        			var latlng=new google.maps.LatLng('21.0000','78.0000');
        			the_map.setCenter(latlng);
        			mapObj=the_map;
        			});
        			//default map loading focusing india
//$('#map_canvas').gmap({'center': ' 21.0000, 78.0000', 'zoom': 5});
    //$('#map_canvas').gmap('refresh');

        			
        		
     var source=new EventSource('updates');
    	source.onmessage=function(event){
    	if(typeof mapObj !="undefined" && typeof  event.data !="undefined"){
    	var data=JSON.parse(event.data);
    	$.each(data,function(evt,map){

		

			var lat=this.lat;
			var lng=this.lng;
			var boothid=this.boothid;
			var smoke_status=this.smoke_status;
			var flood_status=this.flood_status;
			var door_status=this.door_status;
			var humidity=this.humidity;
			var boothname=this.boothname;
			var locationName=this.location_name;
			var updateInfo=this.updateInfo;
			
			if(door_status=='N' || smoke_status=='N' || flood_status=='N'){
				image=imageRed;
			}
			else{
				image=imageGreen;
			}
			
			var tempHTML=	prepareHTML(boothname,boothid,statusToImage(door_status),statusToImage(smoke_status),statusToImage(flood_status),humidity,locationName,updateInfo);
			 
			
			var infobox = new InfoBox({
				 content: tempHTML,
				 disableAutoPan: false,
				 maxWidth: 150,
				 pixelOffset: new google.maps.Size(-140, 0),
				 zIndex: null,
				 boxStyle: {
				    background: "url('http://google-maps-utility-library-v3.googlecode.com/svn/trunk/infobox/examples/tipbox.gif') no-repeat",
				    opacity: 0.75,
				    width: "580px"
				},
				closeBoxMargin: "12px 4px 2px 2px",
				closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif",
				infoBoxClearance: new google.maps.Size(1, 1)
				});

			 
			//markers.push(marker);
        	
        	
			//confirm(id+"," +status);
$.each(markers,function(i){
	if(boothid==this.id){
		//confirm(status);
	var marker=markers[i];		
		marker.setIcon(image);
		google.maps.event.clearListeners(marker,'click');
		google.maps.event.addListener(marker, 'click', function() {
			 infobox.open(mapObj,marker);
		});
		
	}
});


		    
		});
			
    }
			
       
    	
    }                		
        			}			
        	});			
		}
	
            $(function() { 
            	
            	$('#map_canvas').html('<center><img src="images/ajax-loader.gif" /></center>');//default loading image
      		 	getBoothStat();//first call to get all the markers

			});
            function prepareHTML(boothname,boothid,door_status,smoke_status,flood_status,humidity,locationName,updateInfo){

       		 var tempHTML=$('<div id="wrapper" />');
			 
			 var template=$.trim($('#infoWindowTemplate').html());
			 template=template.replace(/{{cabinetid}}/,boothname)
			 				  .replace(/{{locationName}}/,locationName)
			 				   .replace(/{{lastUpdatedInfo}}/,updateInfo)
			 				  .replace(/{{doorstatus}}/,door_status)
			 				  .replace(/{{smokestatus}}/,smoke_status)
			 				  .replace(/{{floodstatus}}/,flood_status)
			 				  .replace(/{{humidity}}/,humidity);
			 $(tempHTML).append(template);		  
			 //confirm($(tempHTML).html());
			
			 return $(tempHTML).html();
            	
            }
            function prepareMarkers(data,the_map){
            	
    			var lat=data.lat;
				var lng=data.lng;
				var boothid=data.boothid;
				var smoke_status=data.smoke_status;
				var flood_status=data.flood_status;
				var door_status=data.door_status;
				var humidity=data.humidity;
				var locationName=data.location_name;
				var updateInfo=data.updateInfo;
				
				var boothname=data.boothname;
				if(door_status=='N' || smoke_status=='N' || flood_status=='N'){
					image=imageRed;
				}
				else{
					image=imageGreen;
				}
				
				
				 var marker = new google.maps.Marker({
					    position: new google.maps.LatLng(lat, lng),
					    map: the_map,
					    icon:image,
					    id:boothid,
					    bounds:true
					    
					  });
				 //confirm(boothid+","+status);
				 
				var tempHTML=	prepareHTML(boothname,boothid,statusToImage(door_status),statusToImage(smoke_status),statusToImage(flood_status),humidity,locationName,updateInfo);
				 
				
				var infobox = new InfoBox({
					 content: tempHTML,
					 disableAutoPan: false,
					 maxWidth: 150,
					 pixelOffset: new google.maps.Size(-140, 0),
					 zIndex: null,
					 boxStyle: {
					    background: "url('http://google-maps-utility-library-v3.googlecode.com/svn/trunk/infobox/examples/tipbox.gif') no-repeat",
					    opacity: 0.75,
					    width: "580px"
					},
					closeBoxMargin: "12px 4px 2px 2px",
					closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif",
					infoBoxClearance: new google.maps.Size(1, 1)
					});

				 $(marker).click(function() {
					 infobox.open(the_map,this);
					});
				markers.push(marker);
            	
            	
            	
            }
            function statusToImage(status){
            	
            	
            	if(status=='Y')
            		return '<img src="images/Circle_Green.png" />';
            	else
            		return '<img src="images/Circle_Red.png" />';
            }
        </script>
      	
    </div>
    	<jsp:include page="AddMarker.jsp"></jsp:include>
	</body>
</html>