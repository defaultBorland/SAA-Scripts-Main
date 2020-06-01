//
params["_array", "_ctrl"];
private ["_weaponsRemoved", "_magazinesRemoved", "_itemsRemoved", "_equipmentRemoved", "_strings"];

_weaponsRemoved = _array select {((_x call BIS_fnc_itemType) # 0) isEqualTo "Weapon"};
_magazinesRemoved = _array select {((_x call BIS_fnc_itemType) # 0) isEqualTo "Magazine"};
_itemsRemoved = _array select {((_x call BIS_fnc_itemType) # 0) isEqualTo "Item"};
_equipmentRemoved = _array select {((_x call BIS_fnc_itemType) # 0) isEqualTo "Equipment"};

_weaponsRemoved = _weaponsRemoved apply {[getText (configFile >> "CfgWeapons" >> _x # 0 >> "displayName"), _x # 1, _x # 0, getText(configfile >> "CfgWeapons" >> _x # 0 >> "picture")]};
_magazinesRemoved = _magazinesRemoved apply {[getText (configFile >> "CfgMagazines" >> _x # 0 >> "displayName"), _x # 1, _x # 0, getText(configfile >> "CfgMagazines" >> _x # 0 >> "picture")]};
_itemsRemoved = _itemsRemoved apply {[getText (configFile >> "CfgWeapons" >> _x # 0 >> "displayName"), _x # 1, _x # 0, getText(configfile >> "CfgWeapons" >> _x # 0 >> "picture")]};
_equipmentRemoved = _equipmentRemoved apply {[getText (configFile >> "CfgWeapons" >> _x # 0 >> "displayName"), _x # 1, _x # 0, getText(configfile >> "CfgWeapons" >> _x # 0 >> "picture")]};

// Change _rowNumber to lbSize // Some troubles on this way
_rowNumber = 0;

if !(_weaponsRemoved isEqualTo []) then {
	_rowNumber = _rowNumber + 1;
	_ctrl lbAdd format ["      > %1 <      ", localize "str_GENERAL_WEAPONS"];
	{
		_ctrl lbAdd format ["%1 | x%2", _x # 0, str (_x # 1)];
		_ctrl lbSetTooltip [_rowNumber, _x # 2];
		_ctrl lbSetPicture [_rowNumber, _x # 3];
		_ctrl lbSetData [_rowNumber, _x # 2];
		_ctrl lbSetValue [_rowNumber, _x # 1];
		_rowNumber = _rowNumber + 1;
	} forEach _weaponsRemoved;
};

if !(_magazinesRemoved isEqualTo []) then {
	_rowNumber = _rowNumber + 1;
	_ctrl lbAdd format ["      > %1 <      ", localize "str_GENERAL_MAGAZINES"];
	{
		_ctrl lbAdd format ["%1 | x%2", _x # 0, str (_x # 1)];
		_ctrl lbSetTooltip [_rowNumber, _x # 2];
		_ctrl lbSetPicture [_rowNumber, _x # 3];
		_ctrl lbSetData [_rowNumber, _x # 2];
		_ctrl lbSetValue [_rowNumber, _x # 1];
		_rowNumber = _rowNumber + 1;
	} forEach _magazinesRemoved;
};

if !(_itemsRemoved isEqualTo []) then {
	_rowNumber = _rowNumber + 1;
	_ctrl lbAdd format ["      > %1 <      ", localize "str_GENERAL_ITEMS"];
	{
		_ctrl lbAdd format ["%1 | x%2", _x # 0, str (_x # 1)];
		_ctrl lbSetTooltip [_rowNumber, _x # 2];
		_ctrl lbSetPicture [_rowNumber, _x # 3];
		_ctrl lbSetData [_rowNumber, _x # 2];
		_ctrl lbSetValue [_rowNumber, _x # 1];
		_rowNumber = _rowNumber + 1;
	} forEach _itemsRemoved;
};

if !(_equipmentRemoved isEqualTo []) then {
	_rowNumber = _rowNumber + 1;
	_ctrl lbAdd format ["      > %1 <      ", localize "str_GENERAL_EQUIPMENT"];
	{
		_ctrl lbAdd format ["%1 | x%2", _x # 0, str (_x # 1)];
		_ctrl lbSetTooltip [_rowNumber, _x # 2];
		_ctrl lbSetPicture [_rowNumber, _x # 3];
		_ctrl lbSetData [_rowNumber, _x # 2];
		_ctrl lbSetValue [_rowNumber, _x # 1];
		_rowNumber = _rowNumber + 1;
	} forEach _equipmentRemoved;
};

//return
true