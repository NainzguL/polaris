const tables = {
	attributes: [0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 9, 12, 16, 20, 25, 31, 38],
	skills: [0, 1, 2, 3, 4, 5, 7, 9, 11, 13, 15, 18, 23, 29, 35, 41, 47, 53, 59, 65]
};

function refreshRemainingAp() {
	var values = $(".attr").map(function(){return $(this).val();}).get();
	var sum = 0;
	for (i = 0; i < values.length; i++) {
		sum += tables["attributes"][parseInt(values[i]) - 1];
	}
	var attPts = 38 + $("#pc-to-pa").val() * 2;
	$("#attribute-points").val(attPts - sum);
}

$(function(){
	console.log(comps);
	$("#pc-to-pa").change(function(){
		$("#left-pc").val(20 - $(this).val());
		$("#attribute-points").val($("#attribute-points").val() + 2 * $(this).val());
		refreshRemainingAp();
	});
	$(".attr").change(function(){
		refreshRemainingAp();
	});
	$(":input[type=number]").on("change", function(){
		if (($(this).val() < $(this).attr("min")) || ($(this).val() > $(this).attr("max"))) {
			$(this).addClass("is-invalid");
		} else {
			$(this).removeClass("is-invalid");
		}
	});
});
