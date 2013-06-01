$(document).ready(function(){
	$.ajax({
		url:'module/v_control_panel',
		beforeSend:function(data){
			$('#module_content').html('<div class="loading"><img src="resource/img/utilities/gif/loading.gif"/></div>');
		},
		success:function(data){
			$('#module_content').html(data);
		}
	});
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
	$('#constancia').click(function(){
		$.ajax({
			url:'module/constancia/manager_constancia',
			beforeSend:function(data){
				$('#module_content').html('<div class="loading"><img src="resource/img/utilities/gif/loading.gif"/></div>');
			},
			success:function(data){
				active('#constancia');
				$('#module_content').html(data);
			}
		});
	});
	$('#user').click(function(){
		$.ajax({
			url:'module/constancia/manager_constancia',
			beforeSend:function(data){
				$('#module_content').html('<div class="loading"><img src="resource/img/utilities/gif/loading.gif"/></div>');
			},
			success:function(data){
				active('#constancia');
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