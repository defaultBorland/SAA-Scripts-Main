/* 
Description: Function compose array of users on mission by passed parametrs on serverside and return result array. Array consist players IDs or/and UIDs.

Syntax:
["Targets", "Type"] call Shadec_fnc_usersIDs;
Parameters:
[Targets, "Type"]: Array
Targets: string ("All", name, uid), object, id (cliend id)
Type: String

Return Value:
Array - Array with certain players id/uid/object or all of this. 
*/

params ["_target", "_type"];

if !((typeName _target) in ["OBJECT", "SCALAR", "STRING"]) exitWith {diag_log "fnc_usersIDs | ERROR: Invalid parameters"; []};
if !(_type isEqualType "String") exitWith {diag_log "fnc_usersIDs | ERROR: Invalid parameters"; []};

private _players = allPlayers select {!(_x getVariable ["SAA_isZeus", false])};

switch (typeName _target) do {
	case "OBJECT": {	// unit
		_players = _players select {_x isEqualTo _target};
	};
	case "SCALAR": {	// cliend id
		_players = _players select {(owner _x) isEqualTo _target};
	};
	case "STRING": {	// name, uid, all
		if ((toLower _target) isEqualTo "all") exitWith {}; // If All - no additional actions needed
		if ((count str (parseNumber _target)) isEqualTo 17) exitWith { // If string was 17-digit UID
			_players = _players select {(getPlayerUID _x) isEqualTo _target};
		};
		_players = _players select {(name _x) isEqualTo _target}; // Overwise _target is player name
	};
	default {[]};
};

if (_players isEqualTo []) exitWith {diag_log "fnc_usersIDs | ERROR: No users with requested data"; []};

switch (toLower _type) do {
	case "name": {
		_players = _players apply {name _x};
	};
	case "uid": {
		_players = _players apply {getPlayerUID _x};
	};
	case "id": {
		_players = _players apply {owner _x};
	};
	case "object";
	default {};
};

//return
_players