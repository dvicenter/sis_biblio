;(function( $ ) {
	

	$.fn.validCampo = function(regex,form,mensaje) {
	var resultado=0;
		var id = '#'+$(this).attr('id');
			var _this = $(id);
		   var valor = $(id).val();
		   var rex = regex;
		   var valid = rex.test(valor);
		   if (!valid)
		   { 	
		   		resultado++;
		   		_this.css({
			    	'color':'#b94a48',
			    	'border-color':'#e9322d',
			    	'box-shadow':'0px 0px 6px #f8b9b7'
		    	});
				_this.attr('data-content',mensaje);
				_this.popover('show');

		    }
		    else
		    {
		    	/*_this.css({
		    		'color':'black',
		    		'border-color': 'rgba(82, 168, 236, 0.8)',
					'outline': '0',
					'outline': 'thin dotted \9',
					//	   IE6-9 
					'box-shadow': 'inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6)'
		    	});*/
		    	_this.css({
			    	'color':'',
			    	'border-color':'',
			    	'box-shadow':''
		    	});

			    _this.popover('destroy');
		    }
		return resultado;
	}
})( jQuery );