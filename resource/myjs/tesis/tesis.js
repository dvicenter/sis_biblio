$(document).ready(function(){
	var autores_tesis=[];
	if($('#module_tesis').is(':visible')){
		$('#module_tesis #add_tesis').click(function(){
			$('#new_tesis').modal('show');
			$('#new_tesis').on('shown',function(){
				$('#new_tesis #titulo').focus();
				buscar_asesor();
				buscar_autor_tesis();
				
			});
			
			$('#new_tesis form').submit(function(evento){
				evento.preventDefault();
				var titulo=$('#new_tesis #titulo').val();
			});
		});
	}
	function buscar_autor_tesis()
	{
		$.ajax({
			url:'/sis_biblio/oficina_biblioteca_central/ccoficina_biblioteca_central/buscar_autor_tesis',
			type:"POST",
			dataType:"json",
			success:function(data){
				var autor_tesis=[];
				$.each(data,function(a,b){
					autor_tesis.push(b.alumno);
					autores_tesis.push([b.id_autor_interno,b.alumno]);
				});
				$('#new_tesis #autor').typeahead().data('typeahead').source = autor_tesis;
			}
		});
	}
});