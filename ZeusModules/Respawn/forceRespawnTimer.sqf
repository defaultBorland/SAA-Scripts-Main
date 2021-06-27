//

[localize "SAA_ZEUS_MODULES_CATEGORIES_RESPAWN", localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// All players exclude curators and alive ones
	private _players = (allPlayers - (allCurators apply {getAssignedCuratorUnit _x}) - (allPlayers select {alive _x})) apply {name _x};

	if (count _players < 1) exitWith {
		[objNull, localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_ZEUSMESSAGE_NODEADPLAYERS"] call bis_fnc_showCuratorFeedbackMessage;
	};

	_returnValues = ["AllDead"]; 
	_returnValues append _players;
	_displayValues = [localize "SAA_GENERAL_ALL" + " " + localize "SAA_GENERAL_DEAD"]; 
	_displayValues append _players;

	[localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_DIALOG_HEADER",
		[
			["COMBO", [localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_DIALOG_TARGET_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_DIALOG_TARGET_TOOLTIP"],
				[
					_returnValues,
					[
						_displayValues
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