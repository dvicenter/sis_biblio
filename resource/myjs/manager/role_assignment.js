var row_rol_total;
$(document).ready(function(){
	if($('#mod_role_assignment').is(':visible')){
		$("#mod_role_assignment #input_rol_asig").focus();
        $('#mod_role_assignment input[name="check_rol"]').attr('disabled',true);
        $('#mod_role_assignment input[name="check_rol_detail"]').attr('disabled',true);
		buscar_usuario_rol();
		evento_btn_asignacion(true,true,true,true,'no-drop');
		
		$('#mod_role_assignment .cancel').click(function(){
			evento_btn_asignacion(true,true,true,true,'no-drop');
			$("#mod_role_assignment #input_rol_asig").attr('disabled',false);
			$("#mod_role_assignment form")[0].reset();
			$("#mod_role_assignment #input_rol_asig").focus();
			 var trs=$("#mod_role_assignment .roles_de_usuario tr").length;
	            if(trs>0)
	            {	$("#mod_role_assignment .roles_de_usuario tr").remove();
	            }
	        $('#mod_role_assignment input[name="check_rol_user"]').attr('disabled',true);
	        $('#mod_role_assignment input[name="check_rol"]').attr('disabled',true);
	        $('#mod_role_assignment input[name="check_rol_detail"]').attr('disabled',true);
	        $('#mod_role_assignment input[name="check_rol_user"]').attr('checked',false);
	        $('#mod_role_assignment input[name="check_rol"]').attr('checked',false);
	        $('#mod_role_assignment input[name="check_rol_detail"]').attr('checked',false);
		});
		
		$('#mod_role_assignment .save').click(function(){
			var row_rol_actual=$('#mod_role_assignment table tbody.roles_de_usuario tr').length;
			var id_usuario=$("#mod_role_assignment [name='id_user']").attr('value');
			var ids=[];
			row_rol_total++;
			while(row_rol_total<=row_rol_actual)
			{	var id=$("#mod_role_assignment table tbody.roles_de_usuario tr:nth-child("+row_rol_total+") td:eq(0) [name='ckeck_rol_user_detail']").attr('value');
				ids.push(id);
				row_rol_total++;
			}
			console.info(ids);
			$.ajax({
				url:base_url+'manager/ccrol/insert_new_rol_usuario',
				data:'ids='+ids+'&id_usuario='+id_usuario,
				type:'post',
				dataType:'json',
				success:function(data){
					alert('exito');
				},
				error:function(data){
					alert('error');
				}
			});
		});
	}
	
	$.ajax({
		url:base_url+'manager/ccrol/rol',
		success:function(data){
			$('#mod_role_assignment table tbody.rol').html(data);
			$('#mod_role_assignment input[name="check_rol_detail"]').attr('disabled',true);
			var field;
			field=$("[name='check_rol_detail']");
	    	var checkflag = "false";
			$('#mod_role_assignment input[name="check_rol"]').click(function(){
				if($(this).is(":checked"))
				    {	for (i = 0; i < field.length; i++) {
			        	  field[i].checked = true;}
			        	  checkflag = "true";
	        		   }
			        else{
			        	for (i = 0; i < field.length; i++) {
		        		  field[i].checked = false; }
		        		  checkflag = "false";
			        	}
			    });
		}
	});
	$('#mod_role_assignment .delete').click(function(){
		var msg = confirm("Desea eliminar el rol asignado anteriormente?");
		if(msg){
			$('.delete').attr('disabled',true).css('cursor','no-drop');
			var ides='';
			var conjuntoides='';
			var ids = $('#mod_role_assignment input:[name="ckeck_rol_user_detail"]:checked');
			$.each(ids,function(index, value){
				  ides=ids[index].value;
				  conjuntoides=ides +','+conjuntoides;
				});
			conjuntoides+=0;
			$.ajax({
				type:'POST',
				url:base_url+'manager/ccrol/eliminar_usuario_rol',
				data :"ids="+conjuntoides,
				success: function(response)
					{	$.each(ids,function(index, value){
							 ides=ids[index].value;
							 $(ids).parent().parent().fadeOut('fast',function(){$(this).remove();});
						});
						alert('Se elimino el rol');
				    }
				});	
		}
	});
	$('#mod_role_assignment .left').click(function(){
		$('.save').attr('disabled',false).css('cursor','');
		var ids = $('#mod_role_assignment input:[name="check_rol_detail"]:checked');
		var tr=$('#mod_role_assignment table tbody.rol tr');
		$.each(tr,function(index,value){console.info(index);
			if($('#mod_role_assignment table tbody.rol tr:eq('+index+') input:[name="check_rol_detail"]').is(':checked')==true)
			{	var id=$('#mod_role_assignment table tbody.rol tr:eq('+index+') input:[name="check_rol_detail"]').val();
				var rol=$('#mod_role_assignment table tbody.rol tr:eq('+index+') td:eq(1)').html();
				var tds = '<tr>';							
				tds += "<td class='check_table'><input type='checkbox' name='ckeck_rol_user_detail' value="+id+">"+'</td>';
				tds += "<td>"+rol+"</td>";
				tds += '</tr>';
				$("#mod_role_assignment table tbody.roles_de_usuario").append(tds);
			}
        });
	});
});
	function buscar_usuario_rol()
	{	$.ajax({
			url:base_url+'manager/ccrol/buscar_usuario_rol',
			type:"POST",
			dataType:"json",
			success:function(data){
				var usuario_rol=[];
				var usuarios_rol=[];
				$.each(data,function(a,b){
				usuario_rol.push(b.usuario);
				usuarios_rol.push([b.id_usuario,b.usuario]);
				});
				$('#input_rol_asig').typeahead().data('typeahead').source = usuario_rol;
				$('#mod_role_assignment .search_usuario_rol').click(function(){
					$('#mod_role_assignment input[name="check_rol_user"]').attr('disabled',false);
					$("#mod_role_assignment #input_rol_asig").attr('disabled',true);
			        $('#mod_role_assignment input[name="check_rol"]').attr('disabled',false);
			        $('#mod_role_assignment input[name="check_rol_detail"]').attr('disabled',false);
					evento_btn_asignacion(false, true, true, false,'');
					var usuario=$('#input_rol_asig').val();
					var id_usuario;
				$.each(usuarios_rol,function(a,b){ 
					if (usuario==b[1]){
						id_usuario =b[0];
						$("#mod_role_assignment [name='id_user']").attr('value',id_usuario);
					}
					});
				$.ajax({
					url:base_url+'manager/ccrol/buscar_rol_usuario',
					data:'id_usuario='+id_usuario,
					type:'post', 
					success: function(data){
						$('#mod_role_assignment .roles_de_usuario').html(data);
						row_rol_total=$('#mod_role_assignment table tbody.roles_de_usuario tr').length;
						var field;
						field=$("[name='ckeck_rol_user_detail']");
						var checkflag = "false";
						$('#mod_role_assignment input[name="check_rol_user"]').click(function(){
							if($(this).is(":checked"))
								{	$('#mod_role_assignment .delete').attr('disabled',false).css('cursor','');	
									for (i = 0; i < field.length; i++) {
									field[i].checked = true;}
									checkflag = "true";
						        }
								else{
									$('#mod_role_assignment .delete').attr('disabled',true).css('cursor','no-drop');
									for (i = 0; i < field.length; i++) {
							        	field[i].checked = false; 
							        }
								checkflag = "false";
								}
						});
						$('#mod_role_assignment input[name="ckeck_rol_user_detail"]').click(function(){$('#mod_role_assignment .delete').attr('disabled',false).css('cursor','');});
					}
				});
				});
			
			}
		});
	}
	function evento_btn_asignacion(izquierda,eliminar,guardar,cancelar,css)
	{
		$('.left').attr('disabled',izquierda).css('cursor',css);
		if(eliminar==true){$('.delete').attr('disabled',eliminar).css('cursor','no-drop');}else{$('.delete').attr('disabled',eliminar).css('cursor','');}
		if(guardar==true){$('.save').attr('disabled',guardar).css('cursor','no-drop');}else{$('.save').attr('disabled',guardar).css('cursor','');}
		$('.cancel').attr('disabled',cancelar).css('cursor',css);
	}