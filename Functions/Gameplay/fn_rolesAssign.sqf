params ["_unit", "_action"];

private _rank = _unit getVariable ["SAA_Rank", "PV1"];
private _firstClass = _unit getVariable ["SAA_PrimaryClass", "Rifleman"];
private _secondClass = _unit getVariable ["SAA_SecondaryClass", "None"];

switch (_firstClass) do {
	case "Medic": {
		if (_action isEqualTo "Assign") then {
			_unit setVariable ["ace_medical_medicclass", 1, true];
		} else {
			_unit setVariable ["ace_medical_medicclass", 0, true];
		};
	};
	case "Engineer": {
		if (_action isEqualTo "Assign") then {
			_unit setVariable ["ACE_IsEngineer",2, true];
			{player setUnitTrait ["explosiveSpecialist", true]} remoteExec ["call", owner _unit];
			{player setUnitTrait ["UAVHacker", true]} remoteExec ["call", owner _unit];
		} else {
			_unit setVariable ["ACE_IsEngineer", 0, true];
			{player setUnitTrait ["explosiveSpecialist", false]} remoteExec ["call", owner _unit];
			{player setUnitTrait ["UAVHacker", false]} remoteExec ["call", owner _unit];
		};
	};
	case "Marksman": {
		if (_action isEqualTo "Assign") then {
			{player setUnitTrait ["camouflageCoef", 0.7]} remoteExec ["call", owner _unit];
			{player setUnitTrait ["audibleCoef", 0.7]} remoteExec ["call", owner _unit];
		} else {
			{player setUnitTrait ["camouflageCoef", 1]} remoteExec ["call", owner _unit];
			{player setUnitTrait ["audibleCoef", 1]} remoteExec ["call", owner _unit];
		};
	};
	case "Sniper": {
		if (_action isEqualTo "Assign") then {
			{player setUnitTrait ["camouflageCoef", 0.4]} remoteExec ["call", owner _unit];
			{player setUnitTrait ["audibleCoef", 0.4]} remoteExec ["call", owner _unit];
		} else {
			{player setUnitTrait ["camouflageCoef", 1]} remoteExec ["call", owner _unit];
			{player setUnitTrait ["audibleCoef", 1]} remoteExec ["call", owner _unit];
		};
		
	};
	default {};
};

switch (_secondClass) do {
	case "Medic": {
		if (_action isEqualTo "Assign") then {
			_unit setVariable ["ace_medical_medicclass", 1, true];
		} else {
			_unit setVariable ["ace_medical_medicclass", 0, true];
		};
	};
	case "Engineer": {
		if (_action isEqualTo "Assign") then {
			_unit setVariable ["ACE_IsEngineer",1, true];
			{player setUnitTrait ["explosiveSpecialist", true]} remoteExec ["call", owner _unit];
			{player setUnitTrait ["UAVHacker", true]} remoteExec ["call", owner _unit];
		} else {
			_unit setVariable ["ACE_IsEngineer",0, true];
			{player setUnitTrait ["explosiveSpecialist", false]} remoteExec ["call", owner _unit];
			{player setUnitTrait ["UAVHacker", false]} remoteExec ["call", owner _unit];
		};
	};
	case "Marksman": {
		if (_action isEqualTo "Assign") then {
			{player setUnitTrait ["camouflageCoef", 0.7]} remoteExec ["call", owner _unit];
			{player setUnitTrait ["audibleCoef", 0.7]} remoteExec ["call", owner _unit];
		} else {
			{player setUnitTrait ["camouflageCoef", 1]} remoteExec ["call", owner _unit];
			{player setUnitTrait ["audibleCoef", 1]} remoteExec ["call", owner _unit];
		};
	};
	default {};
};