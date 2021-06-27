// For Ace Action Condition
missionNamespace setVariable ["playersListDeclared", true, true];
// 
[localize "SAA_ZEUS_MODULES_CATEGORIES_MAIN", localize "SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// if (isNull _objectUnderCursor) exitWith {
	// 	[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNOOBJECTSELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	// };

	[localize "SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_HEADER",
		[
			["COMBO", [localize "SAA_GENERAL_STATUS", localize "SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_STATUS_TOOLTIP"],
				[
					["Alive", "Dead", "All"],
					[
						[localize "SAA_GENERAL_INACTION", localize "SAA_GENERAL_ALIVE"], 
						[localize "SAA_GENERAL_KIA", localize "SAA_GENERAL_DEAD"], 
						[localize "SAA_GENERAL_ALLPLAYERS", localize "SAA_GENERAL_ALL"]
					],
					0
				]
			],
			["COMBO", [localize "SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_GROUPING_DISPLAYNAME", localize "SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_GROUPING_TOOLTIP"],
				[
					["Classes", "Ranks", "Groups"],
					[ 
						[localize "SAA_CLASSES_CLASSES", localize "SAA_ZEUS_MODULES_MAIN_PLAYERLIST_GROUPING_CLASSES_TOOLTIP"], 
						[localize "SAA_RANKS_RANKS", localize "SAA_ZEUS_MODULES_MAIN_PLAYERLIST_GROUPING_RANKS_TOOLTIP"],
						[localize "SAA_ZEUS_MODULES_MAIN_PLAYERLIST_GROUPING_GROUPS", localize "SAA_ZEUS_MODULES_MAIN_PLAYERLIST_GROUPING_GROUPS_TOOLTIP"]
					],
					2
				]
			],
			["CHECKBOX", [localize "SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_SHOWTO_DISPLAYNAME", localize "SAA_ZEUS_MODULES_MAIN_PLAYERSLIST_DIALOG_GROUPING_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_status", "_groupBy", "_isOnlyToZeus"];

			[[_status, _groupBy, _isOnlyToZeus], Shadec_fnc_playersList] remoteExec ["call", 2];
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;