//

["[SAA] Respawn", "Enable/Disable Respawn",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	_nameList = ["All"];
	_players = allPlayers;
	_players = _players apply {name _x};
	_nameList append _players;

	private _states = ["Disable", "Enable"];
	[["respawnEnabled"], Shadec_fnc_getMsgServerVariable] remoteExec ["call", 2];

	private _notification = ["All", "Target", "Nobody"];
	
	private _dialogResult =
	[
		"Enable/Disable Respawn",
		[
			["Target:", _nameList, 0],
			["State:", _states, 0],
			["Show notification to", _notification, 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_comboBox1Result" ,"_comboBox2Result", "_comboBox3Result"];

	//
	[[_nameList # _comboBox1Result, _states # _comboBox2Result, _notification # _comboBox3Result], Shadec_fnc_changeRespawnState] remoteExec ["call", 2];
	if ((_nameList # _comboBox1Result) isEqualTo "All") then {[["respawnEnabled"], Shadec_fnc_getMsgServerVariable] remoteExec ["call", 2]};	
	}] call Ares_fnc_RegisterCustomModule;