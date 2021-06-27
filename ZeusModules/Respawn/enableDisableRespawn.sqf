//

["[SAA] Respawn", "Enable/Disable Respawn",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// _nameList = ["All"];
	// _players = allPlayers - (allCurators apply {getAssignedCuratorUnit _x});
	// _players = _players apply {name _x};
	// _nameList append _players;

	private _states = ["Disable", "Enable"];
	
	private _dialogResult =
	[
		"Enable/Disable Respawn",
		[
			["Side: ", "SIDE", 0],
			["State:", _states, 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_selectedSide" ,"_selectedState", "_selectedNotification"];

	_SIDE = [_selectedSide - 1] call BIS_fnc_sideType;


	[[_SIDE, _states # _selectedState], Shadec_fnc_changeRespawnState] remoteExec ["call", 2];
	}] call Ares_fnc_RegisterCustomModule;