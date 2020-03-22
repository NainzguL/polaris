USE polaris;


SET @formation_ori_type_id = (SELECT id FROM OriginType WHERE name = 'formation');


INSERT INTO Origin VALUES (NULL, 'crime', @formation_ori_type_id);
SET @crime_for_ori_id = (SELECT id FROM Origin WHERE name = 'crime');


INSERT INTO Origin VALUES (NULL, 'technicalFarming', @formation_ori_type_id);
SET @technicalFarming_for_ori_id = (SELECT id FROM Origin WHERE name = 'technicalFarming');


INSERT INTO Origin VALUES (NULL, 'technicalMining', @formation_ori_type_id);
SET @technicalMining_for_ori_id = (SELECT id FROM Origin WHERE name = 'technicalMining');


INSERT INTO Origin VALUES (NULL, 'technicalWorkshop', @formation_ori_type_id);
SET @technicalWorkshop_for_ori_id = (SELECT id FROM Origin WHERE name = 'technicalWorkshop');


INSERT INTO Origin VALUES (NULL, 'school', @formation_ori_type_id);
SET @school_for_ori_id = (SELECT id FROM Origin WHERE name = 'school');


INSERT INTO Origin VALUES (NULL, 'selfTaught', @formation_ori_type_id);
SET @selfTaught_for_ori_id = (SELECT id FROM Origin WHERE name = 'selfTaught');


