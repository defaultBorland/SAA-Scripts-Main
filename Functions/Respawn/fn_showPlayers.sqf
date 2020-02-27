params["_type", "_target"];

_players = allPlayers;
_zeuses = []; {_zeuses pushBack (getAssignedCuratorUnit _x)} forEach allCurators;
_players = _players - _zeuses;

switch (_type) do {
	case "Alive": {_players = _players select {alive _x}};
	case "Dead": {_players = _players select {!alive _x}};
	case "All";
	default {};
};

_players apply {name _x};

switch (_target) do {
	case "Zeus": {
		if !(_players isEqualTo []) then {
			_structuredText = format["%1 players:\n", _type];
			{_structuredText = _structuredText + name _x + "\n"} forEach _players;
			[[_structuredText, "Plain down", 2]] remoteExec ["cutText", remoteExecutedOwner];
		} else {
			[[format["There are no %1 players!", toLower _type], "Plain down", 2]] remoteExec ["cutText", remoteExecutedOwner];
		};
	};
	case "All": {
		if !(_players isEqualTo []) then {
			_structuredText = format["%1 players:\n", _type];
			{_structuredText = _structuredText + name _x + "\n"} forEach _players;
			[_structuredText] remoteExec ["hint"];
		} else {
			[format["There are no %1 players!", toLower _type]] remoteExec ["hint"]
		};
	};
	default {};
};

//return
true