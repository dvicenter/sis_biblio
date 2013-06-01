<div id="new_tesis" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Agregar Tesis</h3>
  </div>
  <div class="modal-body">
    <form action="">
      <fieldset> 
        <label for="titulo">Titulo:</label>
        <input type="text" id="titulo" required/>
        <label for="autor">Autor:</label>
        <input type="text" id="autor" required/>
      </fieldset>
      <fieldset>
        <label for="asesor">Asesor:</label>
        <input type="text" id="asesor" required/>
        <label for="anio">Fecha:</label>
        <input type="date" id="anio" required/>
      </fieldset>
      <div class="modal-footer ">
        <input type="file" required>
        <input  type="reset" class="btn" onClick="this.form.reset();" aria-hidden="true" data-dismiss="modal" value="Cancelar"/>
        <input class="btn btn-primary" type="submit" value="Agregar"/>
      </div>
    </form>
  </div>
</div>