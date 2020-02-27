//

["[SAA] Respawn", "Move Respawn Marker",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	_markers = allMapMarkers apply {if (_x find "respawn" > -1) then {_x} else {"NULL"}};
	_markers = _markers - ["NULL"];

	private _dialogResult =
	[
		"Move Marker To Module Position",
		[
			["Select marker to move:", _markers, 0],
			["Show notification to players:", ["No", "Yes"], 1]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_comboBox1Result", "_comboBox2Result"];
	[[_markers # _comboBox1Result, _position, _comboBox2Result], Shadec_fnc_moveRespawnMarker] remoteExec ["spawn", 2];
}] call Ares_fnc_RegisterCustomModule;