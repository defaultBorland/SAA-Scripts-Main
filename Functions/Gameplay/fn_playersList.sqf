fnc_FormatClasses = {
	params ["_class"];
	disableSerialization;

	_returnString = "";
	switch (_class) do {
		case "Rifleman": {_returnString = "RIFLE"};
		case "Nurse": {_returnString = "NURSE"};
		case "Machinegunner": {_returnString = "MG"};
		case "Engineer": {_returnString = "ENG"};
		case "ATSpec": {_returnString = "AT/AA"};
		case "Medic": {_returnString = "MED"};
		case "Grenadier": {_returnString = "GREN"};
		case "Marksman": {_returnString = "MARKS"};
		case "Sniper": {_returnString = "SNIP"};
		case "None": {_returnString = "NONE"};
	};
	_returnString
};

fnc_NoReturn = {
	params ["_status", "_isOnlyToCaller"];

	if (_status isEqualTo "All") then {_status = "non-zeus"};

	if (_isOnlyToCaller) then {
		[format["There are no %1 players!", toLower _status]] remoteExec ["hintSilent", remoteExecutedOwner];
	} else {
		[format["There are no %1 players!", toLower _status]] remoteExec ["hint"]
	};

};


params ["_status", "_groupBy", "_isOnlyToCaller", ["_caller", objNull]];
disableSerialization;

private _players = allPlayers - (allCurators apply {getAssignedCuratorUnit _x});

private _playersCount = count _players;

switch (_status) do {
	case "Alive": {_players = _players select {alive _x}};
	case "Dead": {_players = _players select {!alive _x}};
	case "All";
	default {};
};

// If no players with selected status - exit with message
if (_players isEqualTo []) exitWith {[_status, _isOnlyToCaller] call fnc_NoReturn};

private _targetsCount = count _players;

diag_log format ["playersList FNC | _players to show: %1", _players];

_players = _players apply {[name _x] + (missionNamespace getVariable (format["%1_DATA", getPlayerUID _x])) + [_x, [grpNull, group _x] select ((count units group _x) > 1)]};
// [Name, Rank, Class1, Class2, Unit, Group or grpNull if alone]

// Grouping player by selected stat
private _groupOrder = [];
private _playersGrouped = [];
switch (_groupBy) do {
	case "Ranks": {
		_ranksRanging = ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT","SPC","PV2","PV1"];
		_groupOrder = _players apply {_x # 1};
		_groupOrder = _groupOrder arrayIntersect _ranksRanging; // ex: ["SMC", "MSG", "SGT", "PV2"];

		{
			_groupOrderCurrent = _x;
			_playersGrouped pushBack [_groupOrderCurrent, (_players select {_groupOrderCurrent in _x})];
		} forEach _groupOrder;
	};
	case "Classes": {
		_groupOrder = _players apply {_x # 2};
		_groupOrder = _groupOrder arrayIntersect _groupOrder;
		_groupOrder sort true; // ex: ["ATSpec", "Engineer", "Rifleman"];

		{
			_groupOrderCurrent = _x;
			_playersGrouped pushBack [[_groupOrderCurrent, "LS"] call Shadec_fnc_classSwitcher, (_players select {_groupOrderCurrent in _x})];
		} forEach _groupOrder;
	};
	case "Groups": {
		_groupOrder = _players apply {_x # 5};
		_groupOrder = _groupOrder arrayIntersect _groupOrder; 
		_groupOrder = _groupOrder - [grpNull]; _groupOrder pushBack grpNull; // ex: [grp1, grp2]

		{
			_groupOrderCurrent = _x;	//diag_log format ["playersList FNC | _groupOrderCurrent: %1 | %2 | %3", _groupOrderCurrent, typeName _groupOrderCurrent, groupId _groupOrderCurrent];
			_playersGrouped pushBack [format["%1 (%2)", [groupId _groupOrderCurrent, "FREE"] select (_x isEqualTo grpNull), [name leader _groupOrderCurrent, "NO GROUP"] select (_x isEqualTo grpNull)], (_players select {_groupOrderCurrent in _x})];
		} forEach _groupOrder;
	};
	case "Squad": {
		if (_caller isEqualTo objNull) exitWith {diag_log format ["playersList FNC ERROR | No object passed into squad case"]};
		_status = "Squad";
		_playersGrouped pushBack [format ["%1 (%2)", groupID group _caller, name leader group _caller], _players select {(_x # 5) isEqualTo (group _caller)}];
		_targetsCount = "-";
		_playersCount = "-";
	};
	default {};
};

diag_log format ["playersList FNC | _players modified: %1", _playersGrouped];

// Compose Structured Text
_structuredText = "";
_structuredText = format["<t size='2.0' color='#ff0000' align='center' font='PuristaBold'>%1</t><t size='1.5' color='#ff0000' align='center' font='PuristaSemibold'> %2/%3</t><br/>", _status, _targetsCount, _playersCount];
{
	_currentGroup = _x # 1;
	if (count _currentGroup < 1) then {continue}; // YOBANY COSTYL, REMOVING GRPNULL GROUP IF EMPTY
	_header = [_x # 0, localize (_x # 0)] select (_groupBy isEqualTo "Classes");
	_structuredText = _structuredText + format["<t size='1.5' align='center'>%1 [%2/%3]</t><br/>", _header, count _currentGroup, _playersCount];
	{
		_structuredText = _structuredText + format["<t size='1.0' align='center'>[%1]  %2  [%3/%4]</t><br/>", _x # 1, _x # 0, _x # 2, _x # 3];
	} forEach _currentGroup;
} forEach _playersGrouped;

// Show composed text
if (_isOnlyToCaller) then {
	// [[_structuredText, "Plain", 2, false, true]] remoteExec ["cutText", remoteExecutedOwner];
	[parseText _structuredText] remoteExec ["hintSilent", remoteExecutedOwner];
} else {
	[parseText _structuredText] remoteExec ["hint"];
};

//return
true