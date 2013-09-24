<link type="text/css" href="<?php echo base_url()?>resource/css/datepicker_bootstrap.css" rel="stylesheet"/>
<script src="/sis_biblio/resource/myjs/tesis/tesis.js"></script>

<script type="text/javascript" src="<?php echo base_url()?>resource/js/bootstrap-datepicker.js"></script>

<div id="new_tesis" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
    <div class="response"></div>
    <h3 id="myModalLabel">Agregar Tesis</h3>
  </div>
  <div class="modal-body">
    <form id="form_nuevo_tesis" >
    	<input id="id_material_bibliografico" type="hidden"/>
    	<div>
    		
        <label for="titulo" style="float: left;">Titulo:</label>
        <input style="width: 85%; margin-left: 10px;" autofocus="autofocus" type="text" id="titulo" data-toggle="popover" data-placement="right" data-content="" autocomplete="off" required/>
    	</div>
      <fieldset > 
        <label for="autor">Autor:</label>
        <input type="text" id="autor" class="span3" data-toggle="popover" data-placement="right" data-content="" autocomplete="off" required/>
        <label for="anio">A&ntilde;o:</label>
        <div class="input-append date" id="anio" data-date-viewmode="years" data-date-format="yyyy">
	        <input style="width: 230px; " type="text" data-toggle="popover" data-placement="right" data-content="" required maxlength="4" data-date-format="yyyy" name="anio" readonly/>
	        <span class="add-on"><i class="icon-calendar"></i></span>
	    </div>
        <label for="facultad">Facultad:</label>
        <div id="facultad_tesis">

        <ul class=resultado>
        <li id="facultad">
        </li>
        </ul>

        </div>
        
      </fieldset>

      <fieldset>
        <label for="asesor">Asesor:</label>
        <input autocomplete="off" id="asesor" class="span3" type="text" data-provide="typeahead" data-items="4" data-toggle="popover" data-placement="right" data-content="" data-source="" required />
        <label for="acompaniante">Acompa&ntilde;ante:</label>

        <input id="acompaniante" type="text" data-provide="typeahead" data-items="4" data-toggle="popover" data-placement="right" data-content="" data-source="" required/>
        <input type="checkbox" name="acompa">

        <label for="escuela">Escuela:</label>
        <div id="escuela_tesis">
           
                <ul class=resultado>
       
                <li id="escuela">
                </li>

            </ul>


        </div>
      </fieldset>
      <ul class="nav nav-tabs" id="myTab" style="clear: both;">
          <li class="active"><a href="#introduccion" data-toggle="tab">Introduccion</a></li>
          <li><a href="#objetivo" data-toggle="tab">Objetivo</a></li>
          <li><a href="#resumen" data-toggle="tab">Resumen</a></li>
          <li><a href="#conclusion" data-toggle="tab">Conclusión</a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="introduccion">
            <textarea id="input_introduccion" name="introduccion" rows="5" placeholder="Escriba su INTRODUCCIÓN aqui..." data-toggle="popover" data-placement="bottom" data-content="" required></textarea>
          </div>
          <div class="tab-pane" id="objetivo">
            <textarea id="input_objetivo" name="objetivo" rows="5" placeholder="Escriba su OBJETIVO aqui..." data-toggle="popover" data-placement="bottom" data-content="" required></textarea>
          </div>
          <div class="tab-pane" id="resumen">
            <textarea id="input_resumen" name="resumen" rows="5" placeholder="Escriba su RESUMEN aqui..." data-toggle="popover" data-placement="bottom" data-content="" required></textarea>
          </div>
          <div class="tab-pane" id="conclusion">
            <textarea id="input_conclusion" name="conclusion" rows="5" placeholder="Escriba su CONCLUSIÓN aqui..." data-toggle="popover" data-placement="bottom" data-content="" required></textarea>
          </div>
        </div>
  </div>
      <div class="modal-footer ">
        <input  type="reset" class="btn" onClick="this.form.reset();" aria-hidden="true" data-dismiss="modal" value="Cancelar"/>
        <input id="save_tesis" class="btn btn-primary" type="submit" value="Agregar"/>
      </div>
    </form>
  </div>
<script type="text/javascript">
<!--
$(document).ready(function(){
	//$('#new_tesis #anio').validations('0123456789');
	$('#new_tesis #anio').datepicker({
		startView: 2,
	    language: "es",
	    minViewMode: 2,
	    autoclose: true
	});
	
});
//-->
</script>