
<script src="/sis_biblio/resource/myjs/voucher.js" type="text/javascript"></script>
<div id="voucher">
	<form id="form_voucher" class="form-horizontal" enctype="multipart/form-data" action="/sis_biblio/manager/ccvoucher/load_voucher" method="post">
		<div class="form_user">		
		  	<fieldset class="pos_left">
				<div class="control-group">
					<div class="controls">
					<input name="archivo" id="input_control" type="file" data-toggle="popover" data-placement="bottom" data-content="" required></div>
					 <input name="action" type="hidden" value="upload" />  
				</div>
		  	</fieldset>
			<fieldset class="btn_voucher pos_right">
					<input class="btn btn-primary " type="submit" value="Cargar">
			</fieldset>
			<div id="status"></div>
		</div>
	</form>
	<div class="progress progress-striped active voucher_pro" >
  	<div class="bar vou_bar"
       style="width: 0%;"></div>
	</div>
</div>