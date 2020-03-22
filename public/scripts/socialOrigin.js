var socialOrigin = {
		"ghetto" : {
			"unarmedStruggle" : 1,
			"armedStruggle" : 1,
			"pickpocket" : 2,
			"$choice": [
				{
					"intimidation" : 1,
					"dissimulation" : 1,
				},
			],
		},
		"workingClass" : {
			"education" : 1,
			"unarmedStruggle" : 1,
			"underwaterBattlesuits" : 1,
			"$choice": [
				{
					"mechanicsLifeSupport" : 2,
					"mechanicsMachinery" : 2,
					"mechanicsVehicle" : 2,
					"mechanicsBattleSuits" : 2,
					"farming" : 2,
				},
			],
		},
		"mediumClass" : {
			"bureaucracy" : 1,
			"education" : 2,
			"$belongingCommunity" : 1,
		},
		"highClass" : {
			"education" : 2,
			"$choice": [
				{
					"bureaucracy" : 3,
					"$belongingCommunity" : 3,
				},
			],
		},
}