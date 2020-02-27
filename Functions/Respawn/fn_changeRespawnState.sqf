params["_target", "_state", "_notification"];

switch (_state) do {
	case "Enable": {
		if (_target isEqualTo "All") then {
			respawnEnabled = true;
			_deadPlayers = [];
			_deadPlayers = allPlayers select {!alive _x};
			_deadPlayers = _deadPlayers apply {owner _x};
			
			diag_log format ["Dead players when fnc_changeRespawnStateEnableAll called: %1", _deadPlayers];
			diag_log format ["respawnTickets when fnc_changeRespawnStateEnableAll called: %1", respawnTickets];
			diag_log format ["ReservedTickets when fnc_changeRespawnStateEnableAll called: %1", reservedTickets];

			if !(_deadPlayers isEqualTo []) then {
				_deadPlayers = _deadPlayers - [reservedIDs]; // from 19 line
				if (count _deadPlayers > respawnTickets-reservedTickets) then { // "-reservedTickets" added
					_deadPlayers = _deadPlayers call BIS_fnc_arrayShuffle;
					_deadPlayers resize respawnTickets;
				};
				{
					diag_log format ["Lucky boy: %1", _x];
					_index = reservedIDs pushBackUnique _x;
					if (_index > -1) then {
						reservedTickets = reservedTickets + 1;
						[respawnTime] remoteExec ["setPlayerRespawnTime", _x];
					};
				} forEach _deadPlayers;
			};
			switch (_notification) do {
				case "Target";
				case "All": {
					[format["Respawn enabled."]] remoteExec ["systemChat"];
					[["RESPAWN ENABLED!", "Plain", 2]] remoteExec ["cutText"];
				};
				case "Nobody";
				default {};
			};
		} else {
			_players = allPlayers;
			_targetList = _players apply {name _x};
			_idList = _players apply {owner _x};
			_result = (_targetList findIf {_x isEqualTo _target});
			if (_result isEqualTo -1) exitWith {["Can't find player with given name."] remoteExec ["systemChat", remoteExecutedOwner]};

			missionNamespace setVariable [format["respawnEnabled_%1", getPlayerUID (allPlayers # _result)], true, true];
			
			if (respawnTickets > 0) then {
				if (alive (allPlayers # _result)) exitWith {};
				if (reservedTickets < respawnTickets) then {
					_index = reservedIDs pushBackUnique (_idList # _result);
					if (_index > -1) then {
						reservedTickets = reservedTickets + 1;
						[respawnTime] remoteExec ["setPlayerRespawnTime", _idList # _result];
					};
				};
			};

			[[format["Respawn for %1 now is enabled.", _targetList # _result], "Plain Down", 2]] remoteExec ["cutText", remoteExecutedOwner];
			switch (_notification) do {
				case "All": {
					[["RESPAWN FOR YOU NOW IS ENABLED!", "Plain", 2]] remoteExec ["cutText", _idList # _result];
					[format["Respawn for %1 is enabled!", _targetList # _result]] remoteExec ["systemChat"];
				};
				case "Target": {
					[["RESPAWN FOR YOU NOW IS ENABLED!", "Plain", 2]] remoteExec ["cutText", _idList # _result];
					["Respawn for you now is enabled!"] remoteExec ["systemChat", _idList # _result];
				};
				case "Nobody";
				default {};
			};
		};
	};
	case "Disable": {
		if (_target isEqualTo "All") then {
			respawnEnabled = false;
			reservedTickets = 0;
			reservedIDs resize 0;
			[9999] remoteExec ["setPlayerRespawnTime"];
			switch (_notification) do {
				case "Target";
				case "All": {
					[format["Respawn disabled."]] remoteExec ["systemChat"];
					[["RESPAWN DISABLED!", "Plain", 2]] remoteExec ["cutText"];
				};
				case "Nobody";
				default {};
			};
		} else {
			_players = allPlayers;
			_targetList = _players apply {name _x};
			_idList = _players apply {owner _x};
			_result = (_targetList findIf {_x isEqualTo _target});
			if (_result isEqualTo -1) exitWith {["Can't find player with given name."] remoteExec ["systemChat", remoteExecutedOwner]};

			missionNamespace setVariable [format["respawnEnabled_%1", getPlayerUID (allPlayers # _result)], false, true];

			if !(alive(_players # _result)) then {
				_result = (reservedIDs findIf {_x isEqualTo (_idList # _result)});
				if (_result > -1) then {
					[9999] remoteExec ["setPlayerRespawnTime", _idList # _result];
					reservedIDs deleteAt _result;
					reservedTickets = reservedTickets - 1;
				};
			};

			[[format["Respawn for %1 now is disabled.", _targetList # _result], "Plain Down", 2]] remoteExec ["cutText", remoteExecutedOwner];
			switch (_notification) do {
				case "All": {
					[["RESPAWN FOR YOU NOW IS DISABLED!", "Plain", 2]] remoteExec ["cutText", _idList # _result];
					[format["Respawn for %1 is disabled!", _targetList # _result]] remoteExec ["systemChat"];
				};
				case "Target": {
					[["RESPAWN FOR YOU NOW IS DISABLED!", "Plain", 2]] remoteExec ["cutText", _idList # _result];
					["Respawn for you now is disabled!"] remoteExec ["systemChat", _idList # _result];
				};
				case "Nobody";
				default {};
			};
		};
	};
};


//return
true