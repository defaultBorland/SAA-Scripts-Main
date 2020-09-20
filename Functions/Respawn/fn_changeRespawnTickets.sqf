params["_side", "_value"];


// Change respawn tickets value
[_SIDE, _value] call BIS_fnc_respawnTickets;

// Message:
[format["> Server: Amount of %1 respawn tickets was changed. New value: %2", toUpper str _SIDE, [_SIDE, 0] call BIS_fnc_respawnTickets]] remoteExec ["systemChat", -2];

//return
true