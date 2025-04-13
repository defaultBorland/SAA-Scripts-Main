params ["_numComs", "_initiatorName"];

if (_numComs < 1) exitWith {};

[format["> Server: " + localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_MESSAGE_PLAYER_INIT_COMMRAND", _initiatorName]] remoteExec ["systemChat", -2];

private _potentialComs = ([side player] call Shadec_fnc_getPlayers) select {
	!(_x getVariable ["SAA_isGuest", false]) 
	&& (_x getVariable ["SAA_isOfficer", false])
};

private _comsStats = [_potentialComs apply {getPlayerUID _x}] call Shadec_db_server_fnc_getCommandingStats;
private _weights = [];
private _players = [];
private _max = selectMax (_comsStats apply {_x # 1});
private _min = selectMin (_comsStats apply {_x # 1});
{
	private _uid = getPlayerUID _x;
	private _index = (_comsStats apply {_x # 0}) findIf {_x isEqualTo _uid};
	if (_index > -1) then {
		private _stats = _comsStats # _index # 1;
		_weights pushBack (linearConversion [_min, _max, _stats, _max, _min]);
	} else {
		_weights pushBack 5;
	};
	_players pushBack _x;
} forEach _potentialComs;

_weights = _weights apply {_x * 2};

private _weightsTotal = [_weights] call Shadec_fnc_sumArray;

private _comsWithChances = [];
{_comsWithChances pushBack format["%1 (%2%3)", name _x, round((_weights # _forEachIndex) / _weightsTotal * 100), "%"]} forEach _players;

[[_comsWithChances], {systemChat format ["> Server: " + localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_MESSAGE_POTENTIAL_COMMANDERS", (_this # 0) joinString ", "]}] remoteExec ["call", -2];

{
	if !(_x getVariable ["SAA_isPotentialCommander", true]) then {_weights deleteAt _forEachIndex};
} forEach _players;
_players = _players select {_x getVariable ["SAA_isPotentialCommander", true]};

private _selectedComs = []; 
for "_i" from 1 to _numComs do {
	private _selected = _players selectRandomWeighted _weights;
	private _index = _players findIf {_x isEqualTo _selected};
	if (_index < 0) exitWith {diag_log format["fnc_randomCommanders | Error: _index < 0"]};
	_players deleteAt _index;
	_weights deleteAt _index;
	_selectedComs pushBack _selected;
};

[[_numComs, _selectedComs apply {name _x}], {systemChat format ["> Server: " + localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_MESSAGE_RANDOMED_COMMANDERS", _this # 0, (_this # 1) joinString ", "]}] remoteExec ["call", -2];
{
	{
		while {dialog} do {closeDialog 0};
		[
			localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_MESSAGE_YOU_WERE_CHOSEN",
			localize "STR_SAA_GENERAL_NOTIFICATION",
			"OK"
		] spawn BIS_fnc_guiMessage;
	} remoteExec ["call", _x];
} forEach _selectedComs;