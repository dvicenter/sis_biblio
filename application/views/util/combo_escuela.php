<div class="controls">
	<select class="span3" required id="select_man_escuela" name="combo_escuela">
		<?php foreach($escuelas as $escuela){?>
        	<option rel="<?php echo $escuela['id_escuela']?>"><?php echo $escuela['escuela']?></option>
         <?php }?>
    </select>
</div>