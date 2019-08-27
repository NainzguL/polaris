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

function showLoadFailed() {
	alert("Ereur: le fichier selectioné n'est pas valide");
}

function exportJson() {
	let toExport = JSON.stringify(curentCareer);
	download("myCareer.json", toExport)
}

/**
 * Change the current career and refresh all UI element
 */
function setCurentCareer(newCareer) {
	$("#name-input").val(newCareer.id);

	for (let i = 0; i < newCareer.condition.length; i++) {
		if (newCareer.condition[i].type === CONDITION_TYPE_GRADUATE_STUDIES) {
			$("#condition-studies-check").prop('checked', true);
			let studiesSelect = $("#condition-studies-type-select");
			studiesSelect.attr("disabled", false);
			studiesSelect.val(newCareer.condition[i].val[0]);
			studiesSelect.selectpicker('refresh');
		}
		if (isConditionTypeMinXYearXp(newCareer.condition[i].type)) {
			$("#condition-exp-check").prop('checked', true);
			$("#condition-exp-year-input").val(getNumConditionTypeMinXYearXp(newCareer.condition[i].type));
			let careerSelect = $("#condition-exp-career-select");
			studiesSelect.selectpicker('val', newCareer.condition[i].val);
			studiesSelect.selectpicker('refresh');
		}
	}

	$(".competence-save").map(function(){
		if ($(this)[0].tagName.toUpperCase() !== "SELECT") {
			return;
		}
		$(this).selectpicker('val', newCareer.competence);
		$(this).selectpicker('refresh');
	});
	
	$(".bitchyCompetence-save").map(function(){
		if ($(this)[0].tagName.toUpperCase() !== "SELECT") {
			return;
		}
		$(this).selectpicker('val', newCareer.bitchyCompetence);
		$(this).selectpicker('refresh');
	});
	

	$("#competence-choice-palceholder").empty()
	for (let i = 0; i < newCareer.competenceChoice.length; i++) {
		addCmpChoiceUi(newCareer.competenceChoice[i].number, newCareer.competenceChoice[i].competence)
	}
	
	curentCareer = newCareer;
}

function openSelectFile() {
	document.getElementById("hiden-file-input").click();
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
	if ($("#condition-exp-check").is(':checked')) {
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

function addCmpChoiceUi(num, cmps) {
	let uniqueNum = competenceChoiceId++;
	let idDiv = "cmp-choice-div-"+uniqueNum;
	let idSelctNum = "cmp-choice-num-select-"+uniqueNum;
	let idSelctCmp = "cmp-choice-select-"+uniqueNum;
	let htmlCode = '<div class="form-row align-items-center competenceChoice-div-save" id="'+idDiv+'">'
		+ '<div class="col-auto">Choix: </div>'
		+ '<div class="col-auto">'
		+ '<select id="'+idSelctNum+'" class="form-control selectpicker competenceChoice-num-save" data-style="" data-style-base="form-control" data-container="body">'
		+ '<option value="1">Une</option><option value="2">Deux</option><option value="3">Trois</option>'
		+ '<option value="4">Quatre</option><option value="5">Cinq</option><option value="6">Six</option>'
		+ '<option value="7">Sept</option><option value="8">Huit</option><option value="9">Neuf</option>'
		+ '</select>'
		+ '</div>'
		+ '<div class="col-auto"> compétence(s) parmis </div>'
		+ '<div class="col-auto">'
		+ '<select id="'+idSelctCmp+'" class="form-control selectpicker competenceChoice-cmp-save" data-style="" data-style-base="form-control" data-live-search="true" data-container="body" multiple="multiple" data-selected-text-format="count > 4">';
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
	
	if (num !== undefined && cmps!== undefined && num > 0 && num < 9 && cmps.length > 0) {
		$("#"+idSelctNum).selectpicker('val', "" + num);
		$("#"+idSelctCmp).selectpicker('val', cmps);
	}
	
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
		+ '<select class="form-control selectpicker '+saveClass+'" data-style="" data-style-base="form-control" data-live-search="true" multiple="multiple" data-selected-text-format="count > 4">';
	
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

fillCareerAndStudies(career,{"etude1": "1", "etude2": "2", "etude3": "3", "science" : "Etude scientifique"});
fillComptence(comps, forCareerComps);

document.getElementById("hiden-file-input").onchange = (function (e) {
	let file = e.target.files[0]; 
	let reader = new FileReader();
	reader.readAsText(file,'UTF-8');
	reader.onload = readerEvent => {
		let content = readerEvent.target.result;
		try {
			let jsonObj = JSON.parse(content);
			let clone = cloneCareerJson(jsonObj);
			setCurentCareer(clone);
	    } catch (e) {
	    	console.error(e);
	    	showLoadFailed();
	    }
	}
});

$("#name-input").change(function(){ curentCareer.id = $(this).val(); });
$("#condition-exp-check").change(function(){ validateAndSaveCareer(true); });
$("#condition-exp-year-input").change(function(){ validateAndSaveCareer(false); });
$("#condition-exp-career-select").change(function(){ validateAndSaveCareer(false); });
$("#condition-studies-check").change(function(){validateAndSaveStudies(true); });
$("#condition-studies-type-select").change(function(){validateAndSaveStudies(false); });

$(".competence-save").change(saveCompetance);
$(".bitchyCompetence-save").change(saveCompetance);

