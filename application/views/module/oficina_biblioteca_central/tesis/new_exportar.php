<script src="/sis_biblio/resource/myjs/tesis/export_tesis.js"></script>
<div id="new_exportar" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
    <h3 id="myModalLabel">Exportar Tesis</h3>
  </div>
  <div class="modal-body" style="overflow-y: inherit;">
    <form class="check_option" action="" method="post" style="position: relative;">
      <ul class="opciones">
        <li class="opcion"><input type="checkbox" name="facultad"> Facultad </li>
        <li class="opcion"><input type="checkbox" name="escuela" disabled> Escuela </li>
        <li class="opcion"><input type="checkbox" name="anio"> A&ntilde;o </li>
        <li class="opcion"><input type="checkbox" name="asesor"> Asesor </li>
      </ul>
      <ul class=resultado>
        <li id="facultad">
        </li>
        <li id="escuela">
        </li>
        <li id="anio">
          <input type="text" maxlength="4">
        </li>
        <li id="asesor">
          <input id="input_export_asesor" type="text" class="span3" style="margin: 0 auto;" data-provide="typeahead" data-items="4" data-toggle="popover" data-placement="right" data-content="" data-source="" required>
          <input type="hidden" name="id_input_export_asesor"/>
        </li>
      </ul>
      
      
    </form>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
    <button class="btn btn-primary export" disabled>Exportar</button>
   <!-- <a href="<?php echo base_url()?>resource/report/example_001.php" class="btn btn-primary" target="_blank">Exportar</a>-->
  </div>
</div>
<script type="text/javascript">
<!--
$(document).ready(function(){
	$('#new_exportar #anio input').validations('0123456789');
});
//-->
</script>