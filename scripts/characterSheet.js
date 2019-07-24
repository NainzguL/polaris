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

/**
 * This function compute the number of comptence point that the player must spend 
 * in order to gain one level of mastery
 * 
 * @param curentMastery an int, the current mastery level
 * @param careerCmp an bool, false if the competence is not the carrer, in this case the mastery level cost double.
 * 
 */
function getCmpPointCostOneLevel(curentMastery, careerCmp) {
	let ret =0
	if (curentMastery <= 5) {
		ret = 1;
	}
	else if (curentMastery <= 10) {
		ret = 2
	}
	else if (curentMastery <= 15) {
		ret = 3
	}
	else {
		ret = 3 + curentMastery - 15;
	}
	return careerCmp ? ret : ret*2;
}

/**
 * This function compute the number of comptence point that the player must spend 
 * in order to increase his level of mastery of mastery to the wanted value
 */
function getCmpPointCost(curentMastery, wantedMastery, careerCmp) {
	let total = 0;
	if (wantedMastery <= curentMastery) {
		return total;
	}
	for (let i = curentMastery + 1; i <= wantedMastery; i++) {
		total = total + getCmpPointCostOneLevel(i, careerCmp);
	}
	return total
}

function refreshCmpPoint() {
	let avialable = parseInt($("#year-experience-field").val()) * 20;
	let totalSpended = $(".cmp-mastery").map(function(){return getCmpPointCost(parseInt($(this).attr("min")), parseInt($(this).val()), true);})
									  .toArray()
									  .reduce(function(accumulate, val) { return accumulate + val;});
	$("#competence-point-field").val(avialable - totalSpended);
}

function refreshLeftPc() {
	var pcForPa = $("#pc-to-pa").val();
	var pcForCmp = $("#year-experience-field").val();
	$("#left-pc").val(20 - pcForPa - pcForCmp);
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
		$("#attribute-points").val($("#attribute-points").val() + 2 * $(this).val());
		refreshLeftPc();
		refreshRemainingAp();
	});
	$("#year-experience-field").change(function(){
		refreshLeftPc();
		refreshCmpPoint();
	});
	$(".attr").change(function(){
		refreshRemainingAp();
		refreshCompetence();
		refreshCmpPoint();
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
		refreshCmpPoint();
	});
});
