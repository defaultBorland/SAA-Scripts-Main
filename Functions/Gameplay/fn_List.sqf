fnc_generateSpaces = {
	params ["_num"];

	private _string = "";
	for "_i" from 0 to _num do {
		_string = _string + " ";
	};

	_string
};

fnc_formatName = {
	params ["_name", "_maxNameLength"];

	if (count _name isEqualTo _maxNameLength) exitWith {_name};
	if (count _name < _maxNameLength) exitWith {_name + ([_maxNameLength - count _name - 1] call fnc_generateSpaces)};
	_name select [0, _maxNameLength]
};

forceUnicode 0;

//
params ["_status", "_side"];

private _players = [_side] call Shadec_fnc_getPlayers;
private _allPlayersCount = count _players;

switch (toLower _status) do {
	case "alive": {_players = _players select {alive _x}};
	case "dead": {_players = _players select {!alive _x}};
	default {};
};

private _targetPlayersCount = count _players;

// If there are no target players
if (_targetPlayersCount < 1) exitWith {
	[[_status, _targetPlayersCount, _allPlayersCount], {
		params ["_status", "_targetPlayersCount", "_allPlayersCount"];

		private _text = format["<t size='2.0' color='#ff0000' align='center' font='PuristaBold'>%1</t><br/>", localize ("STR_SAA_GENERAL_" + _status)] 
		+
		format["<t size='1.5' align='center'>%1</t><br/>", 
			format[localize "STR_SAA_PLAYERSLIST_NO_SUCH_PLAYERS", [
				("STR_SAA_GENERAL_" + _status),
				""
			] select {toLower _status isEqualTo "all"}];
		];

		hint parseText _text;

	}] remoteExec ["call", remoteExecutedOwner];
};

