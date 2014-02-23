<!DOCTYPE html>
<%@page import="com.main.telephone.DTO.UserInfoBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
   <head>
		<title>Cabinet tracker</title>
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
		#map_canvas{
		
		border-radius:0px 0px 10px 10px;
		}
		.dark{
		position: relative;
		border-radius:10px 10px 0px 0px;
		top: 0px;
		width: 85%;
		height: 45px;
		background: #2A3333;
		margin: 0px auto;
		padding-top: .5em;
		padding-right: 1em;
		
		}
		.container{
		
		padding:1em;
		}
		.dark span{
		
		font:1em;
		text-align: left;
		padding-left:2em;
		padding-top:3em;
		color:#fff;
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
		<header class="dark">
			<span >Welcome <label> <%=userName %></label></span>
		
			<button class="btn btn-sm btn-primary" type="submit" style="float:right" name="signout" >Sign out</button>
			<% 
			if(role==1){%>
			<button class="btn btn-sm btn-primary" type="submit" style="margin-right:2em;float:right" name="mainMenu" >Main Menu</button>
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
        				$('#markerAdd').clearAll();
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
        				
        					$.ajax(
        							{
        								url:"updates?parentPage=telephoneTracker",
        								data:{"method":"addMarker","markername":markername,"lat":lat,"lng":lng},
        								success:function(data){
        									
        									$('form[name=addMarkerForm]').find('.modal-footer').html(tempModelFooterHtml);
        									$('button[data-dismiss="modal"]:visible').trigger('click');
        									var dataArray=data.split("~");
   
        									var newdata=JSON.parse(dataArray[0]);
        									var lat=newdata[0].lat;
        			        				var lng=newdata[0].lng;
        			        				var boothid=newdata[0].boothid;
        			        				var markerStat=newdata[0].status;
        			        				var smoke_status=newdata[0].smoke_status;
        			        				var flood_status=newdata[0].flood_status;
        			        				var door_status=newdata[0].door_status;
        			        				var humidity=newdata[0].humidity;
        			        				var boothname=newdata[0].boothname;
        
        									if(dataArray[1]=="200"){
        										
        										
        										 var marker = new google.maps.Marker({
        				        					    position: new google.maps.LatLng(lat, lng),
        				        					    map: mapObj,
        				        					    icon:imageRed,
        				        					    id:boothid,
        				        					    bounds:true
        				        					    
        				        					  });
        										 
        										 markers.push(marker);
        										 var tempHTML=	prepareHTML(boothname,boothid,door_status,smoke_status,flood_status,markerStat,humidity)
        				        				 
        				        				
        				        				 $(marker).click(function() {
        				        					 var idinfo=String(this.id);
        				        						$('#map_canvas').gmap('openInfoWindow', {'content':tempHTML}, this);
        				        					});
        										
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
        	    		//confirm("S1");
        				var lat=this.lat;
        				var lng=this.lng;
        				var boothid=this.boothid;
        				var status=this.status;
        				var smoke_status=this.smoke_status;
        				var flood_status=this.flood_status;
        				var door_status=this.door_status;
        				var humidity=this.humidity;
        				
        				if(smoke_status!=null && smoke_status!="" && smoke_status=='Y')
        						smoke_status="YES"
        					else
        						smoke_status="NO"
        				if(flood_status!=null && flood_status!="" && flood_status=='Y')
        					flood_status="YES"
                		else
                			flood_status="NO"		
                		if(door_status!=null && door_status!="" && door_status=='Y')
                			door_status="YES"
                        else
                        	door_status="NO"
        				var markerStat="Active";
        				var boothname=this.boothname;
        				if(status=='N'){
        					image=imageRed;
        					markerStat="Inactive"
        				}
        				else{
        					image=imageGreen;
        					markerStat="Active"
        				}
						
        				
        				 var marker = new google.maps.Marker({
        					    position: new google.maps.LatLng(lat, lng),
        					    map: the_map,
        					    icon:image,
        					    id:boothid,
        					    bounds:true
        					    
        					  });
        				 //confirm(boothid+","+status);
        				 
        		var tempHTML=	prepareHTML(boothname,boothid,door_status,smoke_status,flood_status,markerStat,humidity)
        				 
        				 
        				 $(marker).click(function() {
        					 var idinfo=String(this.id);
        						$('#map_canvas').gmap('openInfoWindow', {'content':tempHTML}, this);
        					});
        					  markers.push(marker);
        				//var markInfo={'id':id, 'icon':image,'position': new google.maps.LatLng(lat, lng), 'bounds':true,'map':map };
        				//addMarker(markInfo);
        				
        			});
        		var latlng=new google.maps.LatLng('21.0000','78.0000');
        			the_map.setCenter(latlng);
        		//confirm(marker1);
        			mapObj=the_map;
        			});
        			//default map loading focusing india
//$('#map_canvas').gmap({'center': ' 21.0000, 78.0000', 'zoom': 5});
    //$('#map_canvas').gmap('refresh');

        			
        		
     var source=new EventSource('updates');
    source.onmessage=function(e){
    	if(typeof mapObj !="undefined" && typeof  e.data !="undefined"){
    	var data=JSON.parse(e.data);
    	//confirm(e.data);
    	//$('#map_canvas').gmap('refresh');
    //	$('#map_canvas').gmap().bind('init', function() {
    	//	confirm("in");
    	$.each(data,function(evt,map){
    		//confirm("S");
			var lat=this.lat;		
			var lng=this.lng;
			var id=this.boothid;
			var status=this.status;

			if(status=='N')
				image=imageRed;
			else
				image=imageGreen;
			//confirm(id+"," +status);
$.each(markers,function(i){
	if(id==this.id){
		//confirm(status);
	var marker=markers[i];		
		marker.setIcon(image);
	}
});


		       /*  $('#map_canvas').gmap('addMarker', { 'tags':id, 'position': new google.maps.LatLng(lat, lng), 'bounds':true });
		        $('#map_canvas').gmap('find', 'markers', { 'property': 'tags', 'value': id }, function(marker, isFound) {
	                if ( isFound ) {
	                        confirm("ada");
	                } else {
	                        confirm("poda");
	                }
	        }); */
	       

	       
	        //map.addMarker( {'id':"5", 'icon':image,'position': new google.maps.LatLng('11.0183','76.9725'), 'bounds':true });
		    
		});
			//$('#map_canvas').gmap('addMarker', {'tags':id, 'icon':image,'position': new google.maps.LatLng(lat, lng), 'bounds':true } );
    }
			
       
		//});
    	
    	
    } 
        	
        			//var markers = $('#map_canvas').gmap('get', 'markers');
        			//confirm("ss"+markers);
        			//var map = $('#map_canvas').gmap('get', 'map');

                		
        			}
        			
			
        	});
			
			
		}
	
	
            $(function() { 
            	
            	$('#map_canvas').html('<center><img src="images/ajax-loader.gif" /></center>');
            	//$('#map_canvas').gmap({'center': ' 15.0000, 75.0000', 'zoom':5});
            //calling ajax at regular intervals to check if the telephone is getting used
       getBoothStat();

			});
            function prepareHTML(boothname,boothid,door_status,smoke_status,flood_status,markerStat,humidity){
            	
       		 var tempHTML='<div name="markerInfoDiv" ><div class="markerInfoHeader"><span>Cabinet Status</span></div><div class="markerInfoContent">'+
			 '<ul><li><div class="row"><div class="col-md-5">Cabinet id :</div> <div class="col-md-5">'+boothid+'</div></div></li><li><div class="row"><div class="col-md-5">Temperature info :</div><div class="col-md-5"> 25c</div> </div></li>'+
			 '<li><div class="row"><div class="col-md-5">Cabinet name :</div> <div class="col-md-5">'+boothname+'</div></div></li>'+
			 '<li><div class="row" ><div class="col-md-5">Door Status :</div><div class="col-md-5">'+door_status+'</div></div> </li>'+
			 '<li><div class="row" ><div class="col-md-5">Smoke Status :</div><div class="col-md-5"> '+smoke_status+'</div></div> </li>'+
			 '<li><div class="row" ><div class="col-md-5">Flood Status :</div><div class="col-md-5">'+flood_status+'</div></div> </li>'+
			 '<li><div class="row"><div class="col-md-5">Cabinet Status :</div><div class="col-md-5"> '+markerStat+'</div></div> </li>'+
			 '<li><div class="row"><div class="col-md-5">Humidity :</div><div class="col-md-5"> '+humidity+'</div></div> </li>'+
			 '</div></ul>';
			 
			 return tempHTML;
            	
            }
        </script>
      
    </div>
    	<jsp:include page="AddMarker.jsp"></jsp:include>
	</body>
</html>