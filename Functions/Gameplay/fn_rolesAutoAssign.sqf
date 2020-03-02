params ["_unit", "_uid"];
private _unit = _this # 0;
private _uid = _this # 1;

_fc = (missionNamespace getVariable (format["%1_DATA", _uid])) # 1;
_sc = (missionNamespace getVariable (format["%1_DATA", _uid])) # 2;

if (isNil {_fc}) exitWith {diag_log format ["First class is Nil!"]};
if (isNil {_sc}) exitWith {diag_log format ["Second class is Nil!"]};

switch (_fc) do {
	case "Medic";
	case "Nurse": {_unit setVariable ["ace_medical_medicclass", 1, true]};
	case "Engineer": {
		_unit setVariable ["ACE_IsEngineer",2, true];
		{player setUnitTrait ["explosiveSpecialist", true]} remoteExec ["call", owner _unit];
	};
	case "Sniper": {
		{player setUnitTrait ["camouflageCoef", 0.5]} remoteExec ["call", owner _unit];
		{player setUnitTrait ["audibleCoef", 0.5]} remoteExec ["call", owner _unit];
	};
	default {};
};

switch (_sc) do {
	case "Medic": {_unit setVariable ["ace_medical_medicclass", 1, true]};
	case "Engineer": {
		_unit setVariable ["ACE_IsEngineer",1, true];
		{player setUnitTrait ["explosiveSpecialist", true]} remoteExec ["call", owner _unit];
	};
	default {};
};