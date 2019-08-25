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
		console.log(selected);
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

function doTransfer() {
	let items = [{
		"language": translate("competence", "natOriginNation"),
	    "value": "natOriginNation",
	},
	{
		"language": translate("competence", "natHostNation"),
	    "value": "natHostNation",
	}];
	
	let groupData = [];
	for(let categoryName in comps){
		let category = comps[categoryName];
		let group = {
				"groupName": translate("competence",categoryName),
		        "groupData": [],
		};
		for(let compName in category) {
			let newElt = {
					"language": translate("competence", compName),
				    "value": compName,
			}
			group.groupData.push(newElt);
			items.push(newElt);
		}
		groupData.push(group);
	}
	
	let otherGroup = {
		"groupName": translate("competence","forCarrer"),
        "groupData": [],
	};
	for (let i = 0; i < forCareerComps.length; i++) {
		let compName = forCareerComps[i];
		let newElt = {
				"language": translate("competence", compName),
			    "value": compName,
		}
		otherGroup.groupData.push(newElt);
		items.push(newElt);
	}
	groupData.push(otherGroup);
	
	let settings = {
	        "inputId": "languageInput",
	        "data": items,
	        "groupData": groupData,
	        "itemName": "language",
	        "groupItemName": "groupName",
	        "groupListName" : "groupData",
	        "container": "transfer",
	        "valueName": "value",
	        "callable" : function (data, names) {
	        	//TODO
	            console.log("Selected ID：" + data)
	            $("#selectedItemSpan").text(names)
	        }
	    };
	
	Transfer.transfer(settings);
}

doTransfer();
fillCareerAndStudies(career,{"etude1": "1", "etude2": "2", "etude3": "3"});

$("#name-input").change(function(){
	curentCareer.id = $(this).val();
});
$("#condition-exp-check").change(function(){ validateAndSaveCareer(true); });
$("#condition-exp-year-input").change(function(){ validateAndSaveCareer(false); });
$("#condition-exp-career-select").change(function(){ validateAndSaveCareer(true); });
$("#condition-studies-check").change(function(){validateAndSaveStudies(false); });
$("#condition-studies-type-select").change(function(){validateAndSaveStudies(false); });



