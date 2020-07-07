["[SAA] Respawn", "Remove Respawn Position",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	
	_respawnPositions = missionNamespace getVariable ["respawnPositions", []]; diag_log format ["VARS CHECK RRP | _respawnPositions: %1", _respawnPositions];

	private _dialogResult =
	[
		"Remove Respawn Position / FOB",
		[
			["Select Respawn Position To Remove:", _respawnPositions apply { markerText (_x # 0)}, 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_respawnPositionIndex"];

	[[_respawnPositions # _respawnPositionIndex # 0], Shadec_fnc_removeRespawnPosition] remoteExec ["spawn", 2];
	[format["> Server: Respawn '%1' was removed.", markerText (_respawnPositions # _respawnPositionIndex # 0)]] remoteExec ["systemChat", -2];

	["Respawn Point Removed"] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;