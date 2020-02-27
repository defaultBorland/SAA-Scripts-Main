params ["_vehicle", "_clear", "_marker", "_addPAK", "_additionalInfo"];

if !((typeName _vehicle) isEqualTo "OBJECT") exitWith {};
if (_marker isEqualTo "") exitWith {};

[] call Shadec_fnc_removeFob;

_respawnFOB = _vehicle;
missionNamespace setVariable ["respawnFOB", _respawnFOB, true];

if (_clear isEqualTo 1) then {
	clearItemCargoGlobal _respawnFOB;
	clearWeaponCargoGlobal _respawnFOB;
	clearMagazineCargoGlobal _respawnFOB;
	clearBackpackCargoGlobal _respawnFOB;
};

_respawnFOB setVariable ["ace_medical_medicClass", 1];

if (_addPAK isEqualTo 1) then {
	_respawnFOB addItemCargoGlobal ["ACE_personalAidKit", 3];
};

if (_additionalInfo isEqualTo 1) then {
	{hint parseText format ["<t align='center'>Respawn-medical transport was assigned</t><t align='center'><img size='4' image='%1'/></t><br/><br/><t align='center' shadow='1' shadowColor='#000000'>%2</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Direction: %3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Distance: %4</t>", getText(configfile >> "CfgVehicles" >> typeOf (missionNamespace getVariable "respawnFOB") >> "picture"), getText (configFile >> "CfgVehicles" >> typeOf (missionNamespace getVariable "respawnFOB") >> "displayName"), floor ([player, (missionNamespace getVariable "respawnFOB")] call BIS_fnc_dirTo), round (player distance (missionNamespace getVariable "respawnFOB"))]} remoteExec ["call"];
};

["FOB assigned."] remoteExec ["systemChat"];

[_respawnFOB, _marker] spawn {
	params["_respawnFOB", "_marker"];	
	while {(alive _respawnFOB)} do {
		if (isNil {missionNamespace getVariable "respawnFOB"}) exitWith {};
		_marker setmarkerpos getpos _respawnFOB; 
		sleep 1;
		if !(_respawnFOB isEqualTo (missionNamespace getVariable "respawnFOB")) exitWith {};
	};
	if !(alive _respawnFOB) then {
		["FOB was destroyed!"] remoteExec ["systemChat"]; 
		["All", "Disable", "All"] call Shadec_fnc_changeRespawnState;
	} else {["FOB was abandonded."] remoteExec ["systemChat"]};
};

