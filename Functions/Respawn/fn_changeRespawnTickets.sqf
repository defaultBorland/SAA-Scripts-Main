params["_value", "_changeState"];
_value = _this # 0;
if !(typeName _value isEqualTo "SCALAR") exitWith {["Invalid function parameters."] remoteExec ["systemChat"]};
respawnTickets = respawnTickets + _value;
if (respawnTickets < 0) then {respawnTickets = 0};
if (_value isEqualTo 0) exitWith {};
[format["Amount of respawn tickets was changed. New value: %1", respawnTickets]] remoteExec ["systemChat"];

if (respawnTickets > 0 and (_changeState isEqualTo 1)) then {["All", "Enable", "Nobody"] call Shadec_fnc_changeRespawnState};
if (respawnTickets < 1) then {["All", "Disable", "All"] call Shadec_fnc_changeRespawnState};

//return
respawnTickets