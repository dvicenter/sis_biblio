<?php  $datos=array(
			array($titulo='Implementaci&oacute;n de un sistema de informaci&oacute;n',$bachiller='Mariafernanda Nicho Alvarado',$asesor='Ing. Cesar Nicho Diaz',$anio='2013'),
			array($titulo='Sistema web a medidas',$bachiller='Alexander Nicho Alvarado',$asesor='Ing. Deyvis Valladares',$anio='2013'),
			array($titulo='Consultoria a la empresa FutgolPeru',$bachiller='Piero Alva Solo',$asesor='Ing. Kelly Grados Manrique',$anio='2013'),
			array($titulo='Creaci&oacute;n del sistema web',$bachiller='Lionel Messi Ronaldo',$asesor='Ing. Karina Gonzales Angulo',$anio='2013'),
			array($titulo='Implementaci&oacute;n de un sistema de informaci&oacute;n',$bachiller='Mariafernanda Nicho Alvarado',$asesor='Ing. Cesar Nicho Diaz',$anio='2013'),
			array($titulo='Sistema web a medidas',$bachiller='Alexander Nicho Alvarado',$asesor='Ing. Deyvis Valladares',$anio='2013'),
			array($titulo='Consultoria a la empresa FutgolPeru',$bachiller='Piero Alva Solo',$asesor='Ing. Kelly Grados Manrique',$anio='2013'),
			array($titulo='Creaci&oacute;n del sistema web',$bachiller='Lionel Messi Ronaldo',$asesor='Ing. Karina Gonzales Angulo',$anio='2013'),
			array($titulo='Implementaci&oacute;n de un sistema de informaci&oacute;n',$bachiller='Mariafernanda Nicho Alvarado',$asesor='Ing. Cesar Nicho Diaz',$anio='2013'),
			array($titulo='Sistema web a medidas',$bachiller='Alexander Nicho Alvarado',$asesor='Ing. Deyvis Valladares',$anio='2013')
			);?>
<div id="module_tesis">
    <ul class="control">
      <li class="menu-control"><a href="#myModal" class="btn btn-primary" data-toggle="modal"><i class="icon-plus-sign icon-white"></i> Agregar</a> </li>
      
      <li class="menu-control"><a href="" class="btn btn-info"><i class="icon-upload icon-white"></i> Exportar</a></li>
      <li class="menu-control">
        <form class="form-search span4 offset2">
          <div class="input-append">
            <input class="span3" id="appendedDropdownButton" type="text" placeholder="Buscar">
            <div class="btn-group">
              <button class="btn dropdown-toggle" data-toggle="dropdown">
                Filtro
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu">
                <li><a href="#">Titulo</a></li>
                <li><a href="#">Autor</a></li>
                <li><a href="#">Asesor</a></li>
                <li><a href="#">Año</a></li>
              </ul>
            </div>
          </div>
        </form>
      </li>
    </ul>
  <table class="table table-striped table-bordered table-condensed">
    <thead>
      <tr>
        <th class="check_table"><input type="checkbox"/></th>
        <th class="title_table">Titulo</th>
        <th class="author_table">Autor</th>
        <th class="asesor_table">Asesor</th>
        <th class="year_table">A&ntilde;o</th>
        <th class="action_table">Acci&oacute;n</th>
      </tr>
    </thead>
    <tbody>
    <?php foreach($datos as $dato){?>
      <tr>
        <td class="check_table"><input type="checkbox"/></td>
        <td><?php echo $dato[0];?></td>
        <td><?php echo $dato[1];?></td>
        <td><?php echo $dato[2];?></td>
        <td><?php echo $dato[3];?></td>
        <td>
        	<button class="btn"><i class="icon-pencil"></i></button>
        </td>
      </tr>
      <?php }?>
    </tbody>
  </table>
  <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
        <ul class="nav nav-tabs" id="myTab">
          <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
          <li><a href="#profile" data-toggle="tab">Profile</a></li>
          <li><a href="#resumen" data-toggle="tab">Resumen</a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="home">
            <textarea name="home" rows="5" placeholder="Escriba su HOME aqui..." required></textarea>
          </div>
          <div class="tab-pane" id="profile">
            <textarea name="perfile" rows="5" placeholder="Escriba su PERFILE aqui..." required></textarea>
          </div>
          <div class="tab-pane" id="resumen">
            <textarea name="resumen" rows="5" placeholder="Escriba su RESUMEN aqui..." required></textarea>
          </div>
        </div>
      <div class="modal-footer ">
        <input type="file" required>
        <input  type="reset" class="btn" onClick="this.form.reset();" aria-hidden="true" data-dismiss="modal" value="Cancelar"/>
        <input class="btn btn-primary" type="submit" value="Agregar"/>
      </div>
    </form>
  </div>
</div>
</div>