params ["_time"];

if (_time < 5) exitWith {[["Respawn time can't be less than 5 seconds."] remoteExec ["systemChat"]]};

missionNamespace setVariable ["respawnTimeDifference", respawnTime - _time, true];
respawnTime = _time;

[format["Respawn time was changed. New value: %1", respawnTime]] remoteExec ["systemChat"];

{
	{
		private _time = missionNamespace getVariable ["respawnTimeDifference", 0];
		if (playerRespawnTime - _time >= 0) then {setPlayerRespawnTime (playerRespawnTime - _time)}
		else {setPlayerRespawnTime 5};
	} remoteExec ["call", _x];
} forEach reservedIDs;

//return
true