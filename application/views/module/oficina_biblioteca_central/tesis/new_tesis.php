<div id="new_tesis" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
    <div class="response"></div>
    <h3 id="myModalLabel">Agregar Tesis</h3>
  </div>
  <div class="modal-body">
    <form id="form_nuevo_tesis" >
    	<input id="id_material_bibliografico" type="hidden"/>
      <fieldset> 
        <label for="titulo">Titulo:</label>
        <input autofocus="autofocus" type="text" id="titulo" data-toggle="popover" data-placement="right" data-content="" required/>
        <label for="autor">Autor:</label>
        <input type="text" id="autor" data-toggle="popover" data-placement="right" data-content="" required/>
      </fieldset>
      <fieldset>
        <label for="asesor">Asesor:</label>
        <input id="asesor" type="text" data-provide="typeahead" data-items="4" data-toggle="popover" data-placement="right" data-content="" data-source="" required>
        <label for="anio">A&ntilde;o:</label>
        <input type="text" id="anio" data-toggle="popover" data-placement="right" data-content="" required maxlength="4"/>
        
      </fieldset>
      <ul class="nav nav-tabs" id="myTab">
          <li class="active"><a href="#introduccion" data-toggle="tab">Introduccion</a></li>
          <li><a href="#objetivo" data-toggle="tab">Objetivo</a></li>
          <li><a href="#resumen" data-toggle="tab">Resumen</a></li>
          <li><a href="#conclusion" data-toggle="tab">Conclusion</a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="introduccion">
            <textarea id="input_introduccion" name="introduccion" rows="5" placeholder="Escriba su INTRODUCCION aqui..." data-toggle="popover" data-placement="bottom" data-content="" required></textarea>
          </div>
          <div class="tab-pane" id="objetivo">
            <textarea id="input_objetivo" name="objetivo" rows="5" placeholder="Escriba su OBJETIVO aqui..." data-toggle="popover" data-placement="bottom" data-content="" required></textarea>
          </div>
          <div class="tab-pane" id="resumen">
            <textarea id="input_resumen" name="resumen" rows="5" placeholder="Escriba su RESUMEN aqui..." data-toggle="popover" data-placement="bottom" data-content="" required></textarea>
          </div>
          <div class="tab-pane" id="conclusion">
            <textarea id="input_conclusion" name="conclusion" rows="5" placeholder="Escriba su CONCLUSION aqui..." data-toggle="popover" data-placement="bottom" data-content="" required></textarea>
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
	$('#new_tesis #anio').validations('0123456789');
});
//-->
</script>