"use strict";


var curentCareer = {
	"id": "",
	"condition": [],
	"competence": [],
	"bitchyCompetence": ["natOriginNation"],
	"competenceChoice": [],
	"progression": [
		[0, 2, 500],
		[3, 5, 1000],
		[6, null, 2000],
	],
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
	curentCareer = newCareer;
	
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
	
	fillProgressionTable();
}

function fillProgressionTable() {
	
	if (curentCareer.progression.lenght === 0) {
		curentCareer.progression = [[0, 1, 0], [2, null, 0]];
	}
	if (curentCareer.progression.lenght === 1) {
		let income = curentCareer.progression[0][2];
		curentCareer.progression = [[0, 1, income], [2, null, income]];
	}
	
	console.log(curentCareer.progression);
	
	$("#salary-progression-table").empty();
	let htmlCode = '<tr class="table-primary">'
				+ '<th>Années</th>'
				+ '<th>Économies</th>'
				+ '</tr>';
	
	for (let i = 0; i < curentCareer.progression.length; i++) {
		let elt = curentCareer.progression[i];
		if (i === 0) {
			htmlCode = htmlCode + '<tr><td>'
				+ '<div class="input-group mb-3">'
				+ '<div class="input-group-prepend">'
				+ '<span class="input-group-text">'
				+ '<span id="progression-'+i+'-from-span">0</span>&nbsp;à '
				+ '</span>'
				+ '</div>'
				+ '<input type="number" value="'+elt[1]+'" min="1" class="form-control progression-year-input" id="progression-'+i+'-to-input" />'
				+ '</div>'
				+ '</td>'
				+ '<td>'
				+ '<div class="input-group mb-3">'
				+ '<input type="number" value="'+elt[2]+'" min="0" class="form-control progression-income-input" id="progression-'+i+'-income-input"/>'
				+ '<div class="input-group-append">'
				+ '<span class="input-group-text">'
				+ ' Sol / ans'
				+ '</span>'
				+ '</div>'
				+ '</div>'
				+ '</td>'
				+ '</tr>';
		}
		else if (i === curentCareer.progression.length-1)
		{
			htmlCode = htmlCode + '<tr><td><span id="progression-'+i+'-from-span">'+elt[0]+'</span> et plus</td>'
				+ '<td>'
				+ '<div class="input-group mb-3">'
				+ '<input type="number" value="'+elt[2]+'" min="0" class="form-control progression-income-input" id="progression-'+i+'-income-input" />'
				+ '<div class="input-group-append">'
				+ '<span class="input-group-text">'
				+ ' Sol / ans'
				+ '</span>'
				+ '</div>'
				+ '</div>'
				+ '</td>'
				+ '</tr>'
				+ '<tr>'
				+ '<td colspan="2">'
				+ '<button type="button" class="btn btn-primary m-1" onclick="addNewEntry()">Ajouter une entré</button>'
				+ '<button type="button" class="btn btn-primary m-1" onclick="removeLastEntry()">Supprimer la dernier entré</button></td>'
				+ '</tr>';
		}
		else {
			htmlCode = htmlCode + '<tr>'
				+ '<td>'
				+ '<div class="input-group mb-3">'
				+ '<div class="input-group-prepend">'
				+ '<span class="input-group-text">'
				+ '<span id="progression-'+i+'-from-span">'+elt[0]+'</span>&nbsp;à '
				+ '</span>'
				+ '</div>'
				+ '<input type="number" value="'+elt[1]+'" min="'+(elt[0]+1)+'" class="form-control progression-year-input" id="progression-'+i+'-to-input" />'
				+ '</div>'
				+ '</td>'
				+ '<td>'
				+ '<div class="input-group mb-3">'
				+ '<input type="number" value="'+elt[2]+'" min="0" class="form-control progression-income-input" id="progression-'+i+'-income-input" />'
				+ '<div class="input-group-append">'
				+ '<span class="input-group-text">'
				+ ' Sol / ans'
				+ '</span>'
				+ '</div>'
				+ '</div>'
				+ '</td>'
				+ '</tr>';
			
		}
	}
		
	$("#salary-progression-table").append(htmlCode);
	
	
	updatePeriodInProgressionTable();
	
	$(".progression-year-input").change(function(){
		saveProgression();
		updatePeriodInProgressionTable();});
	$(".progression-income-input").change(function(){saveProgression();});
}


function updatePeriodInProgressionTable() {
	let from = 0;
	for (let i = 0; i < 100; i++) {
		if ($('#progression-'+i+'-to-input').length && $('#progression-'+i+'-from-span').length) {
			let nextFrom = 1 + from;
			$('#progression-'+i+'-from-span').text(""+from);
			let toInput = $('#progression-'+i+'-to-input');
			toInput.attr("min", nextFrom);
			if (parseInt(toInput.val()) < nextFrom) {
				toInput.addClass("is-invalid");
			}
			else {
				toInput.removeClass("is-invalid");
			}
			from = parseInt(toInput.val());
		}
		else {
			if ($('#progression-'+i+'-from-span').length) {
				$('#progression-'+i+'-from-span').text(""+(from));
			}
			break;
		}
	}
}

function saveProgression() {
	curentCareer.progression = [];
	let from = 0;
	for (let i = 0; i < 100; i++) {
		if ($('#progression-'+i+'-income-input').length) {
			let incomeVal = parseInt($('#progression-'+i+'-income-input').val());
			let toVal = null;
			if ($('#progression-'+i+'-to-input').length) {
				toVal = parseInt($('#progression-'+i+'-to-input').val());
			}
			if (toVal !== null && toVal <= from) {
				toVal = from + 1;
			}
			curentCareer.progression.push([from, toVal, incomeVal]);
			from = toVal;
			if (toVal === null) {
				break;
			}
		}
		else {
			break;
		}
	}
}

function addNewEntry(){
	let last = curentCareer.progression[curentCareer.progression.length-1];
	last[1] = last[0]+1;
	curentCareer.progression.push([last[1]+1, null, last[2]]);
	
	fillProgressionTable();
}

function removeLastEntry() {
	if (curentCareer.progression.length <= 3) {
		return;
	} 
	curentCareer.progression.pop()
	curentCareer.progression[curentCareer.progression.length-1][1] = null;
	
	fillProgressionTable();
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

function initPage() {
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
	
	setCurentCareer(curentCareer);
}

initPage();
