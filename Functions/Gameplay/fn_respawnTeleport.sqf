// Local execution only

fnc_getEmptyVehiclePlace = {
	params["_vehicle"];
	private ["_freeCargoPositions"];

	//if !((_vehicle isKindOf "LandVehicle") or (_vehicle isKindOf "Helicopter") or (_vehicle isKindOf "Ship") or (_vehicle isKindOf "Plane") or (_vehicle isKindOf "Tank")) exitWith {"None"};

	if ((_vehicle emptyPositions "Cargo") > 1) exitWith {"Cargo"};
	if ((_vehicle emptyPositions "Commander") > 0) exitWith {"Commander"};
	if ((_vehicle emptyPositions "Gunner") > 0) exitWith {"Gunner"};
	"None"
};

params["_destination"]; // _destination - position or object

if (isNil "_destination") exitWith {};
player setVariable ["SAA_forcedRespawnPosition", nil];

if (_destination isEqualType []) then { // TP to position
	player setPos _destination;
} else { // TP in vehicle or near object
	private _vehicle = _destination;

	if (!isNil {_vehicle} && {alive _vehicle}) then {
		switch ([_vehicle] call fnc_getEmptyVehiclePlace) do {
			case "Cargo": {player moveInCargo _vehicle};
			case "Commander": {player moveInCommander _vehicle};
			case "Gunner": {player moveInGunner _vehicle};
			default {
				//[["There is no empty place in vehicle", "Plain", 1]] remoteExec ["cutText", owner player];
				_emptyPosition = (getPosATL _vehicle) findEmptyPosition [1, 20];
				player setPosATL _emptyPosition;
			};
		};
	} else {
		diag_log "FNC_respawnTeleport | ERROR: Trying to teleport at vehicle that didn't exists";
	};
};

//return
true