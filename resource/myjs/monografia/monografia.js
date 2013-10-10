	alert("ho");
$(document).ready(function(){
	cargar_facultad(2);
 	cargar_escuela(2,1);
	var autores_tesis=[];
	var pAbm;

	if($('#module_monografia').is(':visible')){
		$('#module_monografia #add_monografia').click(function(){
			pAbm=1;
<<<<<<< HEAD
			//$('#new_monografia #myModalLabel').html('Agregar Tesis');
			alert('clik');
			$('#new_monografia').modal('show');
			});}
	});
			/*$('#new_monografia #anio input').attr('disabled',false);
=======
			$('#new_monografia #myModalLabel').html('Agregar monografia');
			$('#new_monografia #anio input').attr('disabled',false);
>>>>>>> b570503f80c0a11078b3e9eb7fc6301d86d2c249
			$('#new_monografia #anio .i_c').css('display','inline-block');
			$('#new_monografia #acompaniante').attr('disabled',true);
			$('#new_monografia [name="anio"]').attr('value','');
			$('#new_monografia .che_ac').html('<input name="acompa" type="checkbox" style="margin: 0 auto;">');
			$('#new_monografia').modal('show');
			$('#new_monografia').on('shown',function(){
				$('#new_monografia #anio').datepicker({
					startView: 2,
				    minViewMode: 2,
				    autoclose: true
				});
				$('#new_monografia #titulo').focus();
				buscar_asesor();
				buscar_autor_tesis();
				
           $("#new_monografia form [name='combo_facultad']").click(function(){
				var id_f=$("#new_monografia form [name='combo_facultad'] option:selected").val();
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

			
			$('#new_monografia form').submit(function(evento){
				evento.preventDefault();
				var introduccion=$('#new_monografia #input_introduccion').val();
				var objetivo=$('#new_monografia #input_objetivo').val();
				var resumen=$('#new_monografia #input_resumen').val();
				var conclusion=$('#new_monografia #input_conclusion').val();
				if(pAbm==1){
				var titulo=$('#new_monografia #titulo').val();
				var asesor=$('#new_monografia #asesor').val();
				var autor_tesis=$('#new_monografia #autor').val();
				var acompaniante=$('#new_monografia #acompaniante').val();
				var facultad=$('#new_monografia [name="combo_facultad"] option:selected').val();
				var escuela=$('#new_monografia [name="combo_escuela"] option:selected').attr('rel');
				var anio=$('#new_monografia [name="anio"]').val();
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
							{	$('#new_monografia #acompaniante').focus();
								$('#new_monografia .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Autor(es) inexistente</strong></div>");
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
									$('#new_monografia').modal('hide');
									load_module_date(base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/listar_tesis', '#tesis', '#tesis_top');
								},
								error:function(){
									alert('Error al guardar');
								}
							});
						}
						else{
							$('#new_monografia #anio').focus();
							$('#new_monografia .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>A&ntilde;o inv&aacute;lido!</strong></div>");
						}
					}
					else{
						$('#new_monografia #autor').focus();
						$('#new_monografia .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Autor(es) inexistente</strong></div>");
					}
				}
				else
				{	$('#new_monografia #asesor').focus();
				$('#new_monografia .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Asesor inexistente</strong></div>");
				}}
			});
		});
		$('#module_monografia .editar').click(function(){
			pAbm=2;
			$('#new_monografia').modal('show');
			$('#new_monografia #anio input').attr('disabled',true);
			$('#new_monografia #anio .i_c').css('display','none');
			$('#new_monografia .che_ac').html('');
			$('#new_monografia #myModalLabel').html('Editar Tesis');
			$('#new_monografia #acompaniante').attr('disabled',true);
			text_box(true,true,true,true);
			var pos_editar_=$("#module_monografia #table_tesis td .editar").index(this);
			pos_editar=pos_editar_+1;
			editar_tesis(pos_editar);
			$('#new_monografia form').submit(function(evento){
				var introduccion=$('#new_monografia #input_introduccion').val();
				var objetivo=$('#new_monografia #input_objetivo').val();
				var resumen=$('#new_monografia #input_resumen').val();
				var conclusion=$('#new_monografia #input_conclusion').val();
				var id_material_bibliografico=$('#new_monografia #id_material_bibliografico').attr('value');
				evento.preventDefault();
			if(pAbm==2)
			{	$.ajax({
				url:base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/editar_tesis',
				data:'id_material_bibliografico='+id_material_bibliografico+'&introduccion='+introduccion+'&objetivo='+objetivo+'&resumen='+resumen+'&conclusion='+conclusion,
				dataType:'json',
				type:'post',
				success:function(data){
					$('#new_monografia').modal('hide');
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
		$('#new_monografia').on('hide',function(){
			text_box(false,false,false,false);
			$('#new_monografia #titulo').attr('value','');
			$('#new_monografia #autor').attr('value','');
			$('#new_monografia #asesor').attr('value','');
			$('#new_monografia #anio').attr('value','');
			$('#new_monografia #input_introduccion').attr('value','');
			$('#new_monografia #input_objetivo').attr('value','');
			$('#new_monografia #input_resumen').attr('value','');
			$('#new_monografia #input_conclusion').attr('value','');
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
				$('#new_monografia #autor').typeahead({
					items:4,
					source:autor_tesis
				});
				$('#new_monografia #acompaniante').typeahead({
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
		$('#new_monografia #titulo').attr('value',titulo);
		$('#new_monografia #autor').attr('value',autor_tesis);
		$('#new_monografia #asesor').attr('value',asesor);
		$('#new_monografia [name="anio"]').attr('value',anio);
		$('#new_monografia #input_introduccion').attr('value',intro);
		$('#new_monografia #input_objetivo').attr('value',objetivo);
		$('#new_monografia #input_resumen').attr('value',resumen);
		$('#new_monografia #input_conclusion').attr('value',conclusion);
		$('#new_monografia #id_material_bibliografico').attr('value',id_material_bibliografico);
	}
	function text_box(titulo,autor,asesor,anio)
	{	$('#new_monografia #titulo').attr('disabled',titulo);
		$('#new_monografia #autor').attr('disabled',autor);
		$('#new_monografia #asesor').attr('disabled',asesor);
		$('#new_monografia #anio').attr('disabled',anio);
	}

	
});

	

*/
