fnc_getMaximumLoad = {
	params ["_classname", "_unitContainerIndex"];

	private _maxLoad = 0;
	if (_unitContainerIndex isEqualTo 2) then {
		_maxLoad = getNumber (configFile >> "CfgVehicles" >> _classname >> "maximumLoad");
	} else {
		private _supplyMass = getText (configFile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "containerClass");
		_maxLoad = getNumber (configFile >> "CfgVehicles" >> _supplyMass >> "maximumLoad");
	};

	_maxLoad
};

params ["_control", "_unitContainerIndex"];

private _size = lbSize _control;
if (_size < 1) exitWith {false};

private _currentInventoryMass = (player getVariable ["SAA_arsenal_gearList", []]) # 7 # _unitContainerIndex;

for "_index" from 1 to _size do {
	private _classname = _control lbData _index;
	private _outfitMaxLouad = [_classname, _unitContainerIndex] call fnc_getMaximumLoad;
	
	if (_outfitMaxLouad >= _currentInventoryMass) then {continue};

	private _text = _control lbText _index;
	private _msg = localize "STR_SAA_ARSENAL_INSUFFICIENT_CAPACITY";
	_control lbSetTooltip [_index, format["%1\n\n%2", _text, _msg]];
	_control lbSetColor [_index, [1, 0.5, 0, 0.8]];
};

true