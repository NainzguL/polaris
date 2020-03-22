USE polaris;


SET @school_ori_type_id = (SELECT id FROM OriginType WHERE name = 'school');


INSERT INTO Origin VALUES (NULL, 'noSchool', @school_ori_type_id);
SET @noSchool_sch_ori_id = (SELECT id FROM Origin WHERE name = 'noSchool');


INSERT INTO Origin VALUES (NULL, 'tradingSchool', @school_ori_type_id);
SET @tradingSchool_sch_ori_id = (SELECT id FROM Origin WHERE name = 'tradingSchool');


INSERT INTO Origin VALUES (NULL, 'lawSchool', @school_ori_type_id);
SET @lawSchool_sch_ori_id = (SELECT id FROM Origin WHERE name = 'lawSchool');


INSERT INTO Origin VALUES (NULL, 'engineeringSchool', @school_ori_type_id);
SET @engineeringSchool_sch_ori_id = (SELECT id FROM Origin WHERE name = 'engineeringSchool');


INSERT INTO Origin VALUES (NULL, 'militarySchool', @school_ori_type_id);
SET @militarySchool_sch_ori_id = (SELECT id FROM Origin WHERE name = 'militarySchool');


INSERT INTO Origin VALUES (NULL, 'marineSchool', @school_ori_type_id);
SET @marineSchool_sch_ori_id = (SELECT id FROM Origin WHERE name = 'marineSchool');


INSERT INTO Origin VALUES (NULL, 'medicineSchool', @school_ori_type_id);
SET @medicineSchool_sch_ori_id = (SELECT id FROM Origin WHERE name = 'medicineSchool');


INSERT INTO Origin VALUES (NULL, 'scienceSchool', @school_ori_type_id);
SET @scienceSchool_sch_ori_id = (SELECT id FROM Origin WHERE name = 'scienceSchool');


INSERT INTO Origin VALUES (NULL, 'politicsSchool', @school_ori_type_id);
SET @politicsSchool_sch_ori_id = (SELECT id FROM Origin WHERE name = 'politicsSchool');

