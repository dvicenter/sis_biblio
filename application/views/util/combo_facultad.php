<div class="controls">
	<select class="span3" id="select_man_facultad">
	<?php foreach ($facultades as $facultad){?>
    	<option rel="<?php $facultad['id_facultad']?>"><?php echo $facultad['facultad']?></option>
    <?php }?>
	</select>
	<p class="help-block"></p>
</div>