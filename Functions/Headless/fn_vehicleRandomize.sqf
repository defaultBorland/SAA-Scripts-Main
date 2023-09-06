params["_vehicle"];

[{
	params ["_vehicle"];
	sleep 0.1;
	[_vehicle, true, true, true, true] call Shadec_fnc_clearContainerInventory;

	sleep 1;
	switch(true) do {
		case (_vehicle isKindOf "Air"): {
			private _crewCount = [typeOf _vehicle, true] call BIS_fnc_crewCount;
			_vehicle addBackpackCargoGlobal ["B_Parachute", _crewCount];
		};
		default {
			_vehicle setFuel ((random [18, 33, 65]) / 100);
		};
	};
}, [_vehicle], 0.4] call CBA_fnc_waitAndExecute;