/*

TODO
{
		"noSchool" : {
		},
		"tradingSchool" : {
			"bureaucracy": 5,
			"education": 5,
			"seeking": 2,
			"eloquence": 4,
			"$choice" : [
				{
					"tradeFood" : 3,
					"tradeRawMaterial" : 3,
					"tradeDevice" : 3,
					"tradeElectronic" : 3,
					"tradeMedical" : 3,
					"tradeInformation" : 3,
					"tradeVehicle" : 3,
					"tradeWeapon" : 3,
				},
				{
					"natHegemonie" : 3,
					"natRedLeague" : 3,
					"natCoralRepublic" : 3,
					"natEquinoxe" : 3,
					"natMediterraneanUnion" : 3,
					"natPolarAlliance" : 3,
					"natAmazonia" : 3,
					"natRiftState" : 3,
					"natEnderby" : 3,
					"natCapFederation" : 3,
					"natFuegoLibertad" : 3,
					"natLemurie" : 3,
					"natRodhia" : 3,
					"natIndus" : 3,
					"natPirate" : 3,
				},
				{
					"knowAdministration" : 3,
					"knowEconomic" : 3,
				},
			],
		},
		"lawSchool" : {
			"eloquence": 2,
			"bureaucracy": 5,
			"education": 5,
			"seeking": 3,
			"knowLaw": 4,
			"$choice" : [
				{
					"natHegemonie" : 3,
					"natRedLeague" : 3,
					"natCoralRepublic" : 3,
					"natEquinoxe" : 3,
					"natMediterraneanUnion" : 3,
					"natPolarAlliance" : 3,
					"natAmazonia" : 3,
					"natRiftState" : 3,
					"natEnderby" : 3,
					"natCapFederation" : 3,
					"natFuegoLibertad" : 3,
					"natLemurie" : 3,
					"natRodhia" : 3,
					"natIndus" : 3,
					"natPirate" : 3,
				},
				{
					"natHegemonie" : 3,
					"natRedLeague" : 3,
					"natCoralRepublic" : 3,
					"natEquinoxe" : 3,
					"natMediterraneanUnion" : 3,
					"natPolarAlliance" : 3,
					"natAmazonia" : 3,
					"natRiftState" : 3,
					"natEnderby" : 3,
					"natCapFederation" : 3,
					"natFuegoLibertad" : 3,
					"natLemurie" : 3,
					"natRodhia" : 3,
					"natIndus" : 3,
					"natPirate" : 3,
				},
			],
		},
		"EngineeringSchool" : {
			"education": 5,
			"seeking": 3,
			"electronic": 3,
			"computing": 3,
			"$choice" : [
				{
					"natHegemonie" : 2,
					"natRedLeague" : 2,
					"natCoralRepublic" : 2,
					"natEquinoxe" : 2,
					"natMediterraneanUnion" : 2,
					"natPolarAlliance" : 2,
					"natAmazonia" : 2,
					"natRiftState" : 2,
					"natEnderby" : 2,
					"natCapFederation" : 2,
					"natFuegoLibertad" : 2,
					"natLemurie" : 2,
					"natRodhia" : 2,
					"natIndus" : 2,
					"natPirate" : 2,
				},
				{
					"natHegemonie" : 2,
					"natRedLeague" : 2,
					"natCoralRepublic" : 2,
					"natEquinoxe" : 2,
					"natMediterraneanUnion" : 2,
					"natPolarAlliance" : 2,
					"natAmazonia" : 2,
					"natRiftState" : 2,
					"natEnderby" : 2,
					"natCapFederation" : 2,
					"natFuegoLibertad" : 2,
					"natLemurie" : 2,
					"natRodhia" : 2,
					"natIndus" : 2,
					"natPirate" : 2,
				},
				{
					"knowAdministration" : 4,
					"knowWeapons" : 4,
					"knowAstrophysics" : 4,
					"knowBiology" : 4,
					"knowBionic" : 4,
					"knowBiotechnology" : 4,
					"knowBotany" : 4,
					"knowForensics" : 4,
					"knowLaw" : 4,
					"knowEconomic" : 4,
					"knowGeology" : 4,
					"knowGeography" : 4,
					"knowHistory" : 4,
					"knowSoftware" : 4,
					"knowMedicine" : 4,
					"knowNanotechnology" : 4,
					"knowPharmacology" : 4,
					"knowPhysics" : 4,
					"knowPsychology" : 4,
					"knowRobotics" : 4,
					"knowPoliticalScience" : 4,
					"knowSociology" : 4,
					"knowTelecom" : 4,
					"knowZoology" : 4,
				},
				{
					"mechanicsLifeSupport" : 3,
					"mechanicsMachinery" : 3,
					"mechanicsVehicle" : 3,
					"mechanicsBattleSuits" : 3,
					"mechanicsVessel" : 3,
				},
			],
		},
		"militarySchool" : {
			"leadership": 4,
			"education": 5,
			"handguns": 3,
			"longGuns": 3,
			"natMilitary": 3,
			"$choice" : [
				{
					"natHegemonie" : 3,
					"natRedLeague" : 3,
					"natCoralRepublic" : 3,
					"natEquinoxe" : 3,
					"natMediterraneanUnion" : 3,
					"natPolarAlliance" : 3,
					"natAmazonia" : 3,
					"natRiftState" : 3,
					"natEnderby" : 3,
					"natCapFederation" : 3,
					"natFuegoLibertad" : 3,
					"natLemurie" : 3,
					"natRodhia" : 3,
					"natIndus" : 3,
					"natPirate" : 3,
				},
				{
					"navalWarfare" : 4,
					"undergroundlWarfare" : 4,
					"landCombat" : 4,
					"commandoOperation" : 4,
				},
			],
		},
		"marineSchool" : {
			"education": 5,
			"navigation": 3,
			"onboardInstrumentation": 2,
			"vesselsPilotage": 4,
			"fighterFlying": 3,
			"knowOceans": 2,
			"$choice" : [
				{
					"leadership" : 3,
					"navalWarfare" : 3,
					"undergroundlWarfare" : 3,
					"landCombat" : 3,
					"commandoOperation" : 3,
				},
				{
					"natHegemonie" : 3,
					"natRedLeague" : 3,
					"natCoralRepublic" : 3,
					"natEquinoxe" : 3,
					"natMediterraneanUnion" : 3,
					"natPolarAlliance" : 3,
					"natAmazonia" : 3,
					"natRiftState" : 3,
					"natEnderby" : 3,
					"natCapFederation" : 3,
					"natFuegoLibertad" : 3,
					"natLemurie" : 3,
					"natRodhia" : 3,
					"natIndus" : 3,
					"natPirate" : 3,
				},
			],
		},
		"medicineSchool" : {
			"psychology": 2,
			"bureaucracy": 3,
			"education": 5,
			"knowBiology": 4,
			"knowPharmacology": 3,
			"knowMedicine": 4,
			"firstAid": 4,
		},
		"scienceSchool" : {
			"education": 5,
			"seeking": 3,
			"computing": 3,
			"$choice" : [
				{
					"knowAdministration" : 5,
					"knowWeapons" : 5,
					"knowAstrophysics" : 5,
					"knowBiology" : 5,
					"knowBionic" : 5,
					"knowBiotechnology" : 5,
					"knowBotany" : 5,
					"knowForensics" : 5,
					"knowLaw" : 5,
					"knowEconomic" : 5,
					"knowGeology" : 5,
					"knowGeography" : 5,
					"knowHistory" : 5,
					"knowSoftware" : 5,
					"knowMedicine" : 5,
					"knowNanotechnology" : 5,
					"knowPharmacology" : 5,
					"knowPhysics" : 5,
					"knowPsychology" : 5,
					"knowRobotics" : 5,
					"knowPoliticalScience" : 5,
					"knowSociology" : 5,
					"knowTelecom" : 5,
					"knowZoology" : 5,
				},
				{
					"knowAdministration" : 4,
					"knowWeapons" : 4,
					"knowAstrophysics" : 4,
					"knowBiology" : 4,
					"knowBionic" : 4,
					"knowBiotechnology" : 4,
					"knowBotany" : 4,
					"knowForensics" : 4,
					"knowLaw" : 4,
					"knowEconomic" : 4,
					"knowGeology" : 4,
					"knowGeography" : 4,
					"knowHistory" : 4,
					"knowSoftware" : 4,
					"knowMedicine" : 4,
					"knowNanotechnology" : 4,
					"knowPharmacology" : 4,
					"knowPhysics" : 4,
					"knowPsychology" : 4,
					"knowRobotics" : 4,
					"knowPoliticalScience" : 4,
					"knowSociology" : 4,
					"knowTelecom" : 4,
					"knowZoology" : 4,
				},
				{
					"natHegemonie" : 3,
					"natRedLeague" : 3,
					"natCoralRepublic" : 3,
					"natEquinoxe" : 3,
					"natMediterraneanUnion" : 3,
					"natPolarAlliance" : 3,
					"natAmazonia" : 3,
					"natRiftState" : 3,
					"natEnderby" : 3,
					"natCapFederation" : 3,
					"natFuegoLibertad" : 3,
					"natLemurie" : 3,
					"natRodhia" : 3,
					"natIndus" : 3,
					"natPirate" : 3,
				},
				{
					"natHegemonie" : 2,
					"natRedLeague" : 2,
					"natCoralRepublic" : 2,
					"natEquinoxe" : 2,
					"natMediterraneanUnion" : 2,
					"natPolarAlliance" : 2,
					"natAmazonia" : 2,
					"natRiftState" : 2,
					"natEnderby" : 2,
					"natCapFederation" : 2,
					"natFuegoLibertad" : 2,
					"natLemurie" : 2,
					"natRodhia" : 2,
					"natIndus" : 2,
					"natPirate" : 2,
				},
			],
		},
		"politicsSchool" : {
			"bureaucracy": 3,
			"education": 5,
			"knowPoliticalScience": 3,
			"knowGeography": 2,
			"knowAdministration": 2,
			"$choice" : [
				{
					"knowLaw": 3,
					"knowHistory": 3,
				},
				{
					"natHegemonie" : 4,
					"natRedLeague" : 4,
					"natCoralRepublic" : 4,
					"natEquinoxe" : 4,
					"natMediterraneanUnion" : 4,
					"natPolarAlliance" : 4,
					"natAmazonia" : 4,
					"natRiftState" : 4,
					"natEnderby" : 4,
					"natCapFederation" : 4,
					"natFuegoLibertad" : 4,
					"natLemurie" : 4,
					"natRodhia" : 4,
					"natIndus" : 4,
					"natPirate" : 4,
				},
				{
					"natHegemonie" : 3,
					"natRedLeague" : 3,
					"natCoralRepublic" : 3,
					"natEquinoxe" : 3,
					"natMediterraneanUnion" : 3,
					"natPolarAlliance" : 3,
					"natAmazonia" : 3,
					"natRiftState" : 3,
					"natEnderby" : 3,
					"natCapFederation" : 3,
					"natFuegoLibertad" : 3,
					"natLemurie" : 3,
					"natRodhia" : 3,
					"natIndus" : 3,
					"natPirate" : 3,
				},
			],
		},
}

*/