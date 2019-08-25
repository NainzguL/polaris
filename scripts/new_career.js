"use strict";


var curentCareer = {
	"id": "",
	"condition": [],
	"competence": [],
	"bitchyCompetence": [],
	"competenceChoice": [],
	"progression": {
	},
	"contact": 0.,
	"allySupplier": 0.,
	"rival": 0., 
	"enemies": 0.,
	"businessAdvantage": [],
	"obtainableEquipmentGroup": [],
	"randomBusinessAdvantage": [],
}

function exportJson() {
	let toExport = JSON.stringify(curentCareer);
	download("myCareer.json", toExport)
}

function fillCareerAndStudies(careers, backgrouds) {
	let careerSelect = $("#condition-exp-career-select");
	for (let careerId in careers) {
		let localeName = translate("career", careerId);
		careerSelect.append('<option value="'+careerId+'">'+localeName+'</option>');
	}
	$(careerSelect).selectpicker('refresh');
	
	let backgroudSelect = $("#condition-studies-type-select");
	for (let backgroudId in backgrouds) {
		backgroudSelect.append('<option value="'+backgroudId+'">'+backgroudId+'</option>');
	}
}

function validateAndSaveCareer(changeDisabled) {
	let yearOfXp = $("#condition-exp-year-input");
	let careerSelect = $("#condition-exp-career-select");
	removeConditionMinXYearXp(curentCareer);
	if ($("#condition-studies-check").is(':checked')) {
		if (changeDisabled) {
			yearOfXp.attr("disabled", false);
			careerSelect.attr("disabled", false);
			careerSelect.selectpicker('refresh');
		}
		let selected = careerSelect.val();
		if (selected.length > 0) {
			addCondition(curentCareer, getConditionTypeMinXYearXp(parseInt(yearOfXp.val())), selected);
		}
	}
	else {
		if (changeDisabled) {
			yearOfXp.attr("disabled", true);
			careerSelect.attr("disabled", true);
			careerSelect.selectpicker('refresh');
		}
	}
}

function validateAndSaveStudies(changeDisabled) {
	let studiesSelect = $("#condition-studies-type-select");
	removeConditionByType(curentCareer, CONDITION_TYPE_GRADUATE_STUDIES)
	if ($("#condition-studies-check").is(':checked')) {
		if (changeDisabled) {
			studiesSelect.attr("disabled", false);
			studiesSelect.selectpicker('refresh');
		}
		
		if (studiesSelect[0].selectedIndex >= 0){
			let study = studiesSelect[0].options[studiesSelect[0].selectedIndex].value;
			addCondition(curentCareer, CONDITION_TYPE_GRADUATE_STUDIES, study);
		}
	}
	else {
		if (changeDisabled) {
			studiesSelect.attr("disabled", true);
			studiesSelect.selectpicker('refresh');
		}
	}
}

function htmlForCompSelect(categoryId, category) {
	let htmlCode = '<div class="form-row">'
		+ '<div class="col-auto">'
		+ '<label>'
		+ translate("competence", categoryId) + ": "
		+ '<select class="form-control selectpicker" data-live-search="true" data-container="body" multiple="multiple" data-selected-text-format="count > 4">';
	
	for(let compId in category) {
		htmlCode = htmlCode + '<option value="'+compId+'">' + translate("competence", compId) + '</option>';
	} 
	
	htmlCode = htmlCode + '</select>'
		+ '</label>'
		+ '</div>'
		+ '</div>';
	return htmlCode;
}

function fillComptence(comps, forCareerComps) {
	
	let toFill = $("#competence-palceholder");

	for(let categoryId in comps){
		let category = comps[categoryId];
		toFill.append(htmlForCompSelect(categoryId, category));
	}

	toFill.append(htmlForCompSelect("forCarrer", forCareerComps));
}

fillCareerAndStudies(career,{"etude1": "1", "etude2": "2", "etude3": "3"});
fillComptence(comps, forCareerComps);

$("#name-input").change(function(){ curentCareer.id = $(this).val(); });
$("#condition-exp-check").change(function(){ validateAndSaveCareer(true); });
$("#condition-exp-year-input").change(function(){ validateAndSaveCareer(false); });
$("#condition-exp-career-select").change(function(){ validateAndSaveCareer(true); });
$("#condition-studies-check").change(function(){validateAndSaveStudies(false); });
$("#condition-studies-type-select").change(function(){validateAndSaveStudies(false); });



