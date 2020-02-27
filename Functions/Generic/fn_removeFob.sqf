params [""];

_respawnFOB = missionNamespace getVariable "respawnFOB";
if !(isNil {_respawnFOB}) then {
	missionNamespace setVariable ["respawnFOB", nil, true]; 
	_respawnFOB setVariable ["ace_medical_medicClass", 0];
	_respawnFOB = nil;
};

//return
true