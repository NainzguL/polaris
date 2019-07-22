const tables = {
	attributes: [0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 9, 12, 16, 20, 25, 31, 38],
	skills: [0, 1, 2, 3, 4, 5, 7, 9, 11, 13, 15, 18, 23, 29, 35, 41, 47, 53, 59, 65],
	attributesToBase: [-1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 5, 5],
};

function refreshRemainingAp() {
	let values = $(".attr").map(function(){return $(this).val();}).get();
	let sum = 0;
	for (i = 0; i < values.length; i++) {
		sum += tables["attributes"][parseInt(values[i]) - 1];
	}
	let attPts = 38 + $("#pc-to-pa").val() * 2;
	$("#attribute-points").val(attPts - sum);
}

function refreshOneCompetence(cmp) {
	var cmpId = cmp.attr('id').split("-")[0];
	var baseVal = parseInt($("#".concat(cmpId).concat("-base-field")).val());
	var maitVal = parseInt($("#".concat(cmpId).concat("-mastery-field")).val());
	cmp.val(baseVal + maitVal);
}

function refreshCompetence() {
	$(".cmp-base").map(function(){
		let comp = undefined;
		let compName = $(this).attr('id').split("-")[0];
		for(let categoryName in comps){
			let category = comps[categoryName];
			comp = category[compName];
			if(comp){
				break;
			}
		}
		if(comp){
			let associatedAttr = comp["attr"];
			let sum = 0;
			for (i = 0; i < associatedAttr.length; i++) {
				let attrVal = parseInt($("#" + associatedAttr[i] + "-field").val());
				sum += tables["attributesToBase"][attrVal];
			}
			$(this).val(sum);
		}
	});
	$(".cmp-total").map(function(){ refreshOneCompetence($(this)); });
}

$(function(){
	console.log(comps);
	console.log(locale);
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
		let min = parseInt($(this).attr("min"));
		let max = parseInt($(this).attr("max"));
		let n = parseInt($(this).val());
		if ((n < min) || (n > max)) {
			$(this).addClass("is-invalid");
		} else {
			$(this).removeClass("is-invalid");
		}
	});
	for(let categoryName in comps){
		let category = comps[categoryName];
		$("#compTable").append('<tr class="table-primary"><td colspan="5" class="compHeader">' + locale[categoryName] + '</td></tr>');
		for(let compName in category){
			let compRow = document.createElement("tr");
			$(compRow).append('<td>' + locale[compName] + (category[compName].requirement ? ' †' : '') + '</td>')
			$(compRow).append('<td class="compAttr">' + category[compName].attr[0] + '/' + category[compName].attr[1] + '</td>')
			$(compRow).append('<td><input type="number" value="0" min="0" readonly="readonly" class="form-control cmp-base" id="' + compName + '-base-field" /></td>')
			$(compRow).append('<td><input type="number" value="' + category[compName].base + '" min="' + category[compName].base + '" max="20" class="form-control cmp-mastery" id="' + compName + '-mastery-field" /></td>')
			$(compRow).append('<td><input type="number" value="0" readonly="readonly" class="form-control cmp-total" id="' + compName + '-total-field" /></td>')
			$("#compTable").append(compRow);
		}
	}
	$(".cmp-mastery").on("change", function(){
		let cmpId = $(this).attr('id').split("-")[0];
		refreshOneCompetence($("#".concat(cmpId).concat("-total-field")));
	});
});
