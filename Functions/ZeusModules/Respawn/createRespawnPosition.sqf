//

["[SAA] Respawn", "Create FOB / Respawn Position",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	_markerTypesNames = ["Respawn","Infantry Respawn","Start Marker"];
	_markerTypes = ["respawn_unknown","respawn_inf","mil_start"];
	_markerColors = ["Blue","Red","Green","Black","Yellow"];

	private _dialogResult =
	[
		"Create Respawn Position / FOB",
		[
			["Select marker type:", _markerTypesNames, 0],
			["Select marker color", _markerColors, 0],
			["Respawn Side", "SIDE", 1],
			["Marker/Respawn Name:","","WRITE SOMETHING!"],
			["Show notification to players:", ["No", "Yes"], 1]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_selectedMarkerType", "_selectedMarkerColor", "_selectedSide", "_selectedMarkerText", "_showNotification"];

	_SIDE = toLower str([_selectedSide - 1] call BIS_fnc_sideType);
	_COLOR = "Color" + (_markerColors # _selectedMarkerColor);

	_markerPrefix = "";
	if (isNull _objectUnderCursor) then {
		_markerPrefix = "POS";
	} else {
		_markerPrefix = "FOB";
	};

	_markerNum = {_SIDE in _x} count allMapMarkers;
	_marker = createMarker [format["%1_%2_%3", _markerPrefix, _SIDE, _markerNum], _position]; // [format["respawn_%1_%2", _SIDE, _markerNum], _position];
	_marker setMarkerType (_markerTypes # _selectedMarkerType);
	_marker setMarkerColor _COLOR;
	_marker setMarkerText _selectedMarkerText;

	[[_position, _objectUnderCursor, [_selectedSide - 1] call BIS_fnc_sideType, _marker, _showNotification], Shadec_fnc_createRespawnPosition] remoteExec ["spawn", 2];


}] call Ares_fnc_RegisterCustomModule;