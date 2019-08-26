
var forCareerComps = {
	"natOriginNation": {},
	"natHostNation": {},
};

var CONDITION_TYPE_GRADUATE_STUDIES = "graduateStudies";

function getConditionTypeMinXYearXp(numOfYear) {
	return "min"+numOfYear+"yearExp";
}

function isConditionTypeMinXYearXp(conditionType) {
	return conditionType.startsWith("min") && conditionType.endsWith("yearExp");
}

function getNumConditionTypeMinXYearXp(conditionType) {
	return parseint(conditionType.slice("min".length,conditionType.length - "yearExp".length));
}

function removeConditionMinXYearXp(careerArg) {
	let i = careerArg.condition.length - 1;
	while (i >= 0) {
	    if (isConditionTypeMinXYearXp(careerArg.condition[i].type)) { 
	    	careerArg.condition.splice(i, 1);
	    } 
	    i--;
	}
}

function removeConditionByType(careerArg, conditionType) {
	let i = careerArg.condition.length - 1;
	while (i >= 0) {
	    if (careerArg.condition[i].type === conditionType) { 
	    	careerArg.condition.splice(i, 1);
	    } 
	    i--;
	}
}

function addCondition(career, type, valsArg) {
	let elt = {"type": type, "val": []};
	if (Array.isArray(valsArg)) {
		elt.val = valsArg.slice();
	}
	else if (typeof(valsArg) === "string") {
		elt.val = [valsArg];
	}
	else {
		console.error("invalide value for valsArg:")
		console.error(valsArg)
	}
	career.condition.push(elt);
}

/**
 * This function add a choice of competence to the career. 
 * The duplicate competence (there are in career.competence and in cmpArray) will be remove from career competence array (the array career.competence)
 */
function addCmpChoice(careerArg, num, cmpArray) {
	let elt = {"number": parseInt(num), "competence": cmpArray.slice()}
	careerArg.competenceChoice.push(elt);
	let i = careerArg.competence.length - 1;
	while (i >= 0) {
	    if (cmpArray.includes(careerArg.competence[i])) { 
	    	careerArg.competence.splice(i, 1);
	    } 
	    i--;
	}
}


function copyStringArry(strArray) {
	let ret = [];
	for (let i = 0; i < strArray.length; i++) {
		ret.push(String(strArray[i]));
	}
	return ret;
}

function copyCondition(conditionsArray) {
	let ret = [];
	for (let i = 0; i < conditionsArray.length; i++) {
		let elt = {"type": String(conditionsArray[i].type), 
				"val": copyStringArry(conditionsArray[i].val),};
		ret.push(elt);
	}
	return ret;
}

function copyCompetenceChoice(competenceChoiceArray) {
	let ret = [];
	for (let i = 0; i < competenceChoiceArray.length; i++) {
		let elt = {"number": parseInt(competenceChoiceArray[i].number),
				"competence": copyStringArry(competenceChoiceArray[i].competence)};
		ret.push(elt);
	}
	return ret;
}

function copyProgression(progressionObj) {
	let ret = {};
	for (elt in progressionObj) {
		ret[elt] = parseInt(progressionObj[elt]);
	}
	return ret;
}


function copyRandomBusinessAdvantage(randomBusinessAdvantageArray) {
	let ret = [];
	for (let i = 0; i < randomBusinessAdvantageArray.length; i++) {
		let effectArray = [];
		for (let j = 0; j < randomBusinessAdvantageArray[i].effects.length; j++) {
			let newEffect = {"type": String(randomBusinessAdvantageArray[i].effects[j].type),
					"field": String(randomBusinessAdvantageArray[i].effects[j].field),
					"val": parseInt(randomBusinessAdvantageArray[i].effects[j].val),
					};
			effectArray.push(newEffect);
		}
		let elt = {"id": String(randomBusinessAdvantageArray[i].id),
				"effects": effectArray,};
		ret.push(elt);
	}
	return ret;
}

/**
 * Clone the given career and throw an exception if the shemas is not correct.
 */
function cloneCareerJson(jsonCareer) {
	let ret = {
			"id": String(jsonCareer.id),
			"condition": copyCondition(jsonCareer.condition),
			"competence": copyStringArry(jsonCareer.competence),
			"bitchyCompetence": copyStringArry(jsonCareer.bitchyCompetence),
			"competenceChoice": copyCompetenceChoice(jsonCareer.competenceChoice),
			"progression": copyProgression(jsonCareer.progression),
			"contact": parseFloat(jsonCareer.contact),
			"allySupplier": parseFloat(jsonCareer.allySupplier),
			"rival": parseFloat(jsonCareer.rival), 
			"enemies": parseFloat(jsonCareer.enemies),
			"businessAdvantage": copyStringArry(jsonCareer.businessAdvantage),
			"obtainableEquipmentGroup": copyStringArry(jsonCareer.obtainableEquipmentGroup),
			"randomBusinessAdvantage": copyRandomBusinessAdvantage(jsonCareer.randomBusinessAdvantage),
		};
	return ret;
}

