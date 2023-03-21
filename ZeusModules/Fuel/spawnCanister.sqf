[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_FUEL", localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	[localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_DIALOG_HEADER",
		[
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_DIALOG_CANISTER_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_DIALOG_CANISTER_TOOLTIP"],
				[
					["rhsusf_props_ScepterMFC_OD", "rhsusf_props_ScepterMFC_D", "Land_CanisterFuel_F", "Land_CanisterFuel_Blue_F", "Land_CanisterFuel_Red_F", "Land_CanisterFuel_White_F", "FlexibleTank_01_forest_F", "FlexibleTank_01_sand_F"],
					[
						[localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_CANISTER_PLASTIC_OD", localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_CANISTER_TOOLTIP"],
						[localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_CANISTER_PLASTIC_DESERT", localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_CANISTER_TOOLTIP"],
						[localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_CANISTER_METAL_GREEN", localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_CANISTER_TOOLTIP"],
						[localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_CANISTER_METAL_BLUE", localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_CANISTER_TOOLTIP"],
						[localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_CANISTER_METAL_RED", localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_CANISTER_TOOLTIP"],
						[localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_CANISTER_METAL_WHITE", localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_CANISTER_TOOLTIP"],
						[localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_TANK_PLASTIC_OD", localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_TANK_TOOLTIP"],
						[localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_TANK_PLASTIC_DESERT", localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_TANK_TOOLTIP"]
					],
					0
				]
			],
			["SLIDER:PERCENT", [localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_DIALOG_FUEL_CAPACITY_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_FUEL_SPAWN_CANISTER_FUEL_CAPACITY_TOOLTIP"],
				[
					0, 1, 1, 0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_canister", "_fuelPercent"];
			_args params ["_position"];

			[[_position, _canister, _fuelPercent], Shadec_fnc_spawnCanister] remoteExec ["call", 2];
		},
		{},
		[_position]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;