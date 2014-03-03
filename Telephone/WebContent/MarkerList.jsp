<html><style>
.table-bordered,.table-bordered>thead>tr>th, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>tbody>tr>td, .table-bordered>tfoot>tr>td{

border:1px solid #6D6060;
}
#listInfo {
height: 450px;
overflow: auto;
}
</style>
<div class="modal fade" id="markerLst"  tabindex="-1" role="dialog" aria-labelledby="markerLstLabel" aria-hidden="true">
	<form>
  		<div class="modal-dialog">
    		<div class="modal-content">
    			
    			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        					<h4 class="modal-title" id="addMarkerLabel"><img src="images/add-marker.png" width="30px" height="30px"/><center>Delete Cabinets</center></h4>
      				</div>
      				<div style="padding:2em" id="listInfo">

    			</div>
    			<div class="modal-footer">
    				<div class="buttons">
        				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        					<button type="button" name="deleteMarker" class="btn btn-primary" data-loading-text="Saving...">Delete</button>
        			</div>
      				</div>
    	</div><!-- /.modal-content -->
    	
  	</div><!-- /.modal-dialog -->
  	</form>
</div>
</html>