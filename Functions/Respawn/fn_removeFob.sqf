params ["_vehicle"];

if (alive _vehicle) then {
	_allFOBs = missionNamespace getVariable ["respawnFOBs", []];
	_allFOBs = _allFOBs - [_vehicle];
	missionNamespace setVariable ["respawnFOBs", _allFOBs, true];
	_vehicle setVariable ["ace_medical_medicClass", 0];
	_vehicle setVariable ["isFOB", false, true];
} else {
	_allFOBs = missionNamespace getVariable ["respawnFOBs", []];
	missionNamespace setVariable ["respawnFOBs", _allFOBs - [objNull], true];
};

//return
true