params ["_target", "_time"];

diag_log format ["FNC: forceRespawnTimer | TARGET: %1 | TIME: %2", _target, _time];

if (_target isEqualTo "AllDead") then {
	_target = (allPlayers - (allCurators apply {getAssignedCuratorUnit _x}) - (allPlayers select {alive _x})) apply {[name _x, owner _x]};
} else {
	_target = (allPlayers select {name _x isEqualTo _target}) apply {[name _x, owner _x]};
};

{
	[_time] remoteExec ["setPlayerRespawnTime", _x # 1];
	[format["%1, %2 %3.", _x # 0, localize "SAA_ZEUS_MODULES_RESPAWN_FORCERESPAWNTIMER_HINT_SYSTEMCHAT", round _time]] remoteExec ["systemChat"];
} forEach _target;

//return
true