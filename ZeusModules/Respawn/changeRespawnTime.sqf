//

["[SAA] Respawn", "Change Respawn Time",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	private _dialogResult =
	[
		"Change Respawn Time",
		[
			["Set respawn time in seconds:", "", "Must be in interval from 15 to 300."]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_typedText"];

	// Check if text is correct value
	_time = parseNumber _typedText;
	if (_time < 10 or { _time > 300 }) exitWith {["Respawn Time must be in interval from 15 to 300!"] call Achilles_fnc_showZeusErrorMessage};
	[[_time], Shadec_fnc_changeRespawnTime] remoteExec ["call", 2];
}] call Ares_fnc_RegisterCustomModule;