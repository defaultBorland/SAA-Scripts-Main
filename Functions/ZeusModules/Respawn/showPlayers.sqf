//

["[SAA] Respawn", "Show Players",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	private _types = ["Alive", "Dead", "All"];
	private _targets = ["Zeus", "All"];

	private _dialogResult =
	[
		"Show Players",
		[
			["Players type:", _types, 0],
			["Show to:", _targets, 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_comboBox1Result", "_comboBox2Result"];

	//
	[[_types # _comboBox1Result, _targets # _comboBox2Result], Shadec_fnc_showPlayers] remoteExec ["spawn", 2];
}] call Ares_fnc_RegisterCustomModule;