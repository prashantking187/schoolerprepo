<html>
<div class="modal fade" id="addMarker" tabindex="-1" role="dialog" aria-labelledby="addMarkerLabel" aria-hidden="true">
  		<div class="modal-dialog">
    		<div class="modal-content">
    			<form class="form-horizontal" name="addMarkerForm" method="get" action="CreateUser.jsp">
     				 <div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        					<h4 class="modal-title" id="addMarkerLabel"><img src="images/add-marker.png" width="30px" height="30px"/></h4>
      				</div>
      				<div class="modal-body">
  						<div class="form-group">
      						 <label for ="markername" class="col-lg-3 control-label" > Cabinet ID:</label>
       							<div class="col-lg-9">
       								<input type="text" class="form-control"  id="markername" name="markername" placeholder="Cabinet ID" required="required"/>
       							</div>
       					</div>
       					<div class="form-group">
      						 <label for ="locationname" class="col-lg-3 control-label" > Location Name:</label>
       							<div class="col-lg-9">
       								<input type="text" class="form-control"  id="locationName" name="locationName" placeholder="Street Name" required="required"/>
       							</div>
       					</div>
      					 <div class="form-group">
       						<label for ="lat" class="col-lg-3 control-label" > Latitude:</label>
       						<div class="col-lg-9">
      							 <input type="text" class="form-control" id="lat" data-bind="value:replyNumber" name="lat" placeholder="Latitude" required="required" />
      						 </div>
      			 		</div> 
	
						 <div class="form-group">
       						<label for ="lng" class="col-lg-3 control-label" > Longitude:</label>
       						<div class="col-lg-9">
      							 <input type="text" class="form-control" id="lng" data-bind="value:replyNumber" name="lng" placeholder="Longitude" required="required" />
      						 </div>
      			 		</div> 
         
      				</div>
      				<div class="modal-footer">
      					<img src="images/globe_icon.png" style="float:left;width:40px;height:40px;cursor:pointer" title="Add from map" name="goToMap" id="goToMap"  />
        				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        					<button type="submit" class="btn btn-primary" data-loading-text="Saving...">Save</button>
      				</div>
      		</form>
    	</div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</div>
</html>