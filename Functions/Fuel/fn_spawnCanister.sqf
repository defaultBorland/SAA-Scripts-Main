params ["_position", "_canister", "_fuelPercent"];

private _object = createVehicle [_canister, ASLToAGL _position, [], 0, "CAN_COLLIDE"];

[{
	params ["_object", "_fuelPercent"];
	
	private _fuel = [_object] call ace_refuel_fnc_getFuel;
	_fuel = _fuel * (parseNumber (_fuelPercent toFixed 1));
	[_object, _fuel] call ace_refuel_fnc_setFuel;
}, [_object, _fuelPercent], 1] call CBA_fnc_waitAndExecute;

{
	_x addCuratorEditableObjects [[_object], false];
} forEach allCurators; 

if (_canister in ["Land_CanisterFuel_F", "Land_CanisterFuel_Blue_F", "Land_CanisterFuel_Red_F", "Land_CanisterFuel_White_F"]) then {
	[[_object], {
		params ["_object"];
		[_object, true] call ace_dragging_fnc_setCarryable;
	}] remoteExec ["call", -2, true];
};

_object