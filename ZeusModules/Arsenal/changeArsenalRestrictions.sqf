//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_ARSENAL", localize "STR_SAA_ZEUS_MODULES_ARSENAL_REMOVE_ARSENAL_RESTRICTIONS_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// All players exclude curators and alive ones
	private _players = [] call Shadec_fnc_getPlayers;
	if (count _players < 1) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_NONZEUS_PLAYERS"] call bis_fnc_showCuratorFeedbackMessage;
	};

	if !(missionNamespace getVariable ["SAA_isMissionSpecial", false]) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_ARSENAL_RESTRICTIONS_CHANGES_PROHIBITED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	private _checkboxes = _players apply {
		[
			"CHECKBOX",
			[name _x, localize "STR_SAA_ZEUS_MODULES_ARSENAL_REMOVE_ARSENAL_RESTRICTIONS_TOOLTIP"],
			!(_x getVariable ["SAA_isArsenalUnrestricted", false]),
			true
		]
	};

	[localize "STR_SAA_ZEUS_MODULES_ARSENAL_REMOVE_ARSENAL_RESTRICTIONS_MODULENAME",
		_checkboxes,
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_args params ["_players"];

			{
				_x setVariable ["SAA_isArsenalUnrestricted", !(_dialogResult # _forEachIndex), true];
			} forEach _players;

			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_ARSENAL_REMOVE_ARSENAL_RESTRICTIONS_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;

			private _playersWithNoRestrictions = _players select {_x getVariable ["SAA_isArsenalUnrestricted", false]};
			["Arsenal Restrinctions lifted: " + (_playersWithNoRestrictions joinString ", "), "Warning"] call Shadec_fnc_createLogServer;
		},
		{},
		[_players]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;