USE polaris;

INSERT INTO Carrer VALUES (NULL, 'scholar', 1., 0.5, 0.5, 0.);

SET @scholar_carrer_id = (SELECT id FROM Carrer WHERE name = 'scholar');

CALL Carrer_insertPrerequisiteVal1('scholar', 'graduateStudies', 'science');

INSERT INTO CarrerCompetence VALUES(
  NULL,
  @scholar_carrer_id,
  (SELECT id FROM Competence WHERE name = 'eloquence'));
/* TODO other comp */

INSERT INTO CarrerCompetence VALUES(
  NULL,
  @scholar_carrer_id,
  (SELECT id FROM Competence WHERE name = 'natOriginNation'));

  
CALL Carrer_insertCompetenceChoice('scholar', 6, "#'knowAdministration'$#'knowAstrophysics'$#'knowBiology'$#'knowBotany'$#'knowForensics'$#'knowLaw'$#'knowEconomic'$#'knowGeology'$#'knowGeography'$#'knowHistory'$#'knowPsychology'$#'knowPhysics'$#'knowPoliticalScience'$#'knowSociology'$#'knowZoology'$");  
CALL Carrer_insertCompetenceChoice('scholar', 2, "#'natGeneticist'$#'natAllianceAzure'$#'natThemis'$");

INSERT INTO ProgressionSetEntry VALUES(NULL, @scholar_carrer_id, 0, 3, 1000);
INSERT INTO ProgressionSetEntry VALUES(NULL, @scholar_carrer_id, 3, 7, 2000);
INSERT INTO ProgressionSetEntry VALUES(NULL, @scholar_carrer_id, 6, 13, 4000);
INSERT INTO ProgressionSetEntry VALUES(NULL, @scholar_carrer_id, 13, NULL, 14000);


INSERT INTO CarrerBusinessAdvantage VALUES(
  NULL,
  @scholar_carrer_id,
  (SELECT id FROM BusinessAdvantage WHERE name = 'relationship'));
INSERT INTO CarrerBusinessAdvantage VALUES(
  NULL,
  @scholar_carrer_id,
  (SELECT id FROM BusinessAdvantage WHERE name = 'equipment'));
INSERT INTO CarrerBusinessAdvantage VALUES(
  NULL,
  @scholar_carrer_id,
  (SELECT id FROM BusinessAdvantage WHERE name = 'privateCabin'));
INSERT INTO CarrerBusinessAdvantage VALUES(
  NULL,
  @scholar_carrer_id,
  (SELECT id FROM BusinessAdvantage WHERE name = 'fame'));
INSERT INTO CarrerBusinessAdvantage VALUES(
  NULL,
  @scholar_carrer_id,
  (SELECT id FROM BusinessAdvantage WHERE name = 'dataBase'));


INSERT INTO CarrerEquipmentGroup VALUES(
  NULL,
  @scholar_carrer_id,
  (SELECT id FROM EquipmentGroup WHERE name = 'standardEquipment'));
INSERT INTO CarrerEquipmentGroup VALUES(
  NULL,
  @scholar_carrer_id,
  (SELECT id FROM EquipmentGroup WHERE name = 'translationDataDrone'));
INSERT INTO CarrerEquipmentGroup VALUES(
  NULL,
  @scholar_carrer_id,
  (SELECT id FROM EquipmentGroup WHERE name = 'computerEquipment'));
  

SET @rnd_buis_ad_id = '';
INSERT INTO RandomBusinessAdvantage VALUES (NULL, 'atrributUp', @scholar_carrer_id);
SELECT LAST_INSERT_ID() INTO @rnd_buis_ad_id;
INSERT INTO RandomBusinessAdvantageEffect VALUES (NULL,  @rnd_buis_ad_id, 
  (SELECT id FROM RandomBusinessAdvantageEffectType WHERE name = 'attribut'),
  'int', 1);
  
INSERT INTO RandomBusinessAdvantage VALUES (NULL, 'performance', @scholar_carrer_id);
SELECT LAST_INSERT_ID() INTO @rnd_buis_ad_id;
INSERT INTO RandomBusinessAdvantageEffect VALUES (NULL,  @rnd_buis_ad_id, 
  (SELECT id FROM RandomBusinessAdvantageEffectType WHERE name = 'competencePoint'),
  'playerChoice', 2);
INSERT INTO RandomBusinessAdvantageEffect VALUES (NULL,  @rnd_buis_ad_id, 
  (SELECT id FROM RandomBusinessAdvantageEffectType WHERE name = 'businessAdvantage'),
  'fame', 3);
INSERT INTO RandomBusinessAdvantageEffect VALUES (NULL,  @rnd_buis_ad_id, 
  (SELECT id FROM RandomBusinessAdvantageEffectType WHERE name = 'businessAdvantage'),
  'dataBase', 2);
/* TODO do the other buisness advantage */

/*

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
		"progression": [
			[0, 2, 1000],
			[3, 6, 2000],
			[7, 12, 4000],
			[13, null, 14000],
		],
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

*/