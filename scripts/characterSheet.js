$(function(){
	$(".used-pc").change(function(){
		$("#left-pc").val(20 - $(this).val());
	});
	$(".pc-to-pa").change(function(){
		$("#left-pc").val(20 - $(this).val());
		$("#attribute-points").val(38 + 2 * $(this).val());
	});
	$("#btn-d-for").on('click', function(){
		console.log($("#attr-FOR").val());
		if ($("#attr-FOR").val() > 7) {
			$("#attr-FOR").val(parseInt($("#attr-FOR").val()) - 1)
			$("#attribute-points").val(parseInt($("#attribute-points").val()) + 1);
		}
	});
	$("#btn-u-for").on('click', function(){
		console.log($("#attr-FOR").val());
		if ($("#attr-FOR").val() < 20) {
			$("#attr-FOR").val(parseInt($("#attr-FOR").val()) + 1)
			$("#attribute-points").val(parseInt($("#attribute-points").val()) - 1);
		}
	});
});
