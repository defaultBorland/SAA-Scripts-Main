params ["_vehicle"];

if (alive _vehicle) then {
	private _allCVs = missionNamespace getVariable ["SAA_CVs", []];
	_allCVs = _allCVs - [_vehicle];
	missionNamespace setVariable ["SAA_respawnPoints", _allCVs, true];
	_vehicle setVariable ["ace_medical_medicClass", 0];
	_vehicle setVariable ["SAA_isCV", nil, true];
	_vehicle setVariable ["SAA_respawnPointName", nil, true];
} else {
	_allCVs = missionNamespace getVariable ["SAA_CVs", []];
	missionNamespace setVariable ["SAA_CVs", _allCVs - [objNull], true];
};

//return
true