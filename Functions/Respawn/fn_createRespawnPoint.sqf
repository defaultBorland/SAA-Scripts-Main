//

params ["_position","_objectUnderCursor", "_side", "_marker",  "_showNotification"];

_respawnPositions = missionNamespace getVariable ["respawnPositions", []];
_respawnPositionData = [];
_respawnTarget = []; // Object or Position

if (isNull _objectUnderCursor) then {
	diag_log format ["fn_createRespawnPos: POSITION TYPE"];
	_respawnPositionData = [_side, _position, markerText _marker] call BIS_fnc_addRespawnPosition; // Marker -> Position
	if (_showNotification) then {
		[format["Respawn Point '%1' added.", markerText _marker]] remoteExec ["hint", -2];
		[format[">Server: Respawn Point '%1' added.", markerText _marker]] remoteExec ["systemChat", -2];
	};
	_respawnTarget pushBack _position; // КОСТЫЛЬ
} else {
	diag_log format ["fn_createRespawnPos: OBJECT TYPE"];
	_respawnPositionData = [_side, _objectUnderCursor, markerText _marker] call BIS_fnc_addRespawnPosition;
	[[_objectUnderCursor, 1, _marker, 1, 1], Shadec_fnc_assignFob] remoteExec ["spawn", 2];
	_respawnTarget pushBack _objectUnderCursor; // КОСТЫЛЬ
};

_respawnPositions pushBack [_marker, _respawnTarget # 0, _respawnPositionData]; diag_log format ["VARS CHECK CRP | _respawnPositions: %1", _respawnPositions];
missionNamespace setVariable ["respawnPositions", _respawnPositions, true];

//return
true