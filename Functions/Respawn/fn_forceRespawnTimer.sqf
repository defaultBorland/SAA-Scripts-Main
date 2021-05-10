params ["_target", "_time"];

diag_log format ["FNC: forceRespawnTimer | TARGET: %1 | TIME: %2", _target, _time];
{
	[_time] remoteExec ["setPlayerRespawnTime", _x # 1];
	[format["%1, %2 %3.", _x # 0, localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_HINT_SYSTEMCHAT", _time]] remoteExec ["systemChat"];
} forEach _target;

//return
true