params ["_names", "_storages"];

magazinesCargo = {
	params ["_magazinesCargo"];
	_array = [];
	if (_magazinesCargo isEqualTo []) exitWith {[]};
	{
		for "_i" from 0 to (_x # 1) step 1 do {
			_array pushBack (_x # 0);
		};
	} forEach _magazinesCargo;
	[_array] call Shadec_fnc_itemsListShortener;
	_array
};

formatExcel = {
	params ["_storageCargo"];
	_weapons = [] + (_storageCargo # 0);
	_magazines = [] + (_storageCargo # 1);
	_magazines = _magazines call magazinesCargo;
	_items = [] + (_storageCargo # 2);

	_endArray = [];

	if !(_weapons isEqualTo []) then {
		_endArray pushBack ["0", "---[ Weapons ]---", "0", "next"];
		{
			_name = getText (configFile >> "CfgWeapons" >> (_x # 0) >> "displayName");
			_class = _x # 0;
			_count = str (_x # 1);
			_endArray pushBack [_name, _class, _count, "next"];
		} forEach _weapons;
	};	
	if !(_magazines isEqualTo []) then {
		_endArray pushBack ["0", "---[ Magazines ]---", "0", "next"];
		{
			_name = getText (configFile >> "CfgMagazines" >> (_x # 0) >> "displayName");
			_class = _x # 0;
			_count = str (_x # 1);
			_endArray pushBack [_name, _class, _count, "next"];
		} forEach _magazines;
	};
	if !(_items isEqualTo []) then {
		_endArray pushBack ["0", "---[ Items ]---", "0", "next"];
		{
			_name = getText (configFile >> "CfgWeapons" >> (_x # 0) >> "displayName");
			_class = _x # 0;
			_count = str (_x # 1);
			_endArray pushBack [_name, _class, _count, "next"];
		} forEach _items;
	};
	while {(count _endArray) < 50} do {_endArray pushBack ["0", "0", "0", "next"]};
};

{
	missionNamespace setVariable [format["%1_storage", _x], _storages call formatExcel];
} forEach _names;

_names sort true;
_br = toString [13,10];
_tab = toString [9];
_txt = "";

{_txt = _txt + _x + _tab + _tab + _tab} forEach _names;
_txt = _txt + _br + _br + _br;

for "_i" from 0 to 49 step 1 do {
	for "_j" from 0 to (count _names)-1 step 1 do {
		_temp = missionNamespace getVariable (format["%1_storage", _names # _j]) # "_i";
		{
			if !(_x isEqualTo "next") then {_txt = _txt + _x} else {_txt = _txt + _br + _br + _br};
		} forEach _temp;
	};		
};

copyToClipboard _txt;
//return