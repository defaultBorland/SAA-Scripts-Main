params ["_vehicle", "_clear", "_marker", "_addPAK", "_additionalInfo"];

if !((typeName _vehicle) isEqualTo "OBJECT") exitWith {};
if (_marker isEqualTo "") exitWith {};

missionNamespace setVariable ["lastFOB", _vehicle, true];

_allFOBs = missionNamespace getVariable ["respawnFOBs", [objNull]];
_allFOBs pushBack _vehicle;
missionNamespace setVariable ["respawnFOBs", _allFOBs];

if (_clear isEqualTo 1) then {
	clearItemCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
};

//_vehicle setVariable ["ace_medical_medicClass", 1, true];
_vehicle setVariable ["ace_medical_isMedicalVehicle", true, true];

if (_addPAK isEqualTo 1) then {
	_vehicle addItemCargoGlobal ["ACE_personalAidKit", 3];
};

if (_additionalInfo isEqualTo 1) then {
	{hint parseText format ["<t align='center'>Respawn-medical CV was assigned</t><t align='center'><img size='4' image='%1'/></t><br/><br/><t align='center' shadow='1' shadowColor='#000000'>%2</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Direction: %3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Distance: %4</t>", getText(configfile >> "CfgVehicles" >> typeOf (missionNamespace getVariable "lastFOB") >> "picture"), getText (configFile >> "CfgVehicles" >> typeOf (missionNamespace getVariable "lastFOB") >> "displayName"), floor ([player, (missionNamespace getVariable "lastFOB")] call BIS_fnc_dirTo), round (player distance (missionNamespace getVariable "lastFOB"))]} remoteExec ["call"];
};

["> Server: New FOB assigned"] remoteExec ["systemChat"];
_vehicle setVariable ["isFOB", true, true];

[_vehicle, _marker] spawn {
	params ["_respawnFOB", "_marker"];
	while {(alive _respawnFOB) and (_respawnFOB getVariable "isFOB")} do {
		_marker setMarkerPos getPos _respawnFOB;
		sleep 1;
	};

	if !(alive _respawnFOB) then {
		[format["> Server: Respawn CV '%1' were destroyed!", markerText _marker]] remoteExec ["systemChat", -2];
	};

	[_marker] call Shadec_fnc_removeRespawnPoint;
	// deleteMarker _marker;
};