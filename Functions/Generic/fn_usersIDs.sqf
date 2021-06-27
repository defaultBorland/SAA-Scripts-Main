/* 
Description: Function compose array of users on mission by passed parametrs on serverside and return result array. Array consist players IDs or/and UIDs.

Syntax:
["Targets", "Type"] call Shadec_fnc_usersIDs;
Parameters:
["Targets", "Type"]: Array
Targets: String
Type: String

Return Value:
Array - Array with certain players id/uid/object or all of this. 
*/

params ["_target", "_type"];

if !(_target isEqualType "STRING") exitWith {diag_log "fn_UsersIDs wrong 1 parametr"};
if !(_type isEqualType "STRING") exitWith {diag_log "fn_UsersIDs wrong 2 parametr"};

_players = [];

if (_target isEqualTo "All") then {
	_players = [] + allPlayers apply {[owner _x, getPlayerUID _x, _x]};
	_players = _players select {!((_x # 1) in (missionNamespace getVariable "ZeusArray"))};
	if (_players isEqualTo []) exitWith {[]};

	switch (_type) do {
		case "ID": {_players = _players apply {_x # 0}};
		case "UID": {_players = _players apply {_x # 1}};
		case "OBJ": {_players = _players apply {_x # 2}};
		case "All";
		default {[]};
	};
} else {
	_index = allPlayers findIF {_target isEqualTo name _x};
	if (_index < 0) exitWith {diag_log format ["User with name %1 not found.", _target]};
	switch (_type) do {
		case "ID": {_players pushBack owner(allPlayers # _index)};
		case "UID": {_players pushBack getPlayerUID(allPlayers # _index)};
		case "OBJ": {_players pushBack (allPlayers # _index)};
		case "All": {_players pushBack owner(allPlayers # _index)}; //?
		default {[]};
	};
};

// diag_log format ["fnc_usersIDs | return: %1", _players];

//return
_players