fnc_FormatClasses = {
	params ["_class"];
	disableSerialization;

	_returnString = "";
	switch (_class) do {
		case "Rifleman": {_returnString = "RIFLE"};
		case "Nurse": {_returnString = "NURSE"};
		case "Machinegunner": {_returnString = "MG"};
		case "Engineer": {_returnString = "ENG"};
		case "AT/AA-Spec": {_returnString = "AT/AA"};
		case "Medic": {_returnString = "MED"};
		case "Grenadier": {_returnString = "GREN"};
		case "Marksman": {_returnString = "MARKS"};
		case "Sniper": {_returnString = "SNIP"};
		case "None": {_returnString = "NONE"};
	};
	_returnString
};

_groupOrder = [];
_structuredText = "";

params["_playersType", "_target", "_groupBy"];
disableSerialization;

_players = allPlayers - (allCurators apply {getAssignedCuratorUnit _x});

_playersCount = count _players;

switch (_playersType) do {
	case "Alive": {_players = _players select {alive _x}};
	case "Dead": {_players = _players select {!alive _x}};
	case "All";
	default {};
};

_targetsCount = count _players;

diag_log format ["playersList FNC | _players to show: %1", _players];

_players = _players apply {[name _x] + (missionNamespace getVariable (format["%1_DATA", getPlayerUID _x]))};

if (_groupBy isEqualTo "Ranks") then {
	_ranksRanging = ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT","SPC","PV2","PV1"];
	_groupOrder = _players apply {_x # 1};
	_groupOrder = _ranksRanging arrayIntersect _groupOrder;
} else {
	_groupOrder = _players apply {_x # 2};
	_groupOrder = _groupOrder arrayIntersect _groupOrder;
	_groupOrder sort true;
};

_playersGrouped = [];
{
	_groupOrderValue = _x;
	_playersGrouped pushBack (_players select {_groupOrderValue in _x});
} forEach _groupOrder;

diag_log format ["playersList FNC | _players modified: %1", _playersGrouped];

_structuredText = format["<t size='2.0' color='#ff0000' align='center' font='PuristaBold'>%1</t><t size='1.5' color='#ff0000' align='center' font='PuristaSemibold'> %2/%3</t><br/>", _playersType, _targetsCount, _playersCount];
{
	_currentGroup = _x;
	_structuredText = _structuredText + format["<t size='1.5' align='center'>--- %1s ---</t><br/>", _groupOrder # _forEachIndex];
	{
		if (_groupBy isEqualTo "Ranks") then {
			_structuredText = _structuredText + format["<t size='1.0' align='center'>[%2]  %1  [%3]</t><br/>", _x # 0, _x # 2, _x # 3];
		} else {
			_structuredText = _structuredText + format["<t size='1.0' align='center'>[%2]  %1  [%3]</t><br/>", _x # 0, _x # 1, _x # 2];
		};
	} forEach _currentGroup;
} forEach _playersGrouped;

switch (_target) do {
	case "Only to Zeus": {
		if !(_players isEqualTo []) then {
			[[_structuredText, "Plain down", 2, false, true]] remoteExec ["cutText", remoteExecutedOwner];
		} else {
			[[format["There are no %1 players!", toLower _playersType], "Plain down", 2]] remoteExec ["cutText", remoteExecutedOwner];
		};
	};
	case "To all players": {
		if !(_players isEqualTo []) then {
			[parseText _structuredText] remoteExec ["hint"];
		} else {
			[format["There are no %1 players!", toLower _playersType]] remoteExec ["hint"]
		};
	};
	default {};
};

//return
true