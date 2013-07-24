<div id="mod_request_record" >
	<form id="form_user" class="form-horizontal">
	  <fieldset>
		<div class="control-group pos_left">
		  <label class="control-label bold_label" for="input_man_asesor">Asesor: </label> 
		  <div class="controls">
			<input autocomplete="off" id="input_man_asesor" type="text" class="span3" style="margin: 0 auto;" data-provide="typeahead" data-items="4" data-toggle="popover" data-placement="right" data-content="" data-source="" required>
			<p class="help-block">Ejm: GARC&Iacute;A FERNANDO</p>
		  </div>
		</div>
		<div class="control-group pos_right" style="margin-left: 30px;">
		  <label class="control-label bold_label" for="input_man_asesor">ACOMPA&Ntilde;ANTE: </label> 
		  <div class="controls">
			<input class="" id="check_acompaniante" type="checkbox" style="margin: 0 auto;">
			<input autocomplete="off" id="input_man_acompaniante" type="text" class="span3" style="margin: 0 auto;width: 240px;" data-provide="typeahead" data-items="4" data-toggle="popover" data-placement="right" data-content="" data-source="" disabled>
			<p class="help-block acom" style="margin-top:0">Ejm: ARIAS LUIS</p>
		  </div>
		  
		</div>
	  </fieldset>
	  <fieldset>
		<div class="control-group">
		  <label class="control-label bold_label" for="input_man_titulo">T&iacute;tulo: </label> 
		  <div class="controls">
			<input type="text" class="input-xxlarge" id="input_man_titulo" data-toggle="popover" data-placement="right" data-content="" autocomplete="off" required>
		  </div>
		</div>
	  </fieldset>
	  <fieldset>
		<div class="control-group">
		  <label class="control-label bold_label" for="input_man_voucher" >Voucher: </label> 
		  <div class="controls">
			<input type="text" class="input-xlarge" required id="input_man_voucher" data-toggle="popover" data-placement="right" data-content="" autocomplete="off" maxlength="7">
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	  <fieldset>
		<div class="control-group">
		  <label class="control-label bold_label" for="input_man_correo">Correo: </label> 
		  <div class="controls">
		<input type="email" placeholder="unjfsc@micorreo.com" class="input-xxlarge" id="input_man_correo" data-toggle="popover" data-placement="right" autocomplete="off" data-content="" required>
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	  <div class="text_tesista">
	 	<ul class="nav nav-tabs" id="myTab">
	          <li class="active"><a href="#introduccion_tes" data-toggle="tab">Introduccion</a></li>
	          <li><a href="#objetivo_tes" data-toggle="tab">Objetivo</a></li>
	          <li><a href="#resumen_tes" data-toggle="tab">Resumen</a></li>
	          <li><a href="#conclusion_tes" data-toggle="tab">Conclusion</a></li>
	        </ul> 
	        <div class="tab-content">
	          <div class="tab-pane active" id="introduccion_tes">
	            <textarea id="input_user_introduccion" name="introduccion_tes" rows="5" placeholder="Escriba su INTRODUCCION aqui..." data-toggle="popover" data-placement="right" data-content=""  required></textarea>
	          </div>
	          <div class="tab-pane" id="objetivo_tes">
	            <textarea id="input_user_objetivo" name="objetivo_tes" rows="5" placeholder="Escriba su OBJETIVO aqui..." data-toggle="popover" data-placement="right" data-content=""  required></textarea>
	          </div>
	          <div class="tab-pane" id="resumen_tes">
	            <textarea id="input_user_resumen" name="resumen_tes" rows="5" placeholder="Escriba su RESUMEN aqui..." data-toggle="popover" data-placement="right" data-content=""  required></textarea>
	          </div>
	          <div class="tab-pane" id="conclusion_tes">
	            <textarea id="input_user_conclusion" name="conclusion_tes" rows="5" placeholder="Escriba su CONCLUSION aqui..." data-toggle="popover" data-placement="right" data-content="" ></textarea>
	          </div>
	        </div>
        </div>
        <div class="btn_tesi">
	        <input class="btn btn-primary enviar" type="submit" value="Enviar" />
        </div>
	</form>
	<div class="msg_request_record"></div>
</div>
<script type="text/javascript">
<!--
$(document).ready(function(){
	$('#mod_request_record #input_man_voucher').validations('0123456789');
});
//-->
</script>