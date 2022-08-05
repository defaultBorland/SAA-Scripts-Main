//
params ["_position", "_classname"];

private _vehicleIsShip = ((_classname call BIS_fnc_objectType) # 1) isEqualTo "Ship";
private _vehicle = createVehicle [_classname, _position select [0, 2], [], 0, "NONE"];

if (_vehicleIsShip) then {
	_vehicle setVehiclePosition [ASLToAGL _position, [], 0, "CAN_COLLIDE"];
};

_vehicle setVariable ["SAA_isGarageVehicle", true, true];

if (_vehicle isKindOf "LandVehicle" || _vehicle isKindOf "Ship") then {
	[_vehicle, true, true, true, true] call Shadec_fnc_clearVehicleInventory;

if (_vehicle isKindOf "Car") then {
	["rhsusf_props_ScepterMFC_OD", _vehicle, true] call ace_cargo_fnc_loadItem;
};

if (_vehicle isKindOf "Air") then {
	[_vehicle, true, true, true, false] call Shadec_fnc_clearVehicleInventory;
};


//return
_vehicle