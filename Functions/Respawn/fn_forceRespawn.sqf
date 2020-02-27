params["_target", "_time"]; //Todo with changing tickets
_target = _this # 0;
_time = _this # 1;

//Check if var exists

if !((typeName _time) isEqualTo "SCALAR") exitWith {["Invalid function parameters."] remoteExec ["systemChat"]};
if (_time < 2) then {_time = 2};

if !((typeName _target) isEqualTo "STRING") exitWith {["Invalid function parameters."] remoteExec ["systemChat"]};
if (_target isEqualTo "All") then {
	[_time] remoteExec ["setPlayerRespawnTime"];
	[format["All players will be respawned in %1 seconds.", _time]] remoteExec ["systemChat"];
	reservedTickets = 0;
} else {
	_players = allPlayers;
	_targetList = _players apply {name _x};
	_idList = _players apply {owner _x};

	_result = (_targetList find _target);
	if (_result isEqualTo -1) exitWith {["Can't find player with given name."] remoteExec ["systemChat"]};
	[_time] remoteExec ["setPlayerRespawnTime", _idList # _result];
	[format["%1 will be respawned in %2 seconds.", _target ,_time]] remoteExec ["systemChat"];
	if (!alive _players # _result) then {
		if ((reservedTickets > 0) and ((_idList # _result) in reservedIDs)) then {reservedTickets = reservedTickets - 1};
	};
};

//return
true