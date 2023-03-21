// LOCAL EXEC ONLY
params ["_position", "_respawnVehicle", "_marker", "_side"];

while {!isNil{_marker}} do {
	sleep 1;

	_position = [getPos _respawnVehicle, _position] select (isNull _respawnVehicle);
	
	// Player is Zeus - show all respawn markers
	if (player getVariable ["SAA_isZeus", false]) then {
		_marker setMarkerAlphaLocal 1;
		_marker setMarkerPosLocal _position;
		continue;
	};

	// Player of another side
	if (side player isNotEqualTo _side) then {
		_marker setMarkerAlphaLocal 0;
		continue;
	};

	// Player does not have any navigation device
	if (!([player] call Shadec_fnc_hasNavigationItem)) then {
		_marker setMarkerAlphaLocal 0;
		continue;
	};

	// // If this is CV
	// if (!isNil{_respawnVehicle}) then {
	// 	_marker setMarkerPosLocal _position;
	// 	_marker setMarkerAlphaLocal 1;
	// 	continue;
	// };

	// This is static FOB
	_marker setMarkerPosLocal _position;
	_marker setMarkerAlphaLocal 1;
};