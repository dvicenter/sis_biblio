 <label style="width: 87px;" class="control-label bold_label" for="select_man_escuela">Escuela: </label> 
		  <div class="controls">
			<select style="width:30px;"class="span3 uneditable-input" required id="select_man_escuela" disabled>
			<?php foreach($escuelas as $escuela){?>
                <option rel="<?php echo $escuela['id']?>"><?php echo $escuela['escuela']?></option>
               <?php }?>
              </select>
			<p class="help-block"></p>
		  </div>