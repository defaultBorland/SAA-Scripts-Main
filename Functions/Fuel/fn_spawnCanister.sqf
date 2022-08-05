params ["_position", "_canister", "_fuelPercent"];

private _object = createVehicle [_canister, ASLToAGL _position, [], 0, "CAN_COLLIDE"];

if (_fuelPercent isNotEqualTo 1) then {
	private _fuel = _object call ace_refuel_fnc_getFuel;
	_fuel *= _fuelPercent;

	[[_object, _fuel], {
		_this call ace_refuel_fnc_setFuel;
	}] remoteExec ["call", -2];
};

if (_canister in ["Land_CanisterFuel_F", "Land_CanisterFuel_Blue_F", "Land_CanisterFuel_Red_F", "Land_CanisterFuel_White_F"]) then {
	[[_object], {
		params ["_object"];
		[_object, true] call ace_dragging_fnc_setCarryable;
	}] remoteExec ["call", -2, true];
};

_object