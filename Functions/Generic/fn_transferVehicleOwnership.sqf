//
params ["_vehicle"];

[{
	params ["_vehicle"];
	[[_vehicle], {
		params ["_vehicle"];
		
		// Send to headless if present
		private _newOwner = call Shadec_fnc_determineBestOwner;

		// If empty - do not respawn
		if (count crew _vehicle < 1) exitWith {
			[[_vehicle, _newOwner], {(_this # 0) setOwner (_this # 1)}] remoteExec ["call", _newOwner];
		};

		// Respawn on server side
		[[_vehicle], {
			params ["_vehicle"];

			//private _pos = getPos _vehicle;
			private _pos = _vehicle modelToWorld [0, 0, 0.05];
			private _dir = getDir _vehicle;
			private _vehicleType = typeOf _vehicle;
			private _side = side group _vehicle;
			private _fuel = fuel _vehicle;

			{ _vehicle deleteVehicleCrew _x } forEach crew _vehicle;
			waitUntil {count crew _vehicle isEqualTo 0};
			deleteVehicle _vehicle;

			waitUntil {_vehicle isEqualTo objNull};
			sleep 0.4;
			([_pos, _dir, _vehicleType, _side] call BIS_fnc_spawnVehicle) params ["_vehicle", "_crew", "_group"];
			
			sleep 0.1;
			_vehicle setFuel _fuel;
			[_vehicle, true, true, true, true] call Shadec_fnc_clearContainerInventory;
			
			sleep 1;
			switch(true) do {
				case (_vehicle isKindOf "Air"): {
					_vehicle addBackpackCargoGlobal ["B_Parachute", 8];
				};
				default {
					_vehicle setFuel ((random [18, 33, 65]) / 100);
				};
			};
		}] remoteExec ["spawn", _newOwner];

	}] remoteExec ["call", 2];
}, [_vehicle], 0.4] call CBA_fnc_waitAndExecute;