// For Ace Action Condition
missionNamespace setVariable ["playersListDeclared", true, true];
// 
[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_MAIN", localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// if (isNull _objectUnderCursor) exitWith {
	// 	[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	// };

	[localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_HEADER",
		[
			["COMBO", [localize "STR_SAA_GENERAL_STATUS", localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_STATUS_TOOLTIP"],
				[
					["Alive", "Dead", "All"],
					[
						[localize "STR_SAA_GENERAL_IN_ACTION", localize "STR_SAA_GENERAL_ALIVE"], 
						[localize "STR_SAA_GENERAL_KIA", localize "STR_SAA_GENERAL_DEAD"], 
						[localize "STR_SAA_GENERAL_ALL_PLAYERS", localize "STR_SAA_GENERAL_ALL"]
					],
					0
				]
			],
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_GROUPING_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_GROUPING_TOOLTIP"],
				[
					["Classes", "Ranks", "Groups"],
					[ 
						[localize "STR_SAA_CLASSES_CLASSES", localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERLIST_GROUPING_CLASSES_TOOLTIP"], 
						[localize "STR_SAA_RANKS_RANKS", localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERLIST_GROUPING_RANKS_TOOLTIP"],
						[localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERLIST_GROUPING_GROUPS", localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERLIST_GROUPING_GROUPS_TOOLTIP"]
					],
					2
				]
			],
			["SIDES", [localize "STR_SAA_GENERAL_SIDE", localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_SIDE_TOOLTIP"],
				west
			],
			["CHECKBOX", [localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_SHOWTO_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_GROUPING_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_status", "_groupBy", "_side", "_isOnlyToZeus"];

			[[_status, _groupBy, _side, _isOnlyToZeus], Shadec_fnc_playersList] remoteExec ["call", 2];
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;