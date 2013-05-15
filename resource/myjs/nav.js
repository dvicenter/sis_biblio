$(document).ready(function(){
	$('#tesis').click(function(){
		$.ajax({
			url:'module/tesis/manager_tesis',
			beforeSend:function(data){
				$('#module_content').html('<div class="loading"><img src="resource/img/utilities/gif/loading.gif"/></div>');
			},
			success:function(data){
				active('#tesis');
				$('#module_content').html(data);
			}
		});
	});
	function active(selector)
	{
		$('.nav-list > li').removeClass('active');
		$($(selector).parent()).addClass('active');;
	}
});