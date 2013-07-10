<div id="new_exportar" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Exportar Tesis</h3>
  </div>
  <div class="modal-body">
    <form action="" method="POST">
      <ul class="opciones">
        <li class="opcion"><input type="checkbox" name="facultad"> Facultad </li>
        <li class="opcion"><input type="checkbox" name="escuela"> Escuela </li>
        <li class="opcion"><input type="checkbox" name="anio"> A&ntilde;o </li>
        <li class="opcion"><input type="checkbox" name="asesor"> Asesor </li>
      </ul>
      <ul class=resultado>
        <li id="facultad">
        </li>
        <li id="escuela">
          <select  >
            <option value="1">Ingenieria Sistemas</option>
          </select>
        </li>
        <li id="anio">
          <input type="date" >
        </li>
        <li id="asesor">
          <input type="text" ><a href="#" class="btn" ><i class="icon-search"></i></a>
        </li>
      </ul>
      
      
    </form>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
    <button class="btn btn-primary">Exportar</button>
  </div>
</div>
