//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_RESPAWN", localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// All players exclude alive ones
	private _players = (allPlayers - (allPlayers select {alive _x})) apply {name _x};

	if (count _players < 1) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_ZEUSMESSAGE_NODEADPLAYERS"] call bis_fnc_showCuratorFeedbackMessage;
	};


	_returnValuesPlayers = ["AllDead"]; 
	_returnValuesPlayers append _players;
	_displayValuesPlayers = [localize "STR_SAA_GENERAL_ALL" + " " + localize "STR_SAA_GENERAL_DEAD"]; 
	_displayValuesPlayers append _players;


	_respawnPositions = missionNamespace getVariable ["respawnPositions", []];
	_positions = _respawnPositions apply {_x # 1}; // positions or objects
	_positionsNames = _respawnPositions apply {
		private _prefix = [localize "STR_SAA_GENERAL_CV", localize "STR_SAA_GENERAL_FOB"] select ((_x # 1) isEqualType []); // CV or FOB

		format ["(%1) %2", _prefix, markerText (_x # 0)]
	};

	private _modulePosition = [_objectUnderCursor, ASLtoATL _position] select (isNull _objectUnderCursor);

	_returnValuesRespawnPoints = ["PlayerChoice", _modulePosition, "AtBody"];
	_returnValuesRespawnPoints append _positions;
	_displayValuesRespawnPoints = [
		[
			localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_PLAYER_CHOICE_DISPLAYNAME", 
			localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_PLAYER_CHOICE_TOOLTIP"
		], [
			localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_MODULE_POSITION_DISPLAYNAME", 
			localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_MODULE_POSITION_TOOLTIP"
		], [
			localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_AT_BODY_DISPLAYNAME", 
			localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_AT_BODY_TOOLTIP"
		]
	];
	_displayValuesRespawnPoints append _positionsNames;



	[localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_HEADER",
		[
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_TARGET_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_TARGET_TOOLTIP"],
				[
					_returnValuesPlayers,
					_displayValuesPlayers,
					0
				]
			],
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_RESPAWN_POINT_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_RESPAWN_POINT_TOOLTIP"],
				[
					_returnValuesRespawnPoints,
					_displayValuesRespawnPoints,
					0
				]
			],
			["CHECKBOX", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_IS_DELAYED_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_SHOWHINT_TOOLTIP"],
				true
			],
			["CHECKBOX", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_SHOWHINT_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_DIALOG_SHOWHINT_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_target", "_position", "_isDelayed", "_showNotification"];

			[[_target, _position, _isDelayed, _showNotification], Shadec_fnc_forcedRespawn] remoteExec ["call", 2];

			//[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCE_RESPAWN_TIMER_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;
