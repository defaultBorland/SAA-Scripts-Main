//
params [""];

private _players = [side player] call Shadec_fnc_getPlayers;
private _groups = _players apply {["No group", groupId group _x] select (count units group _x > 1)};
_groups = _groups arrayIntersect _groups;

// Removing 1-man groups
if ("No group" in _groups) then {_groups = _groups - ["No group"]};

// Removing player group as well
// private _myGroup = groupId group player;
// if (_myGroup in _groups) then {_groups = _groups - [_myGroup]};

//return
_groups