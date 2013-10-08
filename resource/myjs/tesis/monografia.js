$(document).ready(function(){
	cargar_facultad(2);
 	cargar_escuela(2,1);
	var autores_tesis=[];
	var pAbm;

	if($('#module_monografia').is(':visible')){
		$('#module_monografia #add_monografia').click(function(){
			pAbm=1;
			$('#monografia #myModalLabel').html('Agregar Tesis');
			$('#monografia').modal('show');
			
			$('#monografia #anio input').attr('disabled',fadatelse);
			$('#monografia #anio .i_c').css('display','inline-block');
			$('#monografia #acompaniante').attr('disabled',true);
			$('#monografia [name="anio"]').attr('value','');
			$('#monografia .che_ac').html('<input name="acompa" type="checkbox" style="margin: 0 auto;">');
			$('#monografia').on('shown',function(){
				$('#monografia #anio').datepicker({
					startView: 2,
				    minViewMode: 2,
				    autoclose: true
				});
				$('#monografia #titulo').focus();
				buscar_asesor();
				buscar_autor_tesis();
				
           $("#monografia form [name='combo_facultad']").click(function(){
				var id_f=$("#monografia form [name='combo_facultad'] option:selected").val();
				cargar_escuela(2,id_f);
				});
			});
			var cantidad_acompa=1;
			$('[name="acompa"]').click(function(){
				if ($('[name="acompa"]').is(':checked')){ 
					$('#acompaniante').attr('disabled',false);
					cantidad_acompa=2;
					$('#acompaniante').focus();
				}
				else{
					$('#acompaniante').attr('disabled',true);
					$('#acompaniante').html('').attr('value','');
					cantidad_acompa=1;
				}
			});

			
			$('#monografia form').submit(function(evento){
				evento.preventDefault();
				var introduccion=$('#monografia #input_introduccion').val();
				var objetivo=$('#monografia #input_objetivo').val();
				var resumen=$('#monografia #input_resumen').val();
				var conclusion=$('#monografia #input_conclusion').val();
				if(pAbm==1){
				var titulo=$('#monografia #titulo').val();
				var asesor=$('#monografia #asesor').val();
				var autor_tesis=$('#monografia #autor').val();
				var acompaniante=$('#monografia #acompaniante').val();
				var facultad=$('#monografia [name="combo_facultad"] option:selected').val();
				var escuela=$('#monografia [name="combo_escuela"] option:selected').attr('rel');
				var anio=$('#monografia [name="anio"]').val();
				var id_autor_tesis;
				var id_autor_acompa_tesis=0;
				var id_asesor;
				if(validar_asesor(asesor))
				{	if(cantidad_acompa==2){
						if(validar_autor_tesis(acompaniante))
						{
							$.each(autores_tesis,function(a,b){
								if(b[1]==acompaniante)
									{	id_autor_acompa_tesis=b[0];
									}
							});
						}
						else
							{	$('#monografia #acompaniante').focus();
								$('#monografia .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Autor(es) inexistente</strong></div>");
							}
					}
					if(validar_autor_tesis(autor_tesis))
					{	
						if(anio<=2155&&anio>=1901){
							$.each(autores_tesis,function(a,b){
								if(b[1]==autor_tesis)
								{	id_autor_tesis=b[0];
								}
							});
							$.each(asesores,function(a,b){
								if(b[1]==asesor)
								{	id_asesor=b[0];
								}
							});
							$.ajax({
								url:base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/insertar_tesis',
								data:'id_autor_tesis='+id_autor_tesis+'&id_asesor='+id_asesor+'&titulo='+titulo+'&introduccion='+introduccion+'&objetivo='+objetivo+'&resumen='+
								resumen+'&conclusion='+conclusion+'&anio='+anio+'&id_autor_acompa_tesis='+id_autor_acompa_tesis+"&cant="+cantidad_acompa+"&id_e="+escuela,
								dataType:'json',
								type:'post',
								success:function(data){
									$('#monografia').modal('hide');
									load_module_date(base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/listar_tesis', '#tesis', '#tesis_top');
								},
								error:function(){
									alert('Error al guardar');
								}
							});
						}
						else{
							$('#monografia #anio').focus();
							$('#monografia .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>A&ntilde;o inv&aacute;lido!</strong></div>");
						}
					}
					else{
						$('#monografia #autor').focus();
						$('#monografia .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Autor(es) inexistente</strong></div>");
					}
				}
				else
				{	$('#monografia #asesor').focus();
				$('#monografia .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Asesor inexistente</strong></div>");
				}}
			});
		});
		$('#module_monografia .editar').click(function(){
			pAbm=2;
			$('#monografia').modal('show');
			$('#monografia #anio input').attr('disabled',true);
			$('#monografia #anio .i_c').css('display','none');
			$('#monografia .che_ac').html('');
			$('#monografia #myModalLabel').html('Editar Tesis');
			$('#monografia #acompaniante').attr('disabled',true);
			text_box(true,true,true,true);
			var pos_editar_=$("#module_monografia #table_tesis td .editar").index(this);
			pos_editar=pos_editar_+1;
			editar_tesis(pos_editar);
			$('#monografia form').submit(function(evento){
				var introduccion=$('#monografia #input_introduccion').val();
				var objetivo=$('#monografia #input_objetivo').val();
				var resumen=$('#monografia #input_resumen').val();
				var conclusion=$('#monografia #input_conclusion').val();
				var id_material_bibliografico=$('#monografia #id_material_bibliografico').attr('value');
				evento.preventDefault();
			if(pAbm==2)
			{	$.ajax({
				url:base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/editar_tesis',
				data:'id_material_bibliografico='+id_material_bibliografico+'&introduccion='+introduccion+'&objetivo='+objetivo+'&resumen='+resumen+'&conclusion='+conclusion,
				dataType:'json',
				type:'post',
				success:function(data){
					$('#monografia').modal('hide');
					load_module_date('/sis_biblio/oficina_biblioteca_central/ccoficina_biblioteca_central/listar_tesis', '#tesis', '#tesis_top');
					alert('Se edito correctamente');
				},
				error:function(){
					//alert('Error al guardar');
				}
				});
			}
			});
		});
		$('#monografia').on('hide',function(){
			text_box(false,false,false,false);
			$('#monografia #titulo').attr('value','');
			$('#monografia #autor').attr('value','');
			$('#monografia #asesor').attr('value','');
			$('#monografia #anio').attr('value','');
			$('#monografia #input_introduccion').attr('value','');
			$('#monografia #input_objetivo').attr('value','');
			$('#monografia #input_resumen').attr('value','');
			$('#monografia #input_conclusion').attr('value','');
		});
	}
	function buscar_autor_tesis()
	{
		$.ajax({
			url:base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/buscar_autor_tesis',
			type:"POST",
			dataType:"json",
			success:function(data){
				var autor_tesis=[];
				$.each(data,function(a,b){
					autor_tesis.push(b.alumno);
					autores_tesis.push([b.id_autor_interno,b.alumno]);
				});
				$('#monografia #autor').typeahead({
					items:4,
					source:autor_tesis
				});
				$('#monografia #acompaniante').typeahead({
					items:4,
					source:autor_tesis
				});
			}
		});
	}
	function validar_autor_tesis(autor_tesis)
	{	var resultado=false;
		$.each(autores_tesis,function(a,b){
			if(b[1]==autor_tesis)
			{	resultado=true;
			}
		});
		return resultado;
	}
	function editar_tesis(pos){
		var titulo=$('#module_monografia #table_tesis tr:eq('+pos+') td:eq(6)').html();
		var autor_tesis=$('#module_monografia #table_tesis tr:eq('+pos+') td:eq(7)').html();
		var asesor=$('#module_monografia #table_tesis tr:eq('+pos+') td:eq(8)').html();
		var anio=$('#module_monografia #table_tesis tr:eq('+pos+') td:eq(9)').html();
		var intro=$('#module_monografia #table_tesis tr:eq('+pos+') td:eq(10)').html();
		var objetivo=$('#module_monografia #table_tesis tr:eq('+pos+') td:eq(11)').html();
		var resumen=$('#module_monografia #table_tesis tr:eq('+pos+') td:eq(12)').html();
		var conclusion=$('#module_monografia #table_tesis tr:eq('+pos+') td:eq(13)').html();
		var id_material_bibliografico=$('#module_monografia #table_tesis tr:eq('+pos+') td:eq(0)').html();
		$('#monografia #titulo').attr('value',titulo);
		$('#monografia #autor').attr('value',autor_tesis);
		$('#monografia #asesor').attr('value',asesor);
		$('#monografia [name="anio"]').attr('value',anio);
		$('#monografia #input_introduccion').attr('value',intro);
		$('#monografia #input_objetivo').attr('value',objetivo);
		$('#monografia #input_resumen').attr('value',resumen);
		$('#monografia #input_conclusion').attr('value',conclusion);
		$('#monografia #id_material_bibliografico').attr('value',id_material_bibliografico);
	}
	function text_box(titulo,autor,asesor,anio)
	{	$('#monografia #titulo').attr('disabled',titulo);
		$('#monografia #autor').attr('disabled',autor);
		$('#monografia #asesor').attr('disabled',asesor);
		$('#monografia #anio').attr('disabled',anio);
	}

	
});

	

