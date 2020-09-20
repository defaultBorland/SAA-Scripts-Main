params ["_time"];

if (_time < 10) exitWith {[["> Error: Respawn time can't be less than 10 seconds."] remoteExec ["systemChat", remoteExecutedOwner]]};

missionNamespace setVariable ["respawnTimeDifference", respawnTime - _time, true];
missionNamespace setVariable ["respawnTime", _time, true];
[format["> Server: Respawn time was changed. New value: %1", _time]] remoteExec ["systemChat"];

{
	{
		private _timeDiff = missionNamespace getVariable ["respawnTimeDifference", 0];
		if ((playerRespawnTime < 9999) and (playerRespawnTime > 0)) then {
			if ((playerRespawnTime - _timeDiff) > 5) then {
				setPlayerRespawnTime (playerRespawnTime - _timeDiff);
			} else {setPlayerRespawnTime 5};
		};
	} remoteExec ["call", _x];
} forEach allPlayers;

//return
true