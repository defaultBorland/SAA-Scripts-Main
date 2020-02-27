//

["[SAA] Respawn", "Show Respawn Tickets",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	private _targets = ["Zeus", "All"];

	private _dialogResult =
	[
		"Show Respawn Tickets",
		[
			["Show to:", _targets, 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_comboBoxResult"];

	//
	[[_targets # _comboBoxResult], Shadec_fnc_showRespawnTickets] remoteExec ["spawn", 2];
}] call Ares_fnc_RegisterCustomModule;