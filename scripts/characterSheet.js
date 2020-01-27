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
	validateNumField($("#attribute-points"));
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
		let mastField = $("#".concat(compId).concat("-mastery-field"));
		let mastVal = mastField.val();
		let mastMin = comp.base;
		if(mastMin === null){
			mastMin = -4;
		}

		$('.geographicOriginBonus').each(function(){
			if($(this).attr('data-comp') == compId){
				mastMin+= parseInt($(this).val());
				//Break
				return false;
			}
		});
		$('.socialOriginBonus').each(function(){
			if($(this).attr('data-comp') == compId){
				mastMin+= parseInt($(this).val());
				//Break
				return false;
			}
		});
		$('.formationOriginBonus').each(function(){
			if($(this).attr('data-comp') == compId){
				mastMin+= parseInt($(this).val());
				//Break
				return false;
			}
		});
		$('.schoolOriginBonus').each(function(){
			if($(this).attr('data-comp') == compId){
				mastMin+= parseInt($(this).val());
				//Break
				return false;
			}
		});
		
		let careerId = getSelectedCarrerId();
		if((mastMin < -3) && (mastVal === 'X' || mastVal < -3)){
			mastField.attr('type', 'text');
			mastField.val('X');
			mastField.prop('readonly', true);
			mastField.addClass('x-competence');
			cmp.attr('type', 'text');
			cmp.val('X');

			if(isCarrerCmp(careerId, compId)){
				cmp.parents('tr').show();
				cmp.parents('tr').addClass('table-warning');
			} else {
				cmp.parents('tr').hide();
			}
		} else {
			if(mastVal === 'X'){
				mastVal = mastMin;
				mastField.val(mastVal);
			} else {
				mastVal = parseInt(mastVal);
			}
			
			mastField.prop('readonly', false);
			mastField.attr('type', 'number');
			mastField.attr('min', mastMin);
			mastField.removeClass('x-competence');
			cmp.parents('tr').show();
			
			if(mastVal < mastMin){
				mastField.val(mastMin);
				mastVal = mastMin;
			}
			
			//Total
			if(comp.requirement){
				let fulfillRequirements = true;
				for(let requirement in comp.requirement){
					let requiredLevel = $('#' + requirement + '-total-field').val();
					if(requiredLevel === undefined || requiredLevel < comp.requirement[requirement]){
						fulfillRequirements = false;
						break;
					}
				}

				if(fulfillRequirements){
					cmp.parents('tr').removeClass('table-warning');
					cmp.val(baseVal + mastVal);
					cmp.attr('type', 'number')
				} else {
					cmp.parents('tr').addClass('table-warning');
					cmp.attr('type', 'text');
					cmp.val('X');
				}
			} else {
				cmp.attr('type', 'number')
				cmp.val(baseVal + mastVal);
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

function buyXcomp(compField){
	compField.val('-3');
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
			if (compId === nations[$('#belongingCommunity').val()]) {
				return true;
			}
		}
		else {
			console.error("Unknow how to interpret this bitchy competence: " + bitchyCompetence[i])
		}
	}
	let cmpChoice = $(".carrer-cmp-choice-option");
	for (let i = 0; i < cmpChoice.length; i++) {
		if (cmpChoice[i].selected && cmpChoice[i].value === compId) {
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
	validateNumField($("#competence-point-field"));
}

function refreshLeftPc() {
	var pcForPa = $("#pc-to-pa").val();
	var pcForCmp = $("#year-experience-field").val();
	$("#left-pc").val(20 - pcForPa - pcForCmp);
	validateNumField($("#left-pc"));
}

function refreshCompetences() {
	$(".cmp-total").map(function(){ refreshOneCompetence($(this)); });
}

function resetCompetences() {
	$(".cmp-mastery").map(function(){
		if($(this).val() !== 'X'){
			$(this).val($(this).attr('min'));
		}
		let cmpId = $(this).attr('id').split("-")[0];
		refreshOneCompetence($("#".concat(cmpId).concat("-total-field")));
	});
	refreshCmpPoint();
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

function upadateBusinessAdvantagePoint() {
	let yearXp = parseInt($("#year-experience-field").val());
	$("#business-advantage-point-field").val(yearXp * 5);
}

function validateBusinessAdvantagePoint() {
	let max = parseInt($("#business-advantage-point-field").val());
	let totalSpended = $(".businessAdvantage-field").map(function(val) {return parseInt($(this).val())})
									  .toArray()
									  .reduce(function(accumulate, val) { return accumulate + val;});
	if (totalSpended > max) {
		$("#business-advantage-point-field").addClass("is-invalid");
	} else {
		$("#business-advantage-point-field").removeClass("is-invalid");
	}
}

function setCareer(careerId){
	let cmpChoiseHolder = $("#carrer-competence-choice");
	cmpChoiseHolder.empty();
	let competenceChoice = career[careerId].competenceChoice;
	for (let i = 0; i < competenceChoice.length; i++) {
		let compRow = document.createElement("div");
		compRow.classList.add("form-row");
		let compCol = document.createElement("div");
		compCol.classList.add("col-auto");
		let label = document.createElement("label");
		$(label).append('Choissez '+competenceChoice[i].number+' compétences: ');
		let select = document.createElement("select");
		select.classList.add("selectpicker");
		select.classList.add("carrer-cmp-choice");
		select.setAttribute("data-style", "");
		select.setAttribute("data-style-base", "form-control");
		select.setAttribute("multiple", "multiple");
		select.setAttribute("data-selected-text-format", "count");
		select.setAttribute("data-max-options", competenceChoice[i].number);
		select.setAttribute("onchange", "refreshCompetences();refreshCmpPoint()");
		
		let compArray = competenceChoice[i].competence
		for (let i = 0; i < compArray.length; i++) {
			$(select).append('<option value="'+compArray[i]+'" class="carrer-cmp-choice-option">'+translate("competence",compArray[i])+'</option>');
		}

		label.appendChild(select);
		compCol.appendChild(label);
		compRow.appendChild(compCol);
		cmpChoiseHolder[0].appendChild(compRow);
		
		$(select).selectpicker('refresh');
	}
	
	let businessAdvantageHolder = $("#business-advantage-holder");
	businessAdvantageHolder.empty();
	let businessAdvantage = career[careerId].businessAdvantage;
	for (let i = 0; i < businessAdvantage.length; i++) {
		let compRow = document.createElement("div");
		compRow.classList.add("form-row");
		$(compRow).append('<div class=col-auto"><label>'+translate("businessAdvantage",businessAdvantage[i])+': '
				+'<input type="number" id="'+businessAdvantage[i]+'-businessAdvantage-field" value="0" min="0" class="form-control businessAdvantage-field" onchange="validateBusinessAdvantagePoint()"/>'
				+'</label></div>');
		businessAdvantageHolder.append(compRow);
	}
	
	updateRelation(careerId);
	refreshCompetences();
	refreshCmpPoint();
}

function validateNumField(field){
	let nVal = field.val();
	if (typeof nVal === typeof undefined && nVal === false) {
		return;
	}
	let n = parseInt(nVal);
	let minAttr = field.attr("min");
	if (typeof minAttr !== typeof undefined && minAttr !== false) {
	    let min = parseInt(minAttr);
	    if (n < min) {
	    	field.addClass("is-invalid");
			return;
	    }
	}
	let maxAttr = field.attr("max");
	if (typeof maxAttr !== typeof undefined && maxAttr !== false) {
		let max = parseInt(maxAttr);
		if (n > max) {
			field.addClass("is-invalid");
			return;
		}
	}
	field.removeClass("is-invalid");
};


function openSelectFile() {
	document.getElementById("hiden-file-input").click();
}

function exportCaracJson() {
	let characterSheet = newEmpyCharacterSheet();
	characterSheet.name = $("#name-input").val();
	characterSheet.archetype = $("#archetype-select").val();
	characterSheet.creation.yearExperience = parseInt($("#year-experience-field").val());
	characterSheet.careerCompetenceChoise = [];
	let cmpChoice = $(".carrer-cmp-choice-option");
	for (let i = 0; i < cmpChoice.length; i++) {
		if (cmpChoice[i].selected) {
			characterSheet.careerCompetenceChoise.push(cmpChoice[i].value);
		}
	}
	characterSheet.creation.pcToPa = parseInt($("#pc-to-pa").val());
	characterSheet.attribute.for = parseInt($("#for-field").val());
	characterSheet.attribute.con = parseInt($("#con-field").val());
	characterSheet.attribute.coo = parseInt($("#coo-field").val());
	characterSheet.attribute.ada = parseInt($("#ada-field").val());
	characterSheet.attribute.per = parseInt($("#per-field").val());
	characterSheet.attribute.int = parseInt($("#int-field").val());
	characterSheet.attribute.vol = parseInt($("#vol-field").val());
	characterSheet.attribute.pre = parseInt($("#pre-field").val());
	
	characterSheet.belongingCommunity = $('#belongingCommunity').val();
	characterSheet.geographicOrigin = $('#geographicOrigin').val();
	characterSheet.socialOrigin = $('#socialOrigin').val();
	characterSheet.formationOrigin = $('#formationOrigin').val();
	characterSheet.schoolOrigin = $('#schoolOrigin').val();
	$('select.geographicOriginChoice').each(function(){
		characterSheet.originChoices.geographic.push($(this).val());
	});
	$('select.socialOriginChoice').each(function(){
		characterSheet.originChoices.social.push($(this).val());
	});
	$('select.formationOriginChoice').each(function(){
		characterSheet.originChoices.formation.push($(this).val());
	});
	$('select.schoolOriginChoice').each(function(){
		characterSheet.originChoices.school.push($(this).val());
	});
	
	for(let categoryName in comps){
		let category = comps[categoryName];
		for(let compName in category){
			let htmlObj = $("#" + compName + "-mastery-field");
			characterSheet.competence[categoryName][compName] = parseInt(htmlObj.val());
		}
	}
	let toExport = JSON.stringify(characterSheet);
	download("myCharacterSheet.json", toExport)
}

function showLoadFailed() {
	alert("Ereur: le fichier selectioné n'est pas valide");
}

function loadCharacterSheet(characterSheet) {
	
	$("#name-input").val(characterSheet.name);
	$("#archetype-select").selectpicker('val',characterSheet.archetype);
	$("#archetype-select").selectpicker('refresh');
	setCareer(characterSheet.archetype);
	
	$("#year-experience-field").val(characterSheet.creation.yearExperience);
	$(".carrer-cmp-choice").map(function(){
		let cmpChoiseSelect = $(this);
		cmpChoiseSelect.selectpicker('val', characterSheet.careerCompetenceChoise);
		cmpChoiseSelect.selectpicker('refresh');
	});
	$("#pc-to-pa").val(characterSheet.creation.pcToPa);
	$("#for-field").val(characterSheet.attribute.for);
	$("#con-field").val(characterSheet.attribute.con);
	$("#coo-field").val(characterSheet.attribute.coo);
	$("#ada-field").val(characterSheet.attribute.ada);
	$("#per-field").val(characterSheet.attribute.per);
	$("#int-field").val(characterSheet.attribute.int);
	$("#vol-field").val(characterSheet.attribute.vol);
	$("#pre-field").val(characterSheet.attribute.pre);
	
	$('#belongingCommunity').val(characterSheet.belongingCommunity);

	$('#geographicOrigin').val(characterSheet.geographicOrigin);
	changeGeographicOrigin(characterSheet.geographicOrigin);
	let currentIndex = 0;
	$('select.geographicOriginChoice').each(function(){
		$(this).val(characterSheet.originChoices.geographic[currentIndex++])
	});

	$('#socialOrigin').val(characterSheet.socialOrigin);
	changeSocialOrigin(characterSheet.socialOrigin);
	currentIndex = 0;
	$('select.socialOriginChoice').each(function(){
		$(this).val(characterSheet.originChoices.social[currentIndex++])
	});

	$('#formationOrigin').val(characterSheet.formationOrigin);
	changeFormationOrigin(characterSheet.formationOrigin);
	currentIndex = 0;
	$('select.formationOriginChoice').each(function(){
		$(this).val(characterSheet.originChoices.formation[currentIndex++])
	});

	$('#schoolOrigin').val(characterSheet.schoolOrigin);
	changeSchoolOrigin(characterSheet.schoolOrigin);
	currentIndex = 0;
	$('select.schoolOriginChoice').each(function(){
		$(this).val(characterSheet.originChoices.school[currentIndex++])
	});

	for(let categoryName in comps){
		let category = comps[categoryName];
		for(let compName in category){
			let htmlObj = $("#" + compName + "-mastery-field");
			htmlObj.val(characterSheet.competence[categoryName][compName]);
		}
	}
	
	refreshAllNaturalAtr();
	refreshLeftPc();
	refreshRemainingAp();
	refreshCompetences();
	refreshCmpPoint();
	updateRelation(null);
	upadateBusinessAdvantagePoint();
	validateBusinessAdvantagePoint();
	validateNumField($("#attribute-points"));
}

function refreshOneNaturalAttr(attrId) {
	let attrVal = $("#" + attrId + "-field").val();
	$('#' + attrId + '-apt-nat').val(tables["attributesToBase"][attrVal]);
}

function refreshAllNaturalAtr() {
	refreshOneNaturalAttr("for");
	refreshOneNaturalAttr("con");
	refreshOneNaturalAttr("coo");
	refreshOneNaturalAttr("ada");
	refreshOneNaturalAttr("per");
	refreshOneNaturalAttr("int");
	refreshOneNaturalAttr("vol");
	refreshOneNaturalAttr("pre");
}
/*
 * Origin selectors
 */
function changeOrigin(originIdentifier, originArray, value){
	$('#' + originIdentifier + 'OriginDetails').empty();
	for(let comp in originArray[value]){
		//Technical identifier starts by a "$"
		if(comp.startsWith('$')){
			let technicalName = comp.substring(1);
			let compComunity = nations[$('#belongingCommunity').val()];
			if(technicalName == 'choice'){
				for(let i=0;i<originArray[value][comp].length;i++){
					let select = '<select class="' + originIdentifier + 'OriginChoice form-control">';
					let firstBonus = undefined;
					let firstComp = undefined;
					for(let compChoice in originArray[value][comp][i]){
						if(firstBonus === undefined){
							firstBonus = originArray[value][comp][i][compChoice];
							if(compChoice == "$belongingCommunity"){
								firstComp = compComunity;
							} else {
								firstComp = compChoice;
							}
						}
						if(compChoice == "$belongingCommunity"){
							select+= '<option value="' + compComunity + '" data-bonus="' + originArray[value][comp][i][compChoice] + '">' + translate('competence', compComunity) + '</option>';
						} else {
							select+= '<option value="' + compChoice + '" data-bonus="' + originArray[value][comp][i][compChoice] + '">' + translate('competence', compChoice) + '</option>';
						}
					}
					select+= '</select>';
					$('#' + originIdentifier + 'OriginDetails').append('<div class="form-row"><div class="col">' + select + '</div><div class="col-md-2"><input type="number" class="form-control ' + originIdentifier + 'OriginBonus" value="' + firstBonus + '" data-comp="' + firstComp + '" readonly="readonly" /></div></div>');
				}
			} else if (technicalName == 'belongingCommunity') {
				$('#' + originIdentifier + 'OriginDetails').append('<div class="form-row"><div class="col">' + translate('competence', compComunity) + '</div><div class="col-md-2"><input type="number" class="form-control ' + originIdentifier + 'OriginBonus belongingCommunity" value="' + originArray[value][comp] + '" data-comp="' + compComunity + '" readonly="readonly" /></div></div>');
			}
		} else {
			$('#' + originIdentifier + 'OriginDetails').append('<div class="form-row"><div class="col">' + translate('competence', comp) + '</div><div class="col-md-2"><input type="number" class="form-control ' + originIdentifier + 'OriginBonus" value="' + originArray[value][comp] + '" data-comp="' + comp + '" readonly="readonly" /></div></div>');
		}
	}

	refreshCompetences();
	refreshCmpPoint();
}

function changeGeographicOrigin(value){
	changeOrigin('geographic', geographicOrigin, value);
}

function changeSocialOrigin(value){
	changeOrigin('social', socialOrigin, value);
}

function changeFormationOrigin(value){
	changeOrigin('formation', formationOrigin, value);
}

function changeSchoolOrigin(value){
	changeOrigin('school', schoolOrigin, value);
}

$(function(){
	$("#pc-to-pa").change(function(){
		$("#attribute-points").val($("#attribute-points").val() + 2 * $(this).val());
		validateNumField($("#attribute-points"));
		refreshLeftPc();
		refreshRemainingAp();
	});
	$("#year-experience-field").change(function(){
		refreshLeftPc();
		refreshCmpPoint();
		updateRelation(null);
		upadateBusinessAdvantagePoint();
		validateBusinessAdvantagePoint();
	});
	$(".attr").change(function(){
		refreshRemainingAp();
		refreshCompetences();
		refreshCmpPoint();
		
		let attrId = $(this).attr('id').split('-')[0];
		refreshOneNaturalAttr(attrId);
	});
	document.getElementById("hiden-file-input").onchange = (function (e) {
		let file = e.target.files[0]; 
		let reader = new FileReader();
		reader.readAsText(file,'UTF-8');
		reader.onload = readerEvent => {
			let content = readerEvent.target.result;
			try {
				let jsonObj = JSON.parse(content);
				loadCharacterSheet(jsonObj);
		    } catch (e) {
		    	console.error(e);
		    	showLoadFailed();
		    }
		}
	});
	
	for(let categoryName in comps){
		let category = comps[categoryName];
		let categoryRow = document.createElement("tr");
		$(categoryRow).addClass('table-primary');
		$(categoryRow).attr('id', 'category-' + categoryName);
		$(categoryRow).append('<td colspan="5" class="compHeader">' + translate("competence", categoryName) + '</td>');
		$("#compTable").append(categoryRow);
		for(let compName in category){
			let compRow = document.createElement("tr");
			$(compRow).attr('id', 'competence-' + compName);
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

			$(compRow).append('<td>' + translate("competence", compName) + specificity + '</td>')
			$(compRow).append('<td class="compAttr">' + category[compName].attr[0] + '/' + category[compName].attr[1] + '</td>');
			$(compRow).append('<td><input type="number" class="form-control cmp-base"    id="' + compName + '-base-field"    value="' + baseValue + '" readonly="readonly" /></td>');
			if(category[compName].base !== null){

				$(compRow).append('<td><input type="number" class="form-control cmp-mastery" id="' + compName + '-mastery-field" value="' + category[compName].base + '" min="' + category[compName].base + '" /></td>');
				$(compRow).append('<td><input type="number" class="form-control cmp-total"   id="' + compName + '-total-field"   value="' + (baseValue + category[compName].base) + '" readonly="readonly" /></td>');
			} else {
				$(compRow).append('<td><input type="text" class="form-control cmp-mastery" id="' + compName + '-mastery-field" value="X" readonly="readonly" /></td>');
				$(compRow).append('<td><input type="text" class="form-control cmp-total"   id="' + compName + '-total-field"   value="X" readonly="readonly" /></td>');
				$(compRow).hide();
			}
			$("#compTable").append(compRow);
		}
	}

	let careerSelect = $("#archetype-select");
	for (let careerId in career) {
		let localeName = translate("career", careerId);
		careerSelect.append('<option id="'+careerId+'-select-field" value="'+careerId+'">'+localeName+'</option>');
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

	$(careerSelect).selectpicker('refresh');

	$(".cmp-mastery").on("change", function(){
		let cmpId = $(this).attr('id').split("-")[0];
		refreshOneCompetence($("#".concat(cmpId).concat("-total-field")));
		refreshCmpPoint();
	});
	
	$(document).on("click", '.x-competence', function(){
		buyXcomp($(this));
		let cmpId = $(this).attr('id').split("-")[0];
		refreshOneCompetence($("#".concat(cmpId).concat("-total-field")));
		refreshCmpPoint();
	});
	
	
	for(let name in geographicOrigin){
		$('#geographicOrigin').append('<option value="' + name + '">' + translate('origin', name) + '</option>');
	}

	for(let name in socialOrigin){
		$('#socialOrigin').append('<option value="' + name + '">' + translate('origin', name) + '</option>');
	}
	
	for(let name in formationOrigin){
		$('#formationOrigin').append('<option value="' + name + '">' + translate('origin', name) + '</option>');
	}
	
	for(let name in schoolOrigin){
		$('#schoolOrigin').append('<option value="' + name + '">' + translate('origin', name) + '</option>');
	}
	
	for(let name in nations){
		$('#belongingCommunity').append('<option value="' + name + '">' + translate('nation', name) + '</option>');
	}
	
	$('#belongingCommunity').on("change", function(){
		changeGeographicOrigin($('#geographicOrigin').val());
		changeSocialOrigin($('#socialOrigin').val());
		changeFormationOrigin($('#formationOrigin').val());
		changeSchoolOrigin($('#schoolOrigin').val());
	});

	$('#geographicOrigin').on("change", function(){
		changeGeographicOrigin($(this).val());
	});
	$('#socialOrigin').on("change", function(){
		changeSocialOrigin($(this).val());
	});
	$('#formationOrigin').on("change", function(){
		changeFormationOrigin($(this).val());
	});
	$('#schoolOrigin').on("change", function(){
		changeSchoolOrigin($(this).val());
	});
	
	$(document).on("change", '.geographicOriginChoice', function(){
		let currentOption = $(this).find(':selected');
		$(this).parent().next().children('.geographicOriginBonus:first-child').attr('data-comp',currentOption.val()).val(currentOption.attr('data-bonus'));
		refreshCompetences();
		refreshCmpPoint();
	});
	$(document).on("change", '.socialOriginChoice', function(){
		let currentOption = $(this).find(':selected');
		$(this).parent().next().children('.socialOriginBonus:first-child').attr('data-comp',currentOption.val()).val(currentOption.attr('data-bonus'));
		refreshCompetences();
		refreshCmpPoint();
	});
	$(document).on("change", '.formationOriginChoice', function(){
		let currentOption = $(this).find(':selected');
		$(this).parent().next().children('.formationOriginBonus:first-child').attr('data-comp',currentOption.val()).val(currentOption.attr('data-bonus'));
		refreshCompetences();
		refreshCmpPoint();
	});
	$(document).on("change", '.schoolOriginChoice', function(){
		let currentOption = $(this).find(':selected');
		$(this).parent().next().children('.schoolOriginBonus:first-child').attr('data-comp',currentOption.val()).val(currentOption.attr('data-bonus'));
		refreshCompetences();
		refreshCmpPoint();
	});
	
	changeGeographicOrigin($('#geographicOrigin').val());
	changeSocialOrigin($('#socialOrigin').val());
	changeFormationOrigin($('#formationOrigin').val());
});
