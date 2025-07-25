///@description Initializes the global match settings presets

global.matchPresets = [
	[//0: Standard
		{type: oZombie, probability: 5},//oZombie with a 5% chance.
		{type: oPurpleEyedZombie, probability: 5},//oPurpleEyedZombie with a 5% chance.
		{type: oRedEyedZombie, probability: 5},//oRedEyedZombie with a 5% chance.
		{type: oBlueEyedZombie, probability: 5},//oBlueEyedZombie with a 5% chance.
		{type: oHellHound, probability: 5},//oHellHound with a 5% chance.

		{type: oFetidZombie, probability: 5},//oFetidZombie with a 5% chance.
		{type: oFetidPurpleEyedZombie, probability: 5},//oFetidPurpleEyedZombie with a 5% chance.
		{type: oFetidRedEyedZombie, probability: 5},//oFetidRedEyedZombie with a 5% chance.
		{type: oFetidBlueEyedZombie, probability: 5},//oFetidBlueEyedZombie with a 5% chance.
		{type: oFetidHellHound, probability: 5},//oFetidHellHound with a 5% chance.

		{type: oEvolvedZombie, probability: 5},//oEvolvedZombie with a 5% chance.
		{type: oEvolvedPurpleEyedZombie, probability: 5},//oEvolvedPurpleEyedZombie with a 5% chance.
		{type: oEvolvedRedEyedZombie, probability: 5},//EvolvedRedEyedZombie with a 5% chance.
		{type: oEvolvedBlueEyedZombie, probability: 5},//oEvolvedBlueEyedZombie with a 5% chance.
		{type: oEvolvedHellHound, probability: 5},//oEvolvedHellHound with a 5% chance.

		{type: oApexZombie2, probability: 3},//oApexZombie with a 3% chance.
		{type: oApexPurpleEyedZombie2, probability: 3},//oApexPurpleEyedZombie with a 3% chance.
		{type: oApexRedEyedZombie2, probability: 3},//oApexRedEyedZombie with a 3% chance.
		{type: oApexBlueEyedZombie2, probability: 3},//oApexBlueEyedZombie with a 3% chance.
		{type: oApexHellHound2, probability: 3},//oApexHellHound with a 3% chance.

		{type: oDarkMinionZombie, probability: 2},//oDarkMinionZombie with a 2% chance.
		{type: oHellHoundElite, probability: 2},//oHellHoundElite with a 2% chance.
		{type: oNightmarishZombie, probability: 2},//oNightmarishZombie with a 2% chance.
		{type: oPumpkinMonster, probability: 4}//oPumpkinMonster with a 4% chance.
	],

	[//1: Hard
		{type: oEvolvedZombie, probability: 7},
		{type: oEvolvedPurpleEyedZombie, probability: 7},
		{type: oEvolvedRedEyedZombie, probability: 7},
		{type: oEvolvedBlueEyedZombie, probability: 7},
		{type: oEvolvedHellHound, probability: 7},

		{type: oApexZombie2, probability: 7},
		{type: oApexPurpleEyedZombie2, probability: 7},
		{type: oApexRedEyedZombie2, probability: 7},
		{type: oApexBlueEyedZombie2, probability: 7},
		{type: oApexHellHound2, probability: 7},

		{type: oDarkMinionZombie, probability: 7},
		{type: oHellHoundElite, probability: 7},
		{type: oNightmarishZombie, probability: 8},
		{type: oPumpkinMonster, probability: 8}
    ],

	[//2: Harder
		{type: oApexZombie2, probability: 12},
		{type: oApexPurpleEyedZombie2, probability: 12},
		{type: oApexRedEyedZombie2, probability: 12},
		{type: oApexBlueEyedZombie2, probability: 12},
		{type: oApexHellHound2, probability: 12},

		{type: oDarkMinionZombie, probability: 10},
		{type: oHellHoundElite, probability: 10},
		{type: oNightmarishZombie, probability: 10},
		{type: oPumpkinMonster, probability: 10}
	],

	[//3: Elites Only
		{type: oDarkMinionZombie, probability: 25},
		{type: oHellHoundElite, probability: 25},
		{type: oNightmarishZombie, probability: 25},
		{type: oPumpkinMonster, probability: 25}
	],
	
	[//4: Apex Zombies Only
		{type: oApexZombie2, probability: 20},
		{type: oApexPurpleEyedZombie2, probability: 20},
		{type: oApexRedEyedZombie2, probability: 20},
		{type: oApexBlueEyedZombie2, probability: 20},
		{type: oApexHellHound2, probability: 20}
	],
	
	[//5: Evolved Zombies Only
		{type: oEvolvedZombie, probability: 20},
		{type: oEvolvedPurpleEyedZombie, probability: 20},
		{type: oEvolvedRedEyedZombie, probability: 20},
		{type: oEvolvedBlueEyedZombie, probability: 20},
		{type: oEvolvedHellHound, probability: 20}
	],
	
	[//6: Red-Eyed Zombies Only
		{type: oRedEyedZombie, probability: 25},
		{type: oFetidRedEyedZombie, probability: 25},
		{type: oEvolvedRedEyedZombie, probability: 25},
		{type: oApexRedEyedZombie2, probability: 25}
	],
	
	[//7: Purple-Eyed Zombies Only
		{type: oPurpleEyedZombie, probability: 25},
		{type: oFetidPurpleEyedZombie, probability: 25},
		{type: oEvolvedPurpleEyedZombie, probability: 25},
		{type: oApexPurpleEyedZombie2, probability: 25}
	],
	
	[//8: Nightmarish Zombies Only
		{type: oNightmarishZombie, probability: 100}
	],
	
	[//9: Dogs Only
		{type: oHellHound, probability: 20},
		{type: oFetidHellHound, probability: 20},
		{type: oEvolvedHellHound, probability: 20},
		{type: oApexHellHound2, probability: 20},
		{type: oHellHoundElite, probability: 20}
	],
	
	[//10: Blue-Eyed Zombies Only
		{type: oBlueEyedZombie, probability: 25},
		{type: oFetidBlueEyedZombie, probability: 25},
		{type: oEvolvedBlueEyedZombie, probability: 25},
		{type: oApexBlueEyedZombie2, probability: 25}
	],
	
	[//11: Fetid Zombies Only
		{type: oFetidZombie, probability: 20},
		{type: oFetidPurpleEyedZombie, probability: 20},
		{type: oFetidRedEyedZombie, probability: 20},
		{type: oFetidBlueEyedZombie, probability: 20},
		{type: oFetidHellHound, probability: 20}
	],
	
	[//12: Zombies Only
		{type: oZombie, probability: 20},
		{type: oPurpleEyedZombie, probability: 20},
		{type: oRedEyedZombie, probability: 20},
		{type: oBlueEyedZombie, probability: 20},
		{type: oHellHound, probability: 20}
	],
	
	[//13: Zombies Only (*No Variants)
		{type: oZombie, probability: 100}
	],
	
	[//14: Easier
		{type: oZombie, probability: 10},
		{type: oPurpleEyedZombie, probability: 10},
		{type: oRedEyedZombie, probability: 10},
		{type: oBlueEyedZombie, probability: 10},
		{type: oHellHound, probability: 10},
		
		{type: oFetidZombie, probability: 10},
		{type: oFetidPurpleEyedZombie, probability: 10},
		{type: oFetidRedEyedZombie, probability: 10},
		{type: oFetidBlueEyedZombie, probability: 10},
		{type: oFetidHellHound, probability: 10}
	],
	
	[//15: Easy
		{type: oZombie, probability: 7},
		{type: oPurpleEyedZombie, probability: 7},
		{type: oRedEyedZombie, probability: 7},
		{type: oBlueEyedZombie, probability: 7},
		{type: oHellHound, probability: 7},
		
		{type: oFetidZombie, probability: 7},
		{type: oFetidPurpleEyedZombie, probability: 7},
		{type: oFetidRedEyedZombie, probability: 7},
		{type: oFetidBlueEyedZombie, probability: 7},
		{type: oFetidHellHound, probability: 7},
		
		{type: oEvolvedZombie, probability: 6},
		{type: oEvolvedPurpleEyedZombie, probability: 6},
		{type: oEvolvedRedEyedZombie, probability: 6},
		{type: oEvolvedBlueEyedZombie, probability: 6},
		{type: oEvolvedHellHound, probability: 6}
	]
];
