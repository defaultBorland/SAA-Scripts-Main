//

["[SAA] Radio Utilites", "Signal Quality (Overmap jamming)",
{
	
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	
	private _dialogResult =
	[
		"Change signal quality",
		[
			["Signal Quality: ", "SLIDER", 1]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_quality"];

	missionNamespace setVariable ["tf_reciveVar", 26-(_quality*25), true];
	missionNamespace setVariable ["tf_sendVar", _quality, true];

	[[_quality], Shadec_fnc_radioSignalQuality] remoteExec ["spawn", -2];
	["Signal quality changed"] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;