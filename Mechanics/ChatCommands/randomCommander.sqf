// Comms random
["comrand", {
    params ["_num"];

	if !((player getVariable ["SAA_Rank", "PV1"]) in ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT"]) exitWith {};

	private _minIntervalLocal = 60;
	private _minIntervalGlobal = 30;

	private _lastTimeCalledLocal = player getVariable ["comrand_last_call_local", 0];
	private _interval = serverTime - _lastTimeCalledLocal;
	if (_interval < _minIntervalLocal) exitWith {
		systemChat format ["> Server: " + localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_ERROR_TIME_LIMIT_LOCAL", _minIntervalLocal, (_minIntervalLocal - _interval) toFixed 0];
	};

	private _lastTimeCalledGlobal = missionNamespace getVariable ["comrand_last_call_global", 0];
	_interval = serverTime - _lastTimeCalledGlobal;
	if (_interval < _minIntervalGlobal) exitWith {
		systemChat format ["> Server: " + localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_ERROR_TIME_LIMIT_GLOBAL", _minIntervalGlobal, _interval toFixed 0];
	};

	_num = _num call BIS_fnc_parseNumber;

	if (_num < 0) exitWith {
		systemChat format ["> Server: %1" ,localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_ERROR_WRONG_USAGE"];
		systemChat format [" #comrand <%1>", toUpper (localize "STR_SAA_GENERAL_NUMBER")];
	};

	if (_num < 1) exitWith {
		systemChat format ["> Server: %1", localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_ERROR_MUST_BE_GREATER_THAN_ONE"];
	};

	private _potentialCommandersNum = count (([side player] call Shadec_fnc_getPlayers) select {(_x getVariable ["SAA_Rank", "PV1"]) in ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT"]});

	if (_num > _potentialCommandersNum) exitWith {
		systemChat format ["> Server: %1: %2", localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_ERROR_MUST_NOT_BE_GREATER_THAN_POTENTIAL_COMMANDERS", _potentialCommandersNum];
	};

	player setVariable ["comrand_last_call_local", serverTime];
	missionNamespace setVariable ["comrand_last_call_global", 0];
	
	[[_num, name player], Shadec_fnc_randomCommanders] remoteExec ["call", 2];
}, "all"] call CBA_fnc_registerChatCommand;