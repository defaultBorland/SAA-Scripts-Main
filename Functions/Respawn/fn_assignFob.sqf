params ["_vehicle", "_clear", "_marker", "_addPAK", "_showNotification"];

if !((typeName _vehicle) isEqualTo "OBJECT") exitWith {};
if (_marker isEqualTo "") exitWith {};


if (_clear isEqualTo 1) then {
	clearItemCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
};

_vehicle setVariable ["ace_medical_isMedicalVehicle", true, true];

if (_addPAK isEqualTo 1) then {
	_vehicle addItemCargoGlobal ["ACE_personalAidKit", 3];
};

if (_showNotification) then {
	[[_vehicle, _marker], {
		params ["_vehicle", "_marker"];
		hint parseText format ["<t align='center'>%1</t><t align='center'><img size='4' image='%2'/></t><br/><br/><t align='center' shadow='1' shadowColor='#000000'>%3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%4: %5</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%6: %7</t>", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_MESSAGE_RESPAWNCVCREATED", getText(configfile >> "CfgVehicles" >> typeOf _vehicle >> "picture"), getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName"), localize "STR_SAA_GENERAL_DIRECTION", floor (player getDir _vehicle), localize "STR_SAA_GENERAL_DISTANCE", round (player distance _vehicle)];

		systemChat format ["> Server: %1: '%2'.", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_MESSAGE_RESPAWNCVCREATED", markerText _marker];
	}] remoteExec ["call", -2];
};

_vehicle setVariable ["isFOB", true, true];

[_vehicle, _marker] spawn {
	params ["_respawnFOB", "_marker"];
	while {(alive _respawnFOB) and (_respawnFOB getVariable "isFOB")} do {
		_marker setMarkerPos getPos _respawnFOB; // Make client side
		sleep 1;
	};

	if !(alive _respawnFOB) then { //if isNil -> deleted else -> destroyed
		[[markerText _marker], {
			systemChat format ["> Server: %1 '%2' %3!", localize "STR_SAA_GENERAL_RESPAWN_CV", _this # 0, localize "STR_SAA_MESSAGE_HAS_BEEN_DESTROYED"];
		}] remoteExec ["call", -2];
	};

	[_marker] call Shadec_fnc_removeRespawnPoint;
	// deleteMarker _marker;
};