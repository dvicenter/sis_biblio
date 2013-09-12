<script type="text/javascript" src="/sis_biblio/resource/myjs/voucher.js">
</script>
<div id="modalVoucher" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <a class="close" data-dismiss="modal">×</a>
    <h3>Cargar Voucher</h3>
  </div>
  <form id="form_voucher" class="form-horizontal" enctype="multipart/form-data" action="/sis_biblio/manager/ccvoucher/load_voucher" method="post">
  <div class="modal-body">
    
		<div class="form_user">		
		  	<fieldset class="pos_left">
				<div class="control-group">
					<div class="controls" style="margin-left: 0px">
					<input name="archivo" id="input_control" type="file" data-toggle="popover" data-placement="bottom" data-content="" required></div>
					 <input name="action" type="hidden" value="upload" />  
				</div>
		  	</fieldset>
			
			<div id="status"></div>
		</div>
  </div>
  <div class="progress progress-striped active voucher_pro" style="width:75%; margin: 0 auto; margin-bottom: 15px; margin-top: -21px;">
       			<div class="bar vou_bar" style="width: 0%"></div>
 </div>
  <div class="modal-footer">
    <a href="#" class="btn">Cerrar</a>
    <input class="btn btn-primary " type="submit" value="Cargar">
    </div>
  </form>
</div>

