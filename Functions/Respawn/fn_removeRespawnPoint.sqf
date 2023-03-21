//

params ["_marker", "_showNotification"];

_respawnPositions = missionNamespace getVariable ["SAA_respawnPoints", []]; //diag_log format ["VARS CHECK RRP | _respawnPositions: %1", _respawnPositions];
_respawnPositionIndex = _respawnPositions findIf {(_x # 0) isEqualTo _marker};

if (_respawnPositionIndex isEqualTo -1) exitWith {diag_log format ["FN_removeRespawnPoint ERROR | Position Index not found"]};

if ("CV" in (_respawnPositions # _respawnPositionIndex # 0)) then {[_respawnPositions # _respawnPositionIndex # 1] call Shadec_fnc_removeFob};
(_respawnPositions # _respawnPositionIndex # 2) call BIS_fnc_removeRespawnPosition;

if (_showNotification) then {
	[[markerText _marker], {
		params ["_markerText"];
		systemChat format ["> Server: %1 '%2' %3.", localize "STR_SAA_GENERAL_RESPAWN_POINT", _markerText, toLower localize "STR_SAA_GENERAL_REMOVED"];
	}] remoteExec ["call", -2];
};

deleteMarker _marker;

_respawnPositions deleteAt _respawnPositionIndex; //diag_log format ["VARS CHECK RRP | _respawnPositions: %1", _respawnPositions];
missionNamespace setVariable ["SAA_respawnPoints", _respawnPositions, true];

// Remove from JIP queue
remoteExec ["", format["SAA_respawnPoint_%1", _marker]];

//return
true