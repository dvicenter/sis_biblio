<div class="controls">
	<select class="span3" id="select_man_facultad" name="combo_facultad">
	<?php foreach ($facultades as $facultad){?>
    	<option value="<?php echo $facultad['id_facultad']?>"><?php echo $facultad['facultad']?></option>
    <?php }?>
	</select>
</div>