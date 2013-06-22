<div id="new_tesis" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Agregar Tesis</h3>
  </div>
  <div class="modal-body">
    <form action="nuevo.php" method="POST" >
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
      <ul class="nav nav-tabs" id="myTab">
          <li class="active"><a href="#introduccion" data-toggle="tab">Introduccion</a></li>
          <li><a href="#objetivo" data-toggle="tab">Objetivo</a></li>
          <li><a href="#resumen" data-toggle="tab">Resumen</a></li>
          <li><a href="#conclusion" data-toggle="tab">Conclusion</a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="introduccion">
            <textarea name="introduccion" rows="5" placeholder="Escriba su INTRODUCCION aqui..." required></textarea>
          </div>
          <div class="tab-pane" id="objetivo">
            <textarea name="objetivo" rows="5" placeholder="Escriba su OBJETIVO aqui..." required></textarea>
          </div>
          <div class="tab-pane" id="resumen">
            <textarea name="resumen" rows="5" placeholder="Escriba su RESUMEN aqui..." required></textarea>
          </div>
          <div class="tab-pane" id="conclusion">
            <textarea name="conclusion" rows="5" placeholder="Escriba su CONCLUSION aqui..." required></textarea>
          </div>
        </div>
        <input type="file" required>
  </div>
      <div class="modal-footer ">
        <input  type="reset" class="btn" onClick="this.form.reset();" aria-hidden="true" data-dismiss="modal" value="Cancelar"/>
        <input class="btn btn-primary" type="submit" value="Agregar"/>
      </div>
    </form>
  </div>
</div>