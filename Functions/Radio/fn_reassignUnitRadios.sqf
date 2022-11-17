//
params["_unit"];

private _radios = _unit call TFAR_fnc_radiosList;
if (_radios isEqualTo []) exitWith {};

private _radiosSettings = _radios apply {_x call TFAR_fnc_getSwSettings};
private _baseRadios = _radios apply {getText (configFile >> "CfgWeapons" >> _x >> "tf_parent")};

{
	_unit unassignItem _x;
	_unit removeItem _x;
} forEach _radios;

{
	if (_forEachIndex isEqualTo 0) then {_unit linkItem _x} else {
		_unit addItem _x;
	};
} forEach _baseRadios;

[{
	params ["_unit", "_radiosSettings"];

	private _radios = _unit call TFAR_fnc_radiosList;
	{
		[_x, _radiosSettings # _forEachIndex] call TFAR_fnc_setSwSettings;
	} forEach _radios;

}, [_unit, _radiosSettings], 2] call CBA_fnc_waitAndExecute;