/*

TODO

{
		"crime" : {
			"intimidation" : 1,
			"unarmedStruggle" : 1,
			"armedStruggle" : 1,
			"handguns" : 1,
			"dissimulation" : 1,
			"pickpocket" : 1,
			"security" : 1,
			"$choice" : [
				{
					"tradeWeapon" : 1,
					"tradeDrug" : 1,
				},
				{
					"natPirate" : 2,
					"natSmuggler" : 2,
					"natScavenger" : 2,
					"natCriminality" : 2,
				},
			],
		},
		"technicalFarming" : {
			"orientation" : 2,
			"education" : 1,
			"onboardInstrumentation" : 1,
			"underwaterBattlesuits" : 1,
			"hunting" : 1,
			"knowOceans" : 1,
			"farming" : 2,
			"$choice" : [
				{
					"vehicleDriving" : 1,
					"vesselsPilotage" : 1,
					"scootersDriving" : 1,
				},
			],
		},
		"technicalMining" : {
			"closeHeavyWeapons" : 2,
			"vehicleDriving" : 1,
			"knowUnderground" : 2,
			"survival" : 1,
			"explosive" : 1,
			"$choice" : [
				{
					"underwaterBattlesuits" : 2,
					"externalBattlesuits" : 2,
				},
			],
		},
		"technicalWorkshop" : {
			"bureaucracy" : 1,
			"education" : 1,
			"electronic" : 1,
			"mechanicsLifeSupport" : 2,
			"mechanicsMachinery" : 2,
			"$choice" : [
				{
					"underwaterBattlesuits" : 1,
					"externalBattlesuits" : 1,
				},
				{
					"vehicleDriving" : 1,
					"vesselsPilotage" : 1,
					"scootersDriving" : 1,
				},
				{
					"vehicleDriving" : 1,
					"vesselsPilotage" : 1,
					"scootersDriving" : 1,
				},
			],
		},
		"school" : {
			"education" : 4,
			"informatics" : 1,
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
					"knowAdministration" : 2,
					"knowWeapons" : 2,
					"knowAstrophysics" : 2,
					"knowBiology" : 2,
					"knowBionic" : 2,
					"knowBiotechnology" : 2,
					"knowBotany" : 2,
					"knowForensics" : 2,
					"knowLaw" : 2,
					"knowEconomic" : 2,
					"knowGeology" : 2,
					"knowGeography" : 2,
					"knowHistory" : 2,
					"knowSoftware" : 2,
					"knowMedicine" : 2,
					"knowNanotechnology" : 2,
					"knowPharmacology" : 2,
					"knowPhysics" : 2,
					"knowPsychology" : 2,
					"knowRobotics" : 2,
					"knowPoliticalScience" : 2,
					"knowSociology" : 2,
					"knowTelecom" : 2,
					"knowZoology" : 2,
				},
				{
					"knowAdministration" : 1,
					"knowWeapons" : 1,
					"knowAstrophysics" : 1,
					"knowBiology" : 1,
					"knowBionic" : 1,
					"knowBiotechnology" : 1,
					"knowBotany" : 1,
					"knowForensics" : 1,
					"knowLaw" : 1,
					"knowEconomic" : 1,
					"knowGeology" : 1,
					"knowGeography" : 1,
					"knowHistory" : 1,
					"knowSoftware" : 1,
					"knowMedicine" : 1,
					"knowNanotechnology" : 1,
					"knowPharmacology" : 1,
					"knowPhysics" : 1,
					"knowPsychology" : 1,
					"knowRobotics" : 1,
					"knowPoliticalScience" : 1,
					"knowSociology" : 1,
					"knowTelecom" : 1,
					"knowZoology" : 1,
				},
			],
		},
		"selfTaught" : {
			"$choice" : [
				{
					"balance" : 2,
					"athletism" : 2,
					"endurance" : 2,
					"climbing" : 2,
					"breathing" : 2,
					"closeHeavyWeapons" : 2,
					"closeSpecialWeapons" : 2,
					"unarmedStruggle" : 2,
					"armedStruggle" : 2,
					"throwingWeapons" : 2,
					"handguns" : 2,
					"rangedWeapons" : 2,
					"heavyGuns" : 2,
					"specialGuns" : 2,
					"longGuns" : 2,
					"sniper" : 2,
					"psychology" : 2,
					"leadership" : 2,
					"eloquence" : 2,
					"singing" : 2,
					"storyteller" : 2,
					"dance" : 2,
					"music" : 2,
					"intimidation" : 2,
					"gambling" : 2,
					"bureaucracy" : 2,
					"education" : 2,
					"navigation" : 2,
					"seeking" : 2,
					"tradeFood" : 2,
					"tradeRawMaterial" : 2,
					"tradeDevice" : 2,
					"tradeElectronic" : 2,
					"tradeMedical" : 2,
					"tradeInformation" : 2,
					"tradeVehicle" : 2,
					"tradeWeapon" : 2,
					"tradeDrug" : 2,
					"tradeBlack" : 2,
					"dissimulation" : 2,
					"disguise" : 2,
					"discretion" : 2,
					"escape" : 2,
					"stealth" : 2,
					"pickpocket" : 2,
					"monitoring" : 2,
					"externalBattlesuits" : 2,
					"underwaterBattlesuits" : 2,
					"fighterFlying" : 2,
					"vesselsPilotage" : 2,
					"vehicleDriving" : 2,
					"scootersDriving" : 2,
					"remotePiloting" : 2,
					"hunting" : 2,
					"knowCity" : 2,
					"knowOceans" : 2,
					"knowUnderground" : 2,
					"observation" : 2,
					"orientation" : 2,
					"survival" : 2,
					"firstAid" : 2,
					"onboardInstrumentation" : 2,
					"farming" : 2,
					"animalsTraining" : 2,
					"electronic" : 2,
					"explosive" : 2,
					"computing" : 2,
					"mechanicsLifeSupport" : 2,
					"mechanicsMachinery" : 2,
					"mechanicsVehicle" : 2,
					"mechanicsBattleSuits" : 2,
					"mechanicsVessel" : 2,
					"traps" : 2,
					"$belongingCommunity" : 2,
				},
				{
					"balance" : 2,
					"athletism" : 2,
					"endurance" : 2,
					"climbing" : 2,
					"breathing" : 2,
					"closeHeavyWeapons" : 2,
					"closeSpecialWeapons" : 2,
					"unarmedStruggle" : 2,
					"armedStruggle" : 2,
					"throwingWeapons" : 2,
					"handguns" : 2,
					"rangedWeapons" : 2,
					"heavyGuns" : 2,
					"specialGuns" : 2,
					"longGuns" : 2,
					"sniper" : 2,
					"psychology" : 2,
					"leadership" : 2,
					"eloquence" : 2,
					"singing" : 2,
					"storyteller" : 2,
					"dance" : 2,
					"music" : 2,
					"intimidation" : 2,
					"gambling" : 2,
					"bureaucracy" : 2,
					"education" : 2,
					"navigation" : 2,
					"seeking" : 2,
					"tradeFood" : 2,
					"tradeRawMaterial" : 2,
					"tradeDevice" : 2,
					"tradeElectronic" : 2,
					"tradeMedical" : 2,
					"tradeInformation" : 2,
					"tradeVehicle" : 2,
					"tradeWeapon" : 2,
					"tradeDrug" : 2,
					"tradeBlack" : 2,
					"dissimulation" : 2,
					"disguise" : 2,
					"discretion" : 2,
					"escape" : 2,
					"stealth" : 2,
					"pickpocket" : 2,
					"monitoring" : 2,
					"externalBattlesuits" : 2,
					"underwaterBattlesuits" : 2,
					"fighterFlying" : 2,
					"vesselsPilotage" : 2,
					"vehicleDriving" : 2,
					"scootersDriving" : 2,
					"remotePiloting" : 2,
					"hunting" : 2,
					"knowCity" : 2,
					"knowOceans" : 2,
					"knowUnderground" : 2,
					"observation" : 2,
					"orientation" : 2,
					"survival" : 2,
					"firstAid" : 2,
					"onboardInstrumentation" : 2,
					"farming" : 2,
					"animalsTraining" : 2,
					"electronic" : 2,
					"explosive" : 2,
					"computing" : 2,
					"mechanicsLifeSupport" : 2,
					"mechanicsMachinery" : 2,
					"mechanicsVehicle" : 2,
					"mechanicsBattleSuits" : 2,
					"mechanicsVessel" : 2,
					"traps" : 2,
					"$belongingCommunity" : 2,
				},
				{
					"balance" : 2,
					"athletism" : 2,
					"endurance" : 2,
					"climbing" : 2,
					"breathing" : 2,
					"closeHeavyWeapons" : 2,
					"closeSpecialWeapons" : 2,
					"unarmedStruggle" : 2,
					"armedStruggle" : 2,
					"throwingWeapons" : 2,
					"handguns" : 2,
					"rangedWeapons" : 2,
					"heavyGuns" : 2,
					"specialGuns" : 2,
					"longGuns" : 2,
					"sniper" : 2,
					"psychology" : 2,
					"leadership" : 2,
					"eloquence" : 2,
					"singing" : 2,
					"storyteller" : 2,
					"dance" : 2,
					"music" : 2,
					"intimidation" : 2,
					"gambling" : 2,
					"bureaucracy" : 2,
					"education" : 2,
					"navigation" : 2,
					"seeking" : 2,
					"tradeFood" : 2,
					"tradeRawMaterial" : 2,
					"tradeDevice" : 2,
					"tradeElectronic" : 2,
					"tradeMedical" : 2,
					"tradeInformation" : 2,
					"tradeVehicle" : 2,
					"tradeWeapon" : 2,
					"tradeDrug" : 2,
					"tradeBlack" : 2,
					"dissimulation" : 2,
					"disguise" : 2,
					"discretion" : 2,
					"escape" : 2,
					"stealth" : 2,
					"pickpocket" : 2,
					"monitoring" : 2,
					"externalBattlesuits" : 2,
					"underwaterBattlesuits" : 2,
					"fighterFlying" : 2,
					"vesselsPilotage" : 2,
					"vehicleDriving" : 2,
					"scootersDriving" : 2,
					"remotePiloting" : 2,
					"hunting" : 2,
					"knowCity" : 2,
					"knowOceans" : 2,
					"knowUnderground" : 2,
					"observation" : 2,
					"orientation" : 2,
					"survival" : 2,
					"firstAid" : 2,
					"onboardInstrumentation" : 2,
					"farming" : 2,
					"animalsTraining" : 2,
					"electronic" : 2,
					"explosive" : 2,
					"computing" : 2,
					"mechanicsLifeSupport" : 2,
					"mechanicsMachinery" : 2,
					"mechanicsVehicle" : 2,
					"mechanicsBattleSuits" : 2,
					"mechanicsVessel" : 2,
					"traps" : 2,
					"$belongingCommunity" : 2,
				},
				{
					"balance" : 1,
					"athletism" : 1,
					"endurance" : 1,
					"climbing" : 1,
					"breathing" : 1,
					"closeHeavyWeapons" : 1,
					"closeSpecialWeapons" : 1,
					"unarmedStruggle" : 1,
					"armedStruggle" : 1,
					"throwingWeapons" : 1,
					"handguns" : 1,
					"rangedWeapons" : 1,
					"heavyGuns" : 1,
					"specialGuns" : 1,
					"longGuns" : 1,
					"sniper" : 1,
					"psychology" : 1,
					"leadership" : 1,
					"eloquence" : 1,
					"singing" : 1,
					"storyteller" : 1,
					"dance" : 1,
					"music" : 1,
					"intimidation" : 1,
					"gambling" : 1,
					"bureaucracy" : 1,
					"education" : 1,
					"navigation" : 1,
					"seeking" : 1,
					"tradeFood" : 1,
					"tradeRawMaterial" : 1,
					"tradeDevice" : 1,
					"tradeElectronic" : 1,
					"tradeMedical" : 1,
					"tradeInformation" : 1,
					"tradeVehicle" : 1,
					"tradeWeapon" : 1,
					"tradeDrug" : 1,
					"tradeBlack" : 1,
					"dissimulation" : 1,
					"disguise" : 1,
					"discretion" : 1,
					"escape" : 1,
					"stealth" : 1,
					"pickpocket" : 1,
					"monitoring" : 1,
					"externalBattlesuits" : 1,
					"underwaterBattlesuits" : 1,
					"fighterFlying" : 1,
					"vesselsPilotage" : 1,
					"vehicleDriving" : 1,
					"scootersDriving" : 1,
					"remotePiloting" : 1,
					"hunting" : 1,
					"knowCity" : 1,
					"knowOceans" : 1,
					"knowUnderground" : 1,
					"observation" : 1,
					"orientation" : 1,
					"survival" : 1,
					"firstAid" : 1,
					"onboardInstrumentation" : 1,
					"farming" : 1,
					"animalsTraining" : 1,
					"electronic" : 1,
					"explosive" : 1,
					"computing" : 1,
					"mechanicsLifeSupport" : 1,
					"mechanicsMachinery" : 1,
					"mechanicsVehicle" : 1,
					"mechanicsBattleSuits" : 1,
					"mechanicsVessel" : 1,
					"traps" : 1,
					"$belongingCommunity" : 1,
				},
				{
					"balance" : 1,
					"athletism" : 1,
					"endurance" : 1,
					"climbing" : 1,
					"breathing" : 1,
					"closeHeavyWeapons" : 1,
					"closeSpecialWeapons" : 1,
					"unarmedStruggle" : 1,
					"armedStruggle" : 1,
					"throwingWeapons" : 1,
					"handguns" : 1,
					"rangedWeapons" : 1,
					"heavyGuns" : 1,
					"specialGuns" : 1,
					"longGuns" : 1,
					"sniper" : 1,
					"psychology" : 1,
					"leadership" : 1,
					"eloquence" : 1,
					"singing" : 1,
					"storyteller" : 1,
					"dance" : 1,
					"music" : 1,
					"intimidation" : 1,
					"gambling" : 1,
					"bureaucracy" : 1,
					"education" : 1,
					"navigation" : 1,
					"seeking" : 1,
					"tradeFood" : 1,
					"tradeRawMaterial" : 1,
					"tradeDevice" : 1,
					"tradeElectronic" : 1,
					"tradeMedical" : 1,
					"tradeInformation" : 1,
					"tradeVehicle" : 1,
					"tradeWeapon" : 1,
					"tradeDrug" : 1,
					"tradeBlack" : 1,
					"dissimulation" : 1,
					"disguise" : 1,
					"discretion" : 1,
					"escape" : 1,
					"stealth" : 1,
					"pickpocket" : 1,
					"monitoring" : 1,
					"externalBattlesuits" : 1,
					"underwaterBattlesuits" : 1,
					"fighterFlying" : 1,
					"vesselsPilotage" : 1,
					"vehicleDriving" : 1,
					"scootersDriving" : 1,
					"remotePiloting" : 1,
					"hunting" : 1,
					"knowCity" : 1,
					"knowOceans" : 1,
					"knowUnderground" : 1,
					"observation" : 1,
					"orientation" : 1,
					"survival" : 1,
					"firstAid" : 1,
					"onboardInstrumentation" : 1,
					"farming" : 1,
					"animalsTraining" : 1,
					"electronic" : 1,
					"explosive" : 1,
					"computing" : 1,
					"mechanicsLifeSupport" : 1,
					"mechanicsMachinery" : 1,
					"mechanicsVehicle" : 1,
					"mechanicsBattleSuits" : 1,
					"mechanicsVessel" : 1,
					"traps" : 1,
					"$belongingCommunity" : 1,
				},
			],
		},
}

*/