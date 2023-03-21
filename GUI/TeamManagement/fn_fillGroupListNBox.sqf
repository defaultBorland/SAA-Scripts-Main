//
params ["_control", "_array", ["_isLeader", false]];

{
	private _row = _control lnbAddRow ["", _x # 1, _x # 0];

	if (_isLeader) then {
		_control lnbSetPicture [[0, 0], "img\TeamManagement\" + "Star" + ".paa"];
	};
	_control lnbSetPicture [[_row, 3], "img\Classes\" + _x # 2 + ".paa"];
	_control lnbSetPicture [[_row, 4], "img\Classes\" + _x # 3 + ".paa"];
	_control lnbSetData [[_row, 3], _x # 2];
	_control lnbSetData [[_row, 4], _x # 3];
	
	private _class1 = localize ([_x # 2, "LS"] call Shadec_fnc_classSwitcher);
	private _class2 = localize ([_x # 3, "LS"] call Shadec_fnc_classSwitcher);

	_control lnbSetTooltip [[_row, 3], 
		_class1 + ([" / " + _class2, ""] select ((_x # 3) isEqualTo "None"))];
} forEach _array;