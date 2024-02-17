//
params ["_identity"];

private _unit = objNull;
if (isNil {_identity}) exitWith {_unit};
if !(_identity isEqualType "STRING") exitWith {_unit};

if ([_identity] call Shadec_fnc_isStringNumberValid) then {
	if (count _identity isEqualTo 17) then {
		// UID
		_unit = (allPlayers select {getPlayerUID _x isEqualTo _identity}) # 0;
	} else {
		// ID
		_unit = (allPlayers select {owner _x isEqualTo parseNumber _identity}) # 0;
	};
} else {
	// Name
	_unit = (allPlayers select {toLower(name _x) isEqualTo toLower(_identity)}) # 0;
};

if (isNil {_unit}) then {_unit = objNull};

_unit