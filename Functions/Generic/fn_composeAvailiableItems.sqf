params ["_uid"];

(missionNamespace getVariable [format["%1_DATA", _this # 0], ["PVT", "Rifleman", "None"]]) params ["_rank", "_firstClass", "_secondClass"];
if (missionNamespace getVariable [format["availiableItems_%1_%2", _firstClass, _secondClass], []] isEqualTo []) then {
	_arrayP = ["Primary"] call call compile format ["Shadec_fnc_%1", _firstClass];
	_arrayS = ["Secondary"] call call compile format ["Shadec_fnc_%1", _secondClass];
	
	_array = [];
	_array append _arrayP;
	_array append _arrayS;
	_array = _array arrayIntersect _array;
	missionNamespace setVariable [format["availiableItems_%1_%2", _firstClass, _secondClass], _array];
};

//return
true