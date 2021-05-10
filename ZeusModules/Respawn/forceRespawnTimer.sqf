//

[localize "SAA_ZEUS_MODULES_CATEGORIES_RESPAWN", localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// if (isNull _objectUnderCursor) exitWith {
	// 	[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNOOBJECTSELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	// };
	
	// All players exclude curators and alive ones
	private _players = allPlayers - (allCurators apply {getAssignedCuratorUnit _x}) - (allPlayers select {alive _x});

	if (count _players < 1) exitWith {
		[objNull, localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_ZEUSMESSAGE_NODEADPLAYERS"] call bis_fnc_showCuratorFeedbackMessage;
	};

	[localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_DIALOG_HEADER",
		[
			["COMBO", [localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_DIALOG_TARGET_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_DIALOG_TARGET_TOOLTIP"],
				[
					[[_players apply {[name _x, owner _x]}] + _players apply {[name _x, owner _x]}],
					[
						[localize "SAA_GENERAL_ALL" + " " + localize "SAA_GENERAL_DEAD"] + _players apply {name _x}
					],
					0
				]
			],
			["SLIDER", [localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_DIALOG_TIME_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_DIALOG_TIME_TOOLTIP"],
				[
					2, getNumber (missionConfigFile >> "respawnDelay"), 1, 0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_target", "_time"];
			
			[[_target, _time], Shadec_fnc_forceRespawnTimer] remoteExec ["call", 2];
			[localize "SAA_GENERAL_SUCCESS", localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;