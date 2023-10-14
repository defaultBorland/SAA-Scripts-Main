//
params ["_position","_objectUnderCursor", "_side", "_marker",  ["_showNotification", true]];

_respawnPositions = missionNamespace getVariable ["SAA_respawnPoints", []];
_respawnPositionData = [];
_respawnTarget = []; // Object or Position

if (isNull _objectUnderCursor) then {
	//diag_log format ["fn_createRespawnPos: POSITION TYPE"];
	_respawnPositionData = [_side, [_position # 0, _position # 1], markerText _marker] call BIS_fnc_addRespawnPosition; // Marker -> Position
	
	if (_showNotification) then {

	private _sidesInfo = [
		[east, "#800000", "\A3\UI_F\data\Map\Markers\NATO\o_unknown"], 
		[west, "#004D99", "\A3\UI_F\data\Map\Markers\NATO\b_unknown"], 
		[independent, "#008000", "\A3\UI_F\data\Map\Markers\NATO\n_unknown"], 
		[civilian, "#660080", "\A3\UI_F\data\Map\Markers\NATO\b_unknown"]
	];
	private _info = _sidesInfo # ([_side] call BIS_fnc_sideID);

		[[_marker, _side, _info], {
			params ["_marker", "_side", "_sideInfo"];
			_sideInfo params ["_side", "_color", "_picture"];
			
			hint parseText format ["<t align='center'>%1</t><t align='center'><img size='4' color='%2' image='%3'/></t><br/><br/><t align='center' shadow='1' shadowColor='#000000'>%4</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%5: %6</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%7: %8</t>", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_MESSAGE_RESPAWNPOINTCREATED", _color, _picture, markerText _marker, localize "STR_SAA_GENERAL_DIRECTION", floor (player getDir markerPos _marker), localize "STR_SAA_GENERAL_DISTANCE", round (player distance getMarkerPos _marker)];

			systemChat format ["> Server: %1 '%2' %3.",localize "STR_SAA_GENERAL_RESPAWN_POINT", markerText _marker, toLower localize "STR_SAA_GENERAL_CREATED"];
		}] remoteExec ["call", -2];
	};
	_respawnTarget pushBack _position; // КОСТЫЛЬ
	[nil, _marker, _side, false, 1, 0] call Shadec_fnc_markerTracking;
} else {
	//diag_log format ["fn_createRespawnPos: OBJECT TYPE"];
	_respawnPositionData = [_side, _objectUnderCursor, markerText _marker] call BIS_fnc_addRespawnPosition;
	[[_objectUnderCursor, _marker, 1, 1, _showNotification], Shadec_fnc_assignFob] remoteExec ["spawn", 2];
	_respawnTarget pushBack _objectUnderCursor; // КОСТЫЛЬ
	[_objectUnderCursor, _marker, _side, true, 1, 0] call Shadec_fnc_markerTracking;
};

_respawnPositions pushBack [_marker, _respawnTarget # 0, _respawnPositionData]; //diag_log format ["VARS CHECK CRP | _respawnPositions: %1", _respawnPositions];
missionNamespace setVariable ["SAA_respawnPoints", _respawnPositions, true];

//return
true