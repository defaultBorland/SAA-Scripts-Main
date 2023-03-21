params ["_numComs", "_initiatorName"];

if (_numComs < 1) exitWith {};

[format["> Server: " + localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_MESSAGE_PLAYER_INIT_COMMRAND", _initiatorName]] remoteExec ["systemChat", -2];

_pComs = allPlayers select {(_x getVariable ["SAA_Rank", "PV1"]) in ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT"]};
[[_pComs apply {name _x}],{systemChat format ["> Server: " + localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_MESSAGE_POTENTIAL_COMMANDERS", (_this # 0) joinString ", "]}] remoteExec ["call", -2];

_pComs = _pComs select {_x getVariable ["SAA_isPotentialCommander", true]};
_aComs = []; 
for "_i" from 1 to _numComs do { 
	_temp = selectRandom _pComs;
	_pComs = _pComs - [_temp];
	_aComs = _acoms + [_temp];
};

[[_numComs, _aComs apply {name _x}], {systemChat format ["> Server: " + localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_MESSAGE_RANDOMED_COMMANDERS", _this # 0, (_this # 1) joinString ", "]}] remoteExec ["call", -2];
{
	{
		while {dialog} do {closeDialog 0};
		[format["<t size='1'>%1</t>", localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_MESSAGE_YOU_WERE_CHOSEN"], -1, -1, 6, 1, 0] spawn BIS_fnc_dynamicText;
	} remoteExec ["call", _x];
} forEach _aComs;