var career = {
	"artistCraftMan": {
		"id": "artistCraftMan",
		"condition": [],
		"competence": ["armedStruggle", "education", "eloquence", /*"tradeCraft", *//*"tradeArt", */
		                "observation", ],
		"bitchyCompetence": ["natOriginNation"],
		"competenceChoice": [{"number": 3, "competence": ["singing", "storyteller", "dance", "music"]}],
		"progression": {
			"1-2": 50,
			"3-6": 1500,
			"7-12": 15000,
			"13-": 30000
		},
		"contact": 1.,
		"allySupplier": 0.5,
		"rival": 0.25, 
		"enemies": 0.,
		"businessAdvantage": ["shop", "artCraft", "fame", "relationship", "equipment"],
		"obtainableEquipmentGroup": ["standardEquipment", "craftEquipment"],
		"randomBusinessAdvantage": [
			{
				"id": "atrributUp",
				"effects": [{"type": "attribut", "field": "int", "val": 1}],
			},
			{
				"id": "performance",
				"effects": [
					{"type": "competencePoint", "field": "playerChoice", "val": 1},
				 	{"type": "businessAdvantage", "field": "artCraft", "val": 2},
				   	{"type": "businessAdvantage", "field": "fame", "val": 2},
				 ],
			},
			{
				"id": "highestStratum",
				"effects": [
					{"type": "income", "field": "oneYearMultiplier", "val": 2},
				 	{"type": "businessAdvantage", "field": "fame", "val": 4},
				   	{"type": "competencePoint", "field": "playerChoice", "val": 2},
				 	{"type": "businessAdvantage", "field": "artCraft", "val": 2},
				   	{"type": "businessAdvantage", "field": "relationship", "val": 1},
				 ],
			},
			{
				"id": "guildCompany",
				"effects": [
					{"type": "income", "field": "percentageIncreaseFromThisYear", "val": 10},
				 	{"type": "businessAdvantage", "field": "fame", "val": 2},
				   	{"type": "competencePoint", "field": "playerChoice", "val": 2},
				 	{"type": "businessAdvantage", "field": "artCraft", "val": 2},
				   	{"type": "contact", "field": "ally", "val": 1},
				 ],
			},
			{
				"id": "patron",
				"effects": [
				 	{"type": "businessAdvantage", "field": "fame", "val": 4},
				 	{"type": "businessAdvantage", "field": "artCraft", "val": 6},
					{"type": "income", "field": "percentageIncreaseFromThisYear", "val": 20},
				 	{"type": "businessAdvantage", "field": "shop", "val": 6},
				   	{"type": "contact", "field": "contact", "val": 1},
				 ],
			},
			{
				"id": "masterWork",
				"effects": [
				 	{"type": "businessAdvantage", "field": "fame", "val": 6},
					{"type": "income", "field": "oneYearMultiplier", "val": 3},
				   	{"type": "competencePoint", "field": "playerChoice", "val": 4},
				   	{"type": "businessAdvantage", "field": "relationship", "val": 2},
				 ],
			},
			{
				"id": "contract",
				"effects": [
				 	{"type": "businessAdvantage", "field": "fame", "val": 4},
				 	{"type": "businessAdvantage", "field": "artCraft", "val": 6},
					{"type": "income", "field": "percentageIncreaseFromThisYear", "val": 10},
				   	{"type": "contact", "field": "contact", "val": 1},
				 ],
			},
			{
				"id": "renown",
				"effects": [
				 	{"type": "businessAdvantage", "field": "fame", "val": 8},
					{"type": "income", "field": "percentageIncreaseFromThisYear", "val": 50},
					{"type": "competencePoint", "field": "playerChoice", "val": 2},
				 ],
			},
			{
				"id": "successfulYear",
				"effects": [
					{"type": "income", "field": "oneYearMultiplier", "val": 3},
				 	{"type": "businessAdvantage", "field": "artCraft", "val": 4},
				 ],
			},
			{
				"id": "playerChoice",
				"effects": [
					{"type": "randomBusinessAdvantage", "field": "playerChoice", "val": 1},
				 ],
			}
		],
	},
	"scholar": {
		"id": "scholar",
		"condition": [{"type": CONDITION_TYPE_GRADUATE_STUDIES, "val": ["science"]}],
		"competence": ["eloquence", "cryptography", "seeking", "onboardInstrumentation",
		                "computing", "mentalShield", "Meditation", ],
		"bitchyCompetence": ["natOriginNation"],
		"competenceChoice": [{"number": 6, 
		                      "competence": ["knowAdministration", "knowAstrophysics", "knowBiology", 
		                                     "knowBotany", "knowForensics", "knowLaw",
		                                     "knowEconomic", "knowGeology", "knowGeography",
		                                     "knowHistory", "knowPsychology", "knowPhysics",
		                                     "knowPoliticalScience", "knowSociology", "knowZoology", ]},
		                     {"number": 2, 
		                      "competence": ["natGeneticist", "natAllianceAzure", "natThemis", ]}],
		"progression": {
			"1-2": 1000,
			"3-6": 2000,
			"7-12": 4000,
			"13-": 14000,
		},
		"contact": 1.,
		"allySupplier": 0.5,
		"rival": 0.5, 
		"enemies": 0.,
		"businessAdvantage": ["relationship", "equipment", "privateCabin", "fame", "dataBase"],
		"obtainableEquipmentGroup": ["standardEquipment", "translationDataDrone", "computerEquipment",],
		"randomBusinessAdvantage": [
			{
				"id": "atrributUp",
				"effects": [{"type": "attribut", "field": "int", "val": 1}],
			},
			{
				"id": "performance",
				"effects": [
					{"type": "competencePoint", "field": "playerChoice", "val": 2},
				 	{"type": "businessAdvantage", "field": "fame", "val": 3},
				   	{"type": "businessAdvantage", "field": "dataBase", "val": 2},
				 ],
			},
			{
				"id": "exploit",
				"effects": [
					{"type": "competencePoint", "field": "playerChoice", "val": 4},
				 	{"type": "businessAdvantage", "field": "fame", "val": 4},
				   	{"type": "contact", "field": "ally", "val": 1},
				   	{"type": "contact", "field": "enemies", "val": 2},
				   	{"type": "businessAdvantage", "field": "relationship", "val": 4},
				   	{"type": "businessAdvantage", "field": "dataBase", "val": 4},
				 ],
			},
			{
				"id": "darkSecret",
				"effects": [
					{"type": "roleplayElement", "field": "secret", "val": 1},
					{"type": "competencePoint", "field": "playerChoice", "val": 6},
				 	{"type": "businessAdvantage", "field": "fame", "val": 6},
				   	{"type": "contact", "field": "rival", "val": 3},
				   	{"type": "businessAdvantage", "field": "relationship", "val": 4},
				   	{"type": "businessAdvantage", "field": "dataBase", "val": 6},
				 ],
			},
			{
				"id": "patron",
				"effects": [
					{"type": "competencePoint", "field": "playerChoice", "val": 2},
				 	{"type": "businessAdvantage", "field": "fame", "val": 2},
				   	{"type": "contact", "field": "ally", "val": 1},
					{"type": "income", "field": "oneYearMultiplier", "val": 2},
					{"type": "income", "field": "percentageIncreaseFromThisYear", "val": 20},
				   	{"type": "businessAdvantage", "field": "dataBase", "val": 4},
				 ],
			},
			{
				"id": "governmentFunding",
				"effects": [
					{"type": "competencePoint", "field": "playerChoice", "val": 3},
				 	{"type": "businessAdvantage", "field": "fame", "val": 4},
				   	{"type": "contact", "field": "ally", "val": 2},
					{"type": "income", "field": "percentageIncreaseFromThisYear", "val": 10},
				   	{"type": "businessAdvantage", "field": "dataBase", "val": 6},
				 ],
			},
			{
				"id": "scholarNetwork",
				"effects": [
				   	{"type": "businessAdvantage", "field": "relationship", "val": 6},
				 ],
			},
			{
				"id": "privateCabin",
				"effects": [
				   	{"type": "businessAdvantage", "field": "privateCabin", "val": 6},
				 ],
			},
			{
				"id": "data",
				"effects": [
				   	{"type": "businessAdvantage", "field": "dataBase", "val": 8},
				 ],
			},
			{
				"id": "playerChoice",
				"effects": [
					{"type": "randomBusinessAdvantage", "field": "playerChoice", "val": 1},
				 ],
			}
		],
	},
	//"espion": 
	"xxx": {
		"id": "xxx",
		"condition": [],
		"competence": ["xxx", "xxx", "xxx", "xxx",
		                "xxx", "xxx", "xxx", "xxx",
		                "xxx", "xxx", "xxx", "xxx",
		                "xxx", "xxx", "xxx", "xxx",
		                "xxx", "xxx", "xxx", "xxx",
		                "xxx", "xxx", "xxx", "xxx",
		                "xxx", "xxx", "xxx", "xxx",
		                "xxx", "xxx", "xxx", "xxx",
		                "xxx", "xxx", "xxx", "xxx", ],
		"bitchyCompetence": ["natOriginNation"],
		"competenceChoice": [],
		"progression": {
			"xxx": 00,
			"xxx": 00,
			"xxx": 00,
			"xxx": 00,
		},
		"contact": 1.,
		"allySupplier": 0.5,
		"rival": 0.25, 
		"enemies": 0.,
		"businessAdvantage": ["xxx", "xxx", "xxx", "xxx",],
		"obtainableEquipmentGroup": ["xxx", "xxx", "xxx", "xxx",],
		"randomBusinessAdvantage": [
			{
				"id": "atrributUp",
				"effects": [{"type": "attribut", "field": "int", "val": 1}],
			},
			{
				"id": "xxx",
				"effects": [
				 ],
			},
			{
				"id": "playerChoice",
				"effects": [
					{"type": "randomBusinessAdvantage", "field": "playerChoice", "val": 1},
				 ],
			}
		],
	},
};