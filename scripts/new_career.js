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
};

var competenceChoiceId = 0;

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

function addCmpChoiceUi() {
	let uniqueNum = competenceChoiceId++;
	let idDiv = "cmp-choice-div-"+uniqueNum;
	let idSelctNum = "cmp-choice-num-select-"+uniqueNum;
	let idSelctCmp = "cmp-choice-select-"+uniqueNum;
	let htmlCode = '<div class="form-row align-items-center competenceChoice-div-save" id="'+idDiv+'">'
		+ '<div class="col-auto">Choix: </div>'
		+ '<div class="col-auto">'
		+ '<select id="'+idSelctNum+'" class="form-control selectpicker competenceChoice-num-save" data-container="body">'
		+ '<option value="1">Une</option><option value="2">Deux</option><option value="3">Trois</option>'
		+ '<option value="4">Quatre</option><option value="5">Cinq</option><option value="6">Six</option>'
		+ '<option value="7">Sept</option><option value="8">Huit</option><option value="9">Neuf</option>'
		+ '</select>'
		+ '</div>'
		+ '<div class="col-auto"> compétence(s) parmis </div>'
		+ '<div class="col-auto">'
		+ '<select id="'+idSelctCmp+'" class="form-control selectpicker competenceChoice-cmp-save" data-live-search="true" data-container="body" multiple="multiple" data-selected-text-format="count > 4">';
	for(let categoryId in comps){
		let category = comps[categoryId];
		for(let compId in category) {
			htmlCode = htmlCode + '<option value="'+compId+'">' + translate("competence", compId) + '</option>';
		}
	}
	htmlCode = htmlCode + '</select>'
		+ '</div>'
		+ '<div class="col-auto">'
		+ '<button type="button" class="btn btn-danger" onclick="removeCmpChoice(\''+idDiv+'\')">Supprimer</button>'
		+ '</div>'
		+ '</div>';
	
	$("#competence-choice-palceholder").append(htmlCode);
	
	$("#"+idSelctNum).selectpicker('refresh');
	$("#"+idSelctCmp).selectpicker('refresh');
	
	$("#"+idSelctNum).change(saveCompetance);
	$("#"+idSelctCmp).change(saveCompetance);
}

function removeCmpChoice(toBeRemovedId) {
	var elem = document.getElementById(toBeRemovedId);
	elem.remove();
}

function saveCompetance() {
	curentCareer.competence = [];
	curentCareer.bitchyCompetence = [];
	curentCareer.competenceChoice = [];
	
	$(".competence-save").map(function(){
		if ($(this)[0].tagName.toUpperCase() !== "SELECT") {
			return;
		}
		$(this).val().map(function(value){
			curentCareer.competence.push(value);
		});
	});

	$(".bitchyCompetence-save").map(function(){
		if ($(this)[0].tagName.toUpperCase() !== "SELECT") {
			return;
		}
		$(this).val().map(function(value){
			curentCareer.bitchyCompetence.push(value);
		});
	});
	
	$(".competenceChoice-div-save").map(function(){
		let numMapArray = $(this).find(".competenceChoice-num-save").map(function(){ 
			if ($(this)[0].tagName.toUpperCase() !== "SELECT") {
				return 0;
			}
			return parseInt($(this).val());
		});
		let num = numMapArray.toArray().reduce(function(accumulate, val) { return accumulate + val;});
		
		let cmpMapArray = $(this).find(".competenceChoice-cmp-save");
		let cmps = [];
		for (let elt in cmpMapArray) {
			if (cmpMapArray[elt].tagName.toUpperCase() === "SELECT") {
				cmps = $(cmpMapArray[elt]).val();
				break;
			}
		}
		addCmpChoice(curentCareer, num, cmps);
	});
}

function htmlForCompSelect(categoryId, category, saveClass) {
	let htmlCode = '<div class="form-row">'
		+ '<div class="col-auto">'
		+ '<label>'
		+ translate("competence", categoryId) + ": "
		+ '<select class="form-control selectpicker '+saveClass+'" data-live-search="true" multiple="multiple" data-selected-text-format="count > 4">';
	
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
		toFill.append(htmlForCompSelect(categoryId, category, "competence-save"));
	}

	toFill.append(htmlForCompSelect("forCarrer", forCareerComps, "bitchyCompetence-save"));
}

fillCareerAndStudies(career,{"etude1": "1", "etude2": "2", "etude3": "3"});
fillComptence(comps, forCareerComps);

$("#name-input").change(function(){ curentCareer.id = $(this).val(); });
$("#condition-exp-check").change(function(){ validateAndSaveCareer(true); });
$("#condition-exp-year-input").change(function(){ validateAndSaveCareer(false); });
$("#condition-exp-career-select").change(function(){ validateAndSaveCareer(true); });
$("#condition-studies-check").change(function(){validateAndSaveStudies(false); });
$("#condition-studies-type-select").change(function(){validateAndSaveStudies(false); });

$(".competence-save").change(saveCompetance);
$(".bitchyCompetence-save").change(saveCompetance);

