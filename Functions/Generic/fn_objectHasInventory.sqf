//
params ["_object"];

private _className = "";

if (_object isEqualType objNull) then {
	_className = typeOf _object;
} else {
	_clasname = _object;
};

private _tb = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxbackpacks");
private _tm = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxmagazines");
private _tw = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxweapons");
private _return = if (_tb > 0  || _tm > 0 || _tw > 0) then {true} else {false};

_return