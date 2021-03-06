var geographicOrigin = {
		"traveller" : {
			"orientation" : 1,
			"underwaterBattlesuits" : 1,
			"vesselsPilotage" : 1,
			"scootersDriving" : 2,
			"knowOceans" : 1,
			"$choice": [
				{
					"mechanicsVessel" : 1,
					"mechanicsBattleSuits" : 2,
				},
			],
		},
		"smallStation" : {
			"orientation" : 1,
			"underwaterBattlesuits" : 1,
			"scootersDriving" : 2,
			"electronic" : 1,
			"$choice": [
				{
					"mechanicsMachinery" : 2,
					"farming" : 2,
				},
			],
		},
		"mediumStation" : {
			"orientation" : 1,
			"bureaucracy" : 1,
			"underwaterBattlesuits" : 1,
			"scootersDriving" : 1,
			"electronic" : 1,
			"$belongingCommunity" : 2,
		},
		"bigStation" : {
			"bureaucracy" : 2,
			"education" : 2,
			"$belongingCommunity" : 3,
		},
}