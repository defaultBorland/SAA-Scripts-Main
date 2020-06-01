params["_target", "_side"];

if (_target isEqualTo "Zeus") then {
	[format["[Private] %1 side respawn tickets remaining: %2", toUpper str _side, [_side, 0] call BIS_fnc_respawnTickets]] remoteExec ["systemChat", remoteExecutedOwner];
	[[format["%1 side respawn tickets remaining: %2", toUpper str _side, [_side, 0] call BIS_fnc_respawnTickets], "Plain", 2]] remoteExec ["cutText", remoteExecutedOwner];
} else {[format["> Server: %1 side respawn tickets remaining: %2", toUpper str _side, [_side, 0] call BIS_fnc_respawnTickets]] remoteExec ["systemChat"]};

//return
respawnTickets

// BIS_fnc_respawnSide
// Try to track players respawn time and monitor this info on Zeus display