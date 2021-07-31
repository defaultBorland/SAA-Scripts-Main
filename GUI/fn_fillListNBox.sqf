params ["_listNBox", "_items"];

{
	_x params ["_class", "_count"];

	private _type = ([_class] call BIS_fnc_itemType) # 0;
	private _cfg = "";
	switch (_type) do {
		case "Item";
		case "Equipment";
		case "Weapon": {_cfg = "CfgWeapons"};
		case "Mine";
		case "Magazine": {_cfg = "CfgMagazines"};
	};

	_type = localize ("SAA_GENERAL_" + _type);

	_listNBox lnbAddRow ["", "", ""];
	_listNBox lnbSetPicture [[_forEachIndex, 0], getText(configfile >> _cfg >> _class >> "picture")];
	_listNBox lnbSetText [[_forEachIndex, 1], getText (configFile >> _cfg >> _class >> "displayName")];

	_listNBox lnbSetText [[_forEachIndex, 2], str _count];
	_listNBox lnbSetValue [[_forEachIndex, 2], _count];

	_listNBox lnbSetText [[_forEachIndex, 3], _type];
	_listNBox lnbSetText [[_forEachIndex, 4], _class];
} forEach _items;