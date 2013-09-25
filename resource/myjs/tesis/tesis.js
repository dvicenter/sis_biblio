$(document).ready(function(){
	cargar_facultad(2);
 	cargar_escuela(2,1);
	var autores_tesis=[];
	var pAbm;

	if($('#module_tesis').is(':visible')){
		$('#module_tesis #add_tesis').click(function(){
			pAbm=1;
			$('#new_tesis #myModalLabel').html('Agregar Tesis');
			$('#new_tesis').modal('show');


			$('#new_tesis').on('shown',function(){
				
				$('#new_tesis #titulo').focus();
				buscar_asesor();
				buscar_autor_tesis();
				
           $("#new_tesis form [name='combo_facultad']").click(function(){
				var id_f=$("#new_tesis form [name='combo_facultad'] option:selected").val();
				cargar_escuela(2,id_f);
				});
			});
			var cantidad_acompa="";
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

			
			$('#new_tesis form').submit(function(evento){
				evento.preventDefault();
				var introduccion=$('#new_tesis #input_introduccion').val();
				var objetivo=$('#new_tesis #input_objetivo').val();
				var resumen=$('#new_tesis #input_resumen').val();
				var conclusion=$('#new_tesis #input_conclusion').val();
				if(pAbm==1){
				var titulo=$('#new_tesis #titulo').val();
				var asesor=$('#new_tesis #asesor').val();
				var autor_tesis=$('#new_tesis #autor').val();
				var acompaniante=$('#new_tesis #acompaniante').val();
				var facultad=$('#new_tesis [name="combo_facultad"] option:selected').val();
				var escuela=$('#new_tesis [name="combo_escuela"] option:selected').attr('rel');
				var anio=$('#new_tesis #anio').val();
				var id_autor_tesis;
				var id_autor_acompa_tesis;
				var id_asesor;
				if(validar_asesor(asesor))
				{	if(cantidad_acompa==2){
						if(validar_autor_tesis(acompaniante))
						{
							$.each(autores_tesis,function(a,b){
								if(cantidad_acompa==2){
									if(b[1]==autor_tesis)
									{	id_autor_acompa_tesis=b[0];
									}
								}
							});
						}
						else
							{	$('#new_tesis #acompaniante').focus();
								$('#new_tesis .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Autor(es) inexistente</strong></div>");
							}
					}
					if(validar_autor_tesis(autor_tesis))
					{	console.info(anio);
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
								resumen+'&conclusion='+conclusion+'&anio='+anio+'&id_autor_acompa_tesis='+id_autor_acompa_tesis+'&id_f='+facultad+'&id_e='+escuela+"cant="+cantidad_acompa,
								dataType:'json',
								type:'post',
								success:function(data){
									$('#new_tesis').modal('hide');
									load_module_date(base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/listar_tesis', '#tesis', '#tesis_top');
								},
								error:function(){
									alert('Error al guardar');
								}
							});
						}
						else{
							$('#new_tesis #anio').focus();
							$('#new_tesis .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>A&ntilde;o inv&aacute;lido!</strong></div>");
						}
					}
					else{
						$('#new_tesis #autor').focus();
						$('#new_tesis .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Autor(es) inexistente</strong></div>");
					}
				}
				else
				{	$('#new_tesis #asesor').focus();
				$('#new_tesis .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Asesor inexistente</strong></div>");
				}}
			});
		});
		$('#module_tesis .editar').click(function(){
			pAbm=2;
			$('#new_tesis').modal('show');
			$('#new_tesis #myModalLabel').html('Editar Tesis');
			text_box(true,true,true,true);
			var pos_editar_=$("#module_tesis #table_tesis td .editar").index(this);
			pos_editar=pos_editar_+1;
			editar_tesis(pos_editar);
			$('#new_tesis form').submit(function(evento){
				var introduccion=$('#new_tesis #input_introduccion').val();
				var objetivo=$('#new_tesis #input_objetivo').val();
				var resumen=$('#new_tesis #input_resumen').val();
				var conclusion=$('#new_tesis #input_conclusion').val();
				var id_material_bibliografico=$('#new_tesis #id_material_bibliografico').attr('value');
				evento.preventDefault();
			if(pAbm==2)
			{	$.ajax({
				url:base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/editar_tesis',
				data:'id_material_bibliografico='+id_material_bibliografico+'&introduccion='+introduccion+'&objetivo='+objetivo+'&resumen='+resumen+'&conclusion='+conclusion,
				dataType:'json',
				type:'post',
				success:function(data){
					$('#new_tesis').modal('hide');
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
		$('#new_tesis').on('hide',function(){
			text_box(false,false,false,false);
			$('#new_tesis #titulo').attr('value','');
			$('#new_tesis #autor').attr('value','');
			$('#new_tesis #asesor').attr('value','');
			$('#new_tesis #anio').attr('value','');
			$('#new_tesis #input_introduccion').attr('value','');
			$('#new_tesis #input_objetivo').attr('value','');
			$('#new_tesis #input_resumen').attr('value','');
			$('#new_tesis #input_conclusion').attr('value','');
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
				$('#new_tesis #autor').typeahead().data('typeahead').source = autor_tesis;
				$('#new_tesis #acompaniante').typeahead({
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
		var titulo=$('#module_tesis #table_tesis tr:eq('+pos+') td:eq(6)').html();
		var autor_tesis=$('#module_tesis #table_tesis tr:eq('+pos+') td:eq(7)').html();
		var asesor=$('#module_tesis #table_tesis tr:eq('+pos+') td:eq(8)').html();
		var anio=$('#module_tesis #table_tesis tr:eq('+pos+') td:eq(9)').html();
		var intro=$('#module_tesis #table_tesis tr:eq('+pos+') td:eq(10)').html();
		var objetivo=$('#module_tesis #table_tesis tr:eq('+pos+') td:eq(11)').html();
		var resumen=$('#module_tesis #table_tesis tr:eq('+pos+') td:eq(12)').html();
		var conclusion=$('#module_tesis #table_tesis tr:eq('+pos+') td:eq(13)').html();
		var id_material_bibliografico=$('#module_tesis #table_tesis tr:eq('+pos+') td:eq(0)').html();
		$('#new_tesis #titulo').attr('value',titulo);
		$('#new_tesis #autor').attr('value',autor_tesis);
		$('#new_tesis #asesor').attr('value',asesor);
		$('#new_tesis #anio').attr('value',anio);
		$('#new_tesis #input_introduccion').attr('value',intro);
		$('#new_tesis #input_objetivo').attr('value',objetivo);
		$('#new_tesis #input_resumen').attr('value',resumen);
		$('#new_tesis #input_conclusion').attr('value',conclusion);
		$('#new_tesis #id_material_bibliografico').attr('value',id_material_bibliografico);
	}
	function text_box(titulo,autor,asesor,anio)
	{	$('#new_tesis #titulo').attr('disabled',titulo);
		$('#new_tesis #autor').attr('disabled',autor);
		$('#new_tesis #asesor').attr('disabled',asesor);
		$('#new_tesis #anio').attr('disabled',anio);
	}

	
});

	
