// 
[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_FORTIFY", localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SETTINGS_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	private _presets = [
		[ // Small
			["Land_BagFence_Round_F", 5],
			["Land_BagFence_Short_F", 5],
			["Land_BagFence_Long_F", 10],
			["Land_BagBunker_Small_F", 25],
			["Land_Plank_01_8m_F", 10],
			["Land_Plank_01_4m_F", 5]
		],
		[ // Small Green
			["Land_BagFence_01_round_green_F", 5],
			["Land_BagFence_01_short_green_F", 5],
			["Land_BagFence_01_long_green_F", 10],
			["Land_Plank_01_8m_F", 10],
			["Land_Plank_01_4m_F", 10]
		]
		// ,
		// [	// Medium
		// 	["Land_HBarrierTower_F", 100],
		// 	["Land_HBarrierWall4_F", 25],
		// 	["Land_HBarrierWall_corner_F", 25],
		// 	["Land_HBarrier_1_F", 5],
		// 	["Land_Plank_01_8m_F", 10],
		// 	["Land_Plank_01_4m_F", 5]
		// ],
		// [	// Medium Green
		// 	["Land_HBarrier_01_big_tower_green_F", 100],
		// 	["Land_HBarrier_01_wall_4_green_F", 25],
		// 	["Land_HBarrier_01_wall_corner_green_F", 25],
		// 	["Land_HBarrier_01_line_1_green_F", 5],
		// 	["Land_Plank_01_8m_F", 10],
		// 	["Land_Plank_01_4m_F", 5]
		// ]
	];

	[localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SETTINGS_DIALOG_HEADER",
		[
			["SIDES", [localize "STR_SAA_GENERAL_SIDE", localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SETTINGS_DIALOG_SIDE_TOOLTIP"],
				west
			],
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SETTINGS_DIALOG_PRESETS_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SETTINGS_DIALOG_PRESETS_TOOLTIP"],
				[
					[[0], [1]],
					[
						[
							localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SETTINGS_PRESETS_SMALL", 
							format["%1:\n%2", localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SETTINGS_PRESETS_COSTS_TOOLTIP", (_presets # 0) apply {
								format["%1 - %2", getText(configFile >> "CfgVehicles" >> _x # 0 >> "displayName"), _x # 1]
							} joinString "\n"]
						], 
						[
							localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SETTINGS_PRESETS_SMALL_GREEN",
							format["%1:\n%2", localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SETTINGS_PRESETS_COSTS_TOOLTIP", (_presets # 1) apply {
								format["%1 - %2", getText(configFile >> "CfgVehicles" >> _x # 0 >> "displayName"), _x # 1]
							} joinString "\n"]
						]
					],
					0
				]
			],
			["SLIDER", [localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SETTINGS_DIALOG_BUDGET_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SETTINGS_DIALOG_BUDGET_TOOLTIP"],
				[
					-1, 1000, 0, {
						if (_this > 0) exitWith {str (ceil (_this / 5) * 5)};
						str (floor _this)
					}
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_side", "_preset", "_initialBudget"];
			_args params ["_presets"];

			private _objects = [];
			{
				{
					_objects pushBackUnique _x;
				} forEach (_presets # _x);
			} forEach _preset;

			_initialBudget = [_initialBudget, ceil (_initialBudget / 5) * 5] select (_initialBudget > 0);

			[[_side, _objects, _initialBudget], Shadec_fnc_setFortifySettings] remoteExec ["call", 2];

			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_SETTINGS_ZEUSMESSAGE_SUCCESS" + ", " + localize "STR_SAA_ZEUS_MODULES_FORTIFY_FORTIFY_TOGGLE_ZEUSMESSAGE_ON", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_presets]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;