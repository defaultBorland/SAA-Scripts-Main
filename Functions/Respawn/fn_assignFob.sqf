params ["_vehicle", "_marker", "_clear", "_addPAK", "_showNotification"];

if !((typeName _vehicle) isEqualTo "OBJECT") exitWith {};
if (_marker isEqualTo "") exitWith {};

private _allCVs = missionNamespace getVariable ["SAA_CVs", []];
_allCVs pushBack _vehicle;
missionNamespace setVariable ["SAA_CVs", _allCVs];

if (_clear isEqualTo 1) then {
	clearItemCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
};

_vehicle setVariable ["ace_medical_isMedicalVehicle", true, true];
_vehicle setVariable ["SAA_isCV", true, true];
_vehicle setVariable ["SAA_respawnPointName", markerText _marker, true];

if (_addPAK isEqualTo 1) then {
	_vehicle addItemCargoGlobal ["ACE_personalAidKit", 3];
};

if (_showNotification) then {
	[[_vehicle, _marker], {
		params ["_vehicle", "_marker"];
		hint parseText format ["
			<t align='center'>%1</t>
			<t align='center'><img size='4' image='%2'/></t>
			<br/><br/>
			<t align='center' shadow='1' shadowColor='#000000'>%3</t>
			<br/>
			<t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%4: %5</t>
			<br/>
			<t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%6: %7</t>
			", 
			localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_MESSAGE_RESPAWNCVCREATED", 
			getText(configfile >> "CfgVehicles" >> typeOf _vehicle >> "picture"), 
			getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName"), 
			localize "STR_SAA_GENERAL_DIRECTION", 
			floor (player getDir _vehicle), 
			localize "STR_SAA_GENERAL_DISTANCE", 
			round (player distance _vehicle)
		];

		systemChat format ["> Server: %1: '%2'.", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_MESSAGE_RESPAWNCVCREATED", markerText _marker];
	}] remoteExec ["call", -2];
};

// Monitor CV status (marker-tracking is local side now)
[_vehicle, _marker] spawn {
	params ["_respawnVehicle", "_marker"];
	while {(alive _respawnVehicle) and (_respawnVehicle getVariable ["SAA_isCV", false])} do {
		sleep 1;
	};

	[_marker, false] call Shadec_fnc_removeRespawnPoint;
};