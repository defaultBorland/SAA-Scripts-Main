//

["[SAA] Main", "Players List",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	private _playerTypes = ["Alive", "Dead", "All"];
	private _targetsTypes = ["Only to Zeus", "To all players"];
	private _groupingTypes = ["Classes", "Ranks"];

	private _dialogResult =
	[
		"Show Players",
		[
			["Players type:", _playerTypes, 0],
			["Show to:", _targetsTypes, 0],
			["Sorting:", _groupingTypes, 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_type", "_targets", "_groupBy"];

	//
	[[_playerTypes # _type, _targetsTypes # _targets, _groupingTypes # _groupBy], Shadec_fnc_playersList] remoteExec ["spawn", 2];
}] call Ares_fnc_RegisterCustomModule;