$(document).ready(function(){
	var bar = $('.vou_bar');
//	var percent = $('.percent');
	var status = $('#status');
	$('#modalVoucher form').ajaxForm({
	    beforeSend: function() {
	        status.empty();
	        var percentVal = '0%';
	        bar.width(percentVal)
//	        percent.html(percentVal);
	    },
	    uploadProgress: function(event, position, total, percentComplete) {
	        var percentVal = percentComplete + '%';
	        bar.width(percentVal)
//	        percent.html(percentVal);
	    },
	    success: function() {
	        var percentVal = '100%';
	        bar.width(percentVal)
//	        percent.html(percentVal);
	        if($('.bar').attr('style')=='width: 100%;' ){
	        	$('.voucher_pro').css('display','none');
	        }
	    },
		complete: function(xhr) {
			status.html(xhr.responseText);
		}
	}); 
	$('#load_voucher').click(function(){
		$('#modalVoucher form')[0].reset();
		$('.voucher_pro').css('display','');
		$('.bar').css('width','0%');
		$('#status').html('');
		$('#modalVoucher').modal('show');
		
	});
});