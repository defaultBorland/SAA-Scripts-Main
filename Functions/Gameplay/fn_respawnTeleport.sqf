
fnc_getEmptyPlace = {
	params["_vehicle"];
	private ["_freeCargoPositions"];

	if !((_vehicle isKindOf "LandVehicle") or (_vehicle isKindOf "Helicopter") or (_vehicle isKindOf "Helicopter")) exitWith {"None"};

	_freeCargoPositions = _vehicle emptyPositions "Cargo";
	if (_freeCargoPositions > 0) exitWith {"Cargo"};
	_freeCargoPositions = _vehicle emptyPositions "Commander";
	if (_freeCargoPositions > 0) exitWith {"Commander"};
	_freeCargoPositions = _vehicle emptyPositions "Gunner";
	if (_freeCargoPositions > 0) exitWith {"Gunner"};
	"None"
};

params["_unit"];
private _side = side _unit;

private _markers = allMapMarkers apply {if (_x find "respawn" > -1) then {_x} else {"NULL"}};
_markers = _markers - ["NULL"];
if (_markers isEqualTo []) then {diag_log format["No respawn marker available"]};
diag_log format ["MARKERS:%1", _markers];

switch (_side) do {
	case WEST: {
		if ("respawn_west" in _markers) then {_unit setPos (getMarkerPos "respawn_west")}
		else {
			if !(_markers isEqualTo []) then {_unit setPos (getMarkerPos (_markers select 0))}
		};
	};
	case EAST: {
		if ("respawn_east" in _markers) then {_unit setPos (getMarkerPos "respawn_east")}
		else {
			if !(_markers isEqualTo []) then {_unit setPos (getMarkerPos (_markers select 0))}
		};
	};
	case RESISTANCE: {
		if ("respawn_guer" in _markers) then {_unit setPos (getMarkerPos "respawn_guer")}
		else {
			if !(_markers isEqualTo []) then {_unit setPos (getMarkerPos (_markers select 0))}
		};
	};
	default {};
};

private _vehicle = missionNamespace getVariable "respawnFOB";
if !((isNil {_vehicle}) or !(alive _vehicle)) then {
	switch ([_vehicle] call fnc_getEmptyPlace) do {
		case "Cargo": {{player moveInCargo (missionNamespace getVariable "respawnFOB")} remoteExec ["call", owner _unit]};
		case "Commander": {{player moveInCommander (missionNamespace getVariable "respawnFOB")} remoteExec ["call", owner _unit]};
		case "Gunner": {{player moveInGunner (missionNamespace getVariable "respawnFOB")} remoteExec ["call", owner _unit]};
		default {
			[["There is no empty place in 'FOB' vehicle", "Plain", 1]] remoteExec ["cutText", owner _unit];
			_emptyPosition = (getPosATL _vehicle) findEmptyPosition [5,30];
			_unit setPosATL _emptyPosition;
		};
	};
};

//return
true