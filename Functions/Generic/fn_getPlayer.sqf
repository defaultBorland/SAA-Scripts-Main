//
params ["_identity"];

private _unit = objNull;
if (isNil {_identity}) exitWith {_unit};
if (!(_identity isEqualType "STRING")) exitWith {_unit};

if ([_identity] call Shadec_fnc_isStringNumberValid) then {
	// UID
	_unit = (allPlayers select {getPlayerUID _x isEqualTo _identity}) # 0;
	if (isNil {_unit}) then {_unit = objNull};
} else {
	// Name
	_unit = (allPlayers select {name _x isEqualTo _identity}) # 0;
	if (isNil {_unit}) then {_unit = objNull};
};

_unit