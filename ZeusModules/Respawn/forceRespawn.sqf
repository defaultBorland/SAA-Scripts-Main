//

["[SAA] Respawn", "Force Respawn",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	_nameList = ["All"];
	_players = allPlayers;
	_players = _players apply {name _x};
	_nameList append _players;

	private _dialogResult =
	[
		"Force Respawn",
		[
			["Target:", _nameList, 0],
			["Time to respawn:", "", "Value in seconds"]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_comboBoxResult" ,"_typedText"];

	// Check if text is correct value
	_time = parseNumber _typedText;
	[[_nameList # _comboBoxResult, _time], Shadec_fnc_forceRespawn] remoteExec ["call", 2];
}] call Ares_fnc_RegisterCustomModule;