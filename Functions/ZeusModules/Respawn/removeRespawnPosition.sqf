["[SAA] Respawn", "Remove Respawn Position / FOB",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	
	_markers = allMapMarkers select {"respawn" in _x}; diag_log format ["VARS CHECK RRP | _markers: %1", _markers];
	_markersNames = _markers apply {markerText _x}; diag_log format ["VARS CHECK RRP | _markersNames: %1", _markersNames];
	_activeRespawnPositions = missionNamespace getVariable ["activeRespawnPositions", []]; diag_log format ["VARS CHECK RRP | _activeRespawnPositions: %1", _activeRespawnPositions];
	_respawnPositionNames = _activeRespawnPositions apply {_x # 0}; diag_log format ["VARS CHECK RRP | _respawnPositionNames: %1", _respawnPositionNames];

	private _dialogResult =
	[
		"Remove Respawn Position / FOB",
		[
			["Select Respawn Position To Remove:", _respawnPositionNames, 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_respawnPositionIndex"];

	if !(isNull (_activeRespawnPositions # _respawnPositionIndex # 1)) then {(_activeRespawnPositions # _respawnPositionIndex # 1) setVariable ["isFOB", false]};
	[(_activeRespawnPositions # _respawnPositionIndex) # 2] call BIS_fnc_removeRespawnPosition;
	_activeRespawnPositions deleteAt _respawnPositionIndex; diag_log format ["VARS CHECK RRP | _activeRespawnPositions: %1", _activeRespawnPositions];
	_activeRespawnPositions = missionNamespace setVariable ["activeRespawnPositions", _activeRespawnPositions];

	_markerIndex = _markersNames findIf {_respawnPositionNames isEqualTo _x};
	if (_markerIndex > -1) then {deleteMarker (_markers # _markerIndex)};

	["Respawn Point Removed"] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;