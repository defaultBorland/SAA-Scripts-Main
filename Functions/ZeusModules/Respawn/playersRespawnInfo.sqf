//

["[SAA] Respawn", "Show Players Respawn Info",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	private _targets = ["Zeus", "All"];

	private _dialogResult =
	[
		"Show Respawn Tickets",
		[
			["Show to:", _targets, 0],
			["Side: ", "SIDE", 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_selectedTargets", "_selectedSide"];

	_SIDE = [_selectedSide - 1] call BIS_fnc_sideType;

	//
	[[_targets # _selectedTargets, _SIDE], Shadec_fnc_playersRespawnInfo] remoteExec ["spawn", 2];
}] call Ares_fnc_RegisterCustomModule;