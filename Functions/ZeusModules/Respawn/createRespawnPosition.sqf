//

["[SAA] Respawn", "Create Respawn Position / FOB",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	_markerTypes = ["respawn_unknown","respawn_inf","mil_start"];
	_markerColors = ["Black","Red","Green","Blue","Yellow"];

	private _dialogResult =
	[
		"Create Respawn Position / FOB",
		[
			["Select marker type:", _markerTypes, 0],
			["Select marker color", _markerColors, 0],
			["Respawn Side", "SIDE", 1],
			["Marker text:","","Respawn Point / FOB"],
			["Show notification to players:", ["No", "Yes"], 1]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_selectedMarkerType", "_selectedMarkerColor", "_selectedSide", "_selectedMarkerText", "_showNotification"];

	_SIDE = toLower str([_selectedSide - 1] call BIS_fnc_sideType);
	_COLOR = "Color" + (_markerColors # _selectedMarkerColor);

	_markerNum = {("respawn_" + _SIDE) in _x} count allMapMarkers;

	_marker = createMarker [format["respawn_%1_%2", _SIDE, _markerNum], _position];
	_marker setMarkerType (_markerTypes # _selectedMarkerType);
	_marker setMarkerColor _COLOR;
	_marker setMarkerText _selectedMarkerText;

	_activeRespawnPositions = missionNamespace getVariable ["activeRespawnPositions", []];
	_respawnPositionData = [];

	if (isNull _objectUnderCursor) then {
		_respawnPositionData = [[_selectedSide - 1] call BIS_fnc_sideType, _marker] call BIS_fnc_addRespawnPosition;
		if (_showNotification isEqualTo 1) then {
			[format["Respawn Point '%1' added.", _selectedMarkerText]] remoteExec ["hint"];
		};
	} else {
		_respawnPositionData = [[_selectedSide - 1] call BIS_fnc_sideType, _objectUnderCursor] call BIS_fnc_addRespawnPosition;
		[[_objectUnderCursor, 1, _marker, 1, 1], Shadec_fnc_assignFob] remoteExec ["spawn", 2];
	};

	_activeRespawnPositions pushBack [_selectedMarkerText, _objectUnderCursor, _respawnPositionData]; diag_log format ["VARS CHECK CRP | _activeRespawnPositions: %1", _activeRespawnPositions];
	missionNamespace setVariable ["activeRespawnPositions", _activeRespawnPositions];

}] call Ares_fnc_RegisterCustomModule;