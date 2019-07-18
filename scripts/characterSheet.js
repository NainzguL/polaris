const tables = {
	attributes: [0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 9, 12, 16, 20, 25, 31, 38],
	skills: [0, 1, 2, 3, 4, 5, 7, 9, 11, 13, 15, 18, 23, 29, 35, 41, 47, 53, 59, 65],
	attributesToBase: [-1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 5, 5],
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

function refreshCompetence() {
	$(".cmp-base").map(function(){
		var associatedAttr = comps[$(this).attr('id').split("-")[0]]["attr"];
		var sum = 0;
		for (i = 0; i < associatedAttr.length; i++) {
			var attrFieldId = "#".concat(associatedAttr[i]).concat("-field")
			var attrVal = $(attrFieldId).val();
			sum += tables["attributesToBase"][attrVal];
		}
		$(this).val(sum);
		});
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
		refreshCompetence();
	});
	$(":input[type=number]").on("change", function(){
		const min = parseInt($(this).attr("min"));
		const max = parseInt($(this).attr("max"));
		const n = parseInt($(this).val());
		if ((n < min) || (n > max)) {
			$(this).addClass("is-invalid");
		} else {
			$(this).removeClass("is-invalid");
		}
	});
});
