"use strict";
const tables = {
	attributes: [0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 17, 20],
	attributesToBase: [-4, -4, -4, -4, -3, -2, -1, -1, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6],
};

function refreshRemainingAp() {
	let values = $(".attr").map(function(){return $(this).val();}).get();
	let sum = 0;
	for (let i=0; i<values.length; i++) {
		sum += tables["attributes"][parseInt(values[i]) - 1];
	}
	let attPts = 38 + $("#pc-to-pa").val() * 2;
	$("#attribute-points").val(attPts - sum);
}

function refreshOneCompetence(cmp) {
	let comp = undefined;
	let compId = cmp.attr('id').split("-")[0];
	let dependantComps = [];
	for(let categoryName in comps){
		let category = comps[categoryName];
		if(category[compId] !== undefined){
			comp = category[compId];
		}

		for(let compName in comps[categoryName]){
			if(comps[categoryName][compName].requirement !== undefined && comps[categoryName][compName].requirement[compId] !== undefined){
				let compField = $('#' + compName + '-total-field');
				if(compField.length > 0){
					dependantComps.push(compField);
				}
			}
		}
	}

	if(comp){
		//Base
		let associatedAttr = comp["attr"];
		let baseVal = 0;
		for (let i=0; i<associatedAttr.length; i++) {
			let attrVal = parseInt($("#" + associatedAttr[i] + "-field").val());
			baseVal += tables["attributesToBase"][attrVal];
		}
		$("#".concat(compId).concat("-base-field")).val(baseVal);

		//Mastery
		let mastVal = parseInt($("#".concat(compId).concat("-mastery-field")).val());

		//Total
		cmp.val(baseVal + mastVal);
		if(comp.requirement){
			let fulfillRequirements = true;
			for(let requirement in comp.requirement){
				let requiredLevel = $('#' + requirement + '-total-field').val();
				if(requiredLevel === undefined || requiredLevel < comp.requirement[requirement]){
					$(cmp).parents('tr').addClass('table-danger');
					fulfillRequirements = false;
					break;
				}
			}
			if(fulfillRequirements){
				$(cmp).parents('tr').removeClass('table-danger');
			}
		}
		
		if(dependantComps.length > 0){
			for (let i=0; i<dependantComps.length; i++) {
				//Recursive call, be careful with your comp list !
				refreshOneCompetence(dependantComps[i]);
			}
		}
	}
}

/**
 * This function compute the number of comptence point that the player must spend 
 * in order to gain one level of mastery
 * 
 * @param curentMastery an int, the current mastery level
 * @param careerCmp an bool, false if the competence is not the carrer, in this case the mastery level cost double.
 * 
 */
