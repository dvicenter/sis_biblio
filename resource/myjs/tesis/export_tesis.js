$(document).ready(function(){
	$('#new_exportar').on('shown',function(){
		$('#new_exportar .export').click(function(){
			$.ajax({
				//url:base_url+'oficina_biblioteca_central/report/example_001',
				success:function(data){
					var url="https://www.facebook.com/";
					window.open(url, '_blank');
				}
			});
		});
	});
});