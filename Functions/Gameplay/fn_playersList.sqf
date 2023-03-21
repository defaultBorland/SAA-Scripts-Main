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

fnc_returnMessage = {
	[_this, {
		params ["_headerFormat", "_header", "_bodyFormat", "_bodyMessage"];

		hintSilent parseText (
			format[_headerFormat, [_header, localize _header] select (isLocalized _header)]
			+
			format[_bodyFormat, [_bodyMessage, localize _bodyMessage] select (isLocalized _bodyMessage)]
		);

	}] remoteExec ["call", remoteExecutedOwner];
};

if (!isDedicated) exitWith {};

//
params [["_status", "All"], ["_side", west]];

forceUnicode 0;

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
	[
		"<t size='2.0' color='#ff0000' align='center' font='PuristaBold'>%1</t><br/>",
		"STR_SAA_GENERAL_" + toUpper _status,
		"<t size='1.5' align='center'>%1</t><br/>",
		"STR_SAA_PLAYERSLIST_NO_SUCH_PLAYERS"
	] call fnc_returnMessage;
};

_players = _players apply {[
	_x,
	_x getVariable ["SAA_Rank", "PV1"],
	_x getVariable ["SAA_PrimaryClass", "Rifleman"],
	_x getVariable ["SAA_SecondaryClass", "None"],
	["No group", groupId group _x] select ((count units group _x) > 1),
	_x isEqualTo (leader group _x) && {count units group _x > 1}
]};

private _maxNameLength = selectMax (_players apply {count (name (_x # 0))});
if (_maxNameLength > 12) then {_maxNameLength = 12};

private _groups = _players apply {_x # 4};
_groups = _groups arrayIntersect _groups;

if ("No group" in _groups) then {
	_groups = _groups - ["No group"];
	_groups pushBack "No group";
};

private _playersGrouped = _groups apply {
	private _group = _x;
	_players select {_x # 4 isEqualTo _group}
};

private _headerFormat = format [
    "<t size='2.0' color='#ff0000' align='center' font='PuristaBold'>%1</t><t size='1.5' color='#ff0000' align='center' font='PuristaSemibold'> (%2)</t><br/>",
    "%1",
    [format["%1/%2", _targetPlayersCount, _allPlayersCount], _targetPlayersCount] select ((toLower _status) in ["squad", "all"])
];

private _bodyFormat = "";

{
    private _squad = _x;
    private _groupName = _squad # 0 # 4;

    _bodyFormat = _bodyFormat + format [
        "<t size='1.5' align='center' font='RobotoCondensedBold'>%1 (%2/%3)</t><br/>", // Group Header
        _groupName,
        count _squad,
        _targetPlayersCount
    ];
    
    private _leader = (_squad select {_x # 5}) # 0;
    _leader params ["_leader", "_leader_rank", "_leader_class1", "_leader_class2"];
    if (!isNil {_leader}) then {
        _bodyFormat = _bodyFormat + format [
            "<t align='center' size='1' font='EtelkaMonospaceProBold'>%4 %1 <img size='1' image='%2'/> <img size='1' image='%3'/></t><br/>",
            
            [name _leader, _maxNameLength] call fnc_formatName,
            "img\Classes\" + _leader_class1 + ".paa",
            "img\Classes\" + _leader_class2 + ".paa",
            _leader_rank
        ];
    };

    _squad = _squad select {!(_x # 5)};
    if (_squad isEqualTo []) then {continue};

    {
        _x params ["_member", "_member_rank", "_member_class1", "_member_class2", "_member_squad", "_member_isLeader"];
        
        _bodyFormat = _bodyFormat + format [
            "<t align='center' size='1' font='EtelkaMonospacePro'>%4 %1 <img size='1' image='%2'/> <img size='1' image='%3'/></t><br/>",
            
            [name _member, _maxNameLength] call fnc_formatName,
            "img\Classes\" + _member_class1 + ".paa",
            "img\Classes\" + _member_class2 + ".paa",
            _member_rank
        ]

    } forEach _squad;

    _bodyFormat = _bodyFormat + "<br/>";
} forEach _playersGrouped;

[
	_headerFormat,
	"STR_SAA_GENERAL_" + toUpper _status,
	_bodyFormat,
	""
] call fnc_returnMessage;