function getCmpPointCostOneLevel(currentMastery, careerCmp) {
	let ret = 1;
	if (currentMastery > 5) {
		ret++;
		if (currentMastery > 10) {
			ret++;
			let threshold = currentMastery - 11;
			while(threshold > 0){
				ret +=2;
				threshold--;
			}
		}
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
	return total;
}

/**
 * @returns the selecte carrer id, can return undeundefined
 */
function getSelectedCarrerId() {
	let careerSelect = document.getElementById("archetype-select");
	let careerOption = careerSelect.selectedIndex >= 0 ? careerSelect.options[careerSelect.selectedIndex] : null;
	let careerId = careerOption ? careerOption.id.split("-")[0] : null;
	return careerId;
}

function isCarrerCmp(careerId, compId) {
	if (!careerId) {
		return false;
	}
	let cmpArray = career[careerId].competence;
	if (cmpArray.includes(compId)) { 
		return true
	}
	let bitchyCompetence = career[careerId].bitchyCompetence
	for (let i = 0; i < bitchyCompetence.length; i++) {
		if (bitchyCompetence[i] === "natOriginNation") {
			//TODO find orgine nation comp
			if ("natEquinoxe" === compId) {
				return true;
			}
		}
		else {
			console.error("Unknow how to interpret this bitchy competence: " + bitchyCompetence[i])
		}
	}
	let cmpChoice = $(".carrer-cmp-choice");
	for (let i = 0; i < cmpChoice.length; i++) {
		if (cmpChoice[0].checked &&  cmpChoice[0].value === compId) {
			return true;
		}
	}
	
	return false;
}

function refreshCmpPoint() {
	let careerId = getSelectedCarrerId();
	let cumputeCmpPoint = function(){
		let compId = $(this).attr('id').split("-")[0];
		let carrerCmp = isCarrerCmp(careerId, compId);
		return getCmpPointCost(parseInt($(this).attr("min")), parseInt($(this).val()), carrerCmp);
	};
	let totalSpended = $(".cmp-mastery").map(cumputeCmpPoint)
									  .toArray()
									  .reduce(function(accumulate, val) { return accumulate + val;});
	let avialable = parseInt($("#year-experience-field").val()) * 20;
	$("#competence-point-field").val(avialable - totalSpended);
}

function refreshLeftPc() {
	var pcForPa = $("#pc-to-pa").val();
	var pcForCmp = $("#year-experience-field").val();
	$("#left-pc").val(20 - pcForPa - pcForCmp);
}

function refreshCompetences() {
	$(".cmp-total").map(function(){ refreshOneCompetence($(this)); });
}

function translate(type, value){
	if (locale[type]) {
		if(locale[type][value]){
			return locale[type][value]; 
		}
	}
	return value;
}

function updateRelation(careerIdArg) {
	let careerId = careerIdArg
	if (!careerId) {
		let careerSelect = $("#archetype-select");
		if (careerSelect[0].selectedIndex >= 0){
			careerId = careerSelect[0].options[careerSelect[0].selectedIndex].id.split("-")[0];
		}
	}

	let currentCareer = career[careerId];
	let year = $("#year-experience-field").val();	
	$("#contact-field").val(Math.floor(currentCareer.contact * year));
	$("#allySupplier-field").val(Math.floor(currentCareer.allySupplier * year));
	$("#rival-field").val(Math.floor(currentCareer.rival * year));
	$("#enemies-field").val(Math.floor(currentCareer.enemies * year));
}

function setCareer(careerId){
	let cmpChoiseHolder = $("#carrer-competence-choice");
	cmpChoiseHolder.empty();
	
	let competenceChoice = career[careerId].competenceChoice
	for (let i = 0; i < competenceChoice.length; i++) {
		let compRow = document.createElement("div");
		compRow.classList.add("form-row");
		$(compRow).append('<div class=col-auto">Choissez '+competenceChoice[i].number+' compétences parmis: </div>');
		let compArray = competenceChoice[i].competence
		for (let i = 0; i < compArray.length; i++) {
			$(compRow).append('<div class="col-auto"><label><input type="checkbox" onclick="refreshCmpPoint()" class="carrer-cmp-choice" value="'+compArray[i]+'">'+translate("competence",compArray[i])+'</label></div>');
		}
		cmpChoiseHolder.append(compRow);
	}
	updateRelation(careerId);
	refreshCmpPoint();
}

$(function(){
	$("#pc-to-pa").change(function(){
		$("#attribute-points").val($("#attribute-points").val() + 2 * $(this).val());
		refreshLeftPc();
		refreshRemainingAp();
	});
	$("#year-experience-field").change(function(){
		refreshLeftPc();
		refreshCmpPoint();
		updateRelation(null);
	});
	$(".attr").change(function(){
		refreshRemainingAp();
		refreshCompetences();
		refreshCmpPoint();
		
		let attrId = $(this).attr('id').split('-')[0];
		$('#' + attrId + '-apt-nat').val(tables["attributesToBase"][$(this).val()]);
	});
	
	//This one seems useless
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
		let categoryHidden = true;
		for(let compName in category){
			//Make X comp invisible
			if(category[compName].base !== null){
				if(categoryHidden){
					//First row of the category
					$("#compTable").append('<tr class="table-primary"><td colspan="5" class="compHeader">' + translate("competence",categoryName) + '</td></tr>');
					categoryHidden = false;
				}

				let compRow = document.createElement("tr");
				let specificity = '';
				if(category[compName].requirement){
					specificity+=' †';
				}
				if(category[compName].limiting){
					specificity+=' •';
				}
				if(category[compName].naturalIncrease){
					specificity+=' (PN)';
				}

				let baseValue = 0;
				let sum = 0;
				for (let i=0; i<category[compName].attr.length; i++) {
					let attrVal = parseInt($("#" + category[compName].attr[i] + "-field").val());
					sum += tables["attributesToBase"][attrVal];
				}
				$(this).val(sum);

				$(compRow).append('<td>' + translate("competence",compName) + specificity + '</td>')
				$(compRow).append('<td class="compAttr">' + category[compName].attr[0] + '/' + category[compName].attr[1] + '</td>');
				$(compRow).append('<td><input type="number" class="form-control cmp-base"    id="' + compName + '-base-field"    value="' + baseValue + '" readonly="readonly" /></td>');
				$(compRow).append('<td><input type="number" class="form-control cmp-mastery" id="' + compName + '-mastery-field" value="' + category[compName].base + '" min="' + category[compName].base + '" /></td>');
				$(compRow).append('<td><input type="number" class="form-control cmp-total"   id="' + compName + '-total-field"   value="' + (baseValue + category[compName].base) + '" readonly="readonly" /></td>');
				$("#compTable").append(compRow);
			}
		}
	}
	let careerSelect = $("#archetype-select");
	for (let careerId in career) {
		let localeName = translate("career", careerId);
		careerSelect.append('<option id="'+careerId+'-select-field">'+localeName+'</option>');
	}
	careerSelect.on("change", function(){
		if (careerSelect[0].selectedIndex >= 0){
			let carrerId = careerSelect[0].options[careerSelect[0].selectedIndex].id.split("-")[0];
			setCareer(carrerId);
		}
	});
	if (careerSelect[0].selectedIndex >= 0){
		let carrerId = careerSelect[0].options[careerSelect[0].selectedIndex].id.split("-")[0];
		setCareer(carrerId);
	}
	$(".cmp-mastery").on("change", function(){
		let cmpId = $(this).attr('id').split("-")[0];
		refreshOneCompetence($("#".concat(cmpId).concat("-total-field")));
		refreshCmpPoint();
	});

	refreshCompetences();
});
