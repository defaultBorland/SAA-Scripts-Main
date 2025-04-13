//

fnc_searchParents = {
	params ["_classname", "_availiableItems"];

	private _parents = [ configFile >> "CfgWeapons" >> _classname, true] call BIS_fnc_returnParents;
	{
		private _parent = toLower _x;
		if ((_parent in _classname) && {_parent in _availiableItems}) exitWith {_classname = _parent};
	} forEach _parents;

	_classname
};


// CBA_fnc_switchableAttachments (for some reason CBA_fnc doesn't work server-side)
fnc_getVariants = {
	params ["_item"];

	private _cfgWeapons = configfile >> "CfgWeapons";
	private _config = _cfgWeapons >> _item;

	private _forward = [];
	while {
		_config = _cfgWeapons >> getText (_config >> "MRT_SwitchItemNextClass");
		isClass _config && {_forward pushBackUnique configName _config != -1}
	} do {};

	_config = _cfgWeapons >> _item;
	private _backward = [];
	while {
		_config = _cfgWeapons >> getText (_config >> "MRT_SwitchItemPrevClass");
		isClass _config && {_backward pushBackUnique configName _config != -1}
	} do {};

	_forward = _forward + _backward;
	_forward = _forward arrayIntersect _forward;

	_forward
};


params ["_passedClassname", "_availiableItems"];

private _return = false;
private _classname = toLower _passedClassname;

//
if (_classname in _availiableItems) exitWith {true};

//
private _itemType = ([_classname] call BIS_fnc_itemType) # 0;

switch (_itemType) do {
	case "Item": {
		if (getText (configFile >> "CfgWeapons" >> _classname >> "rhs_acc_combo") isNotEqualTo "") exitWith { // RHS
			_classname = getText (configFile >> "CfgWeapons" >> _classname >> "rhs_acc_combo");
			if (_classname in _availiableItems) exitWith {_classname};
			
			_classname = [_classname, _availiableItems] call fnc_searchParents;
		};

		if (getText(configFile >> "CfgWeapons" >> _classname >> "mrt_SwitchItemNextClass") isNotEqualTo "") then { // Others (SMA can be problem)
			private _variations = (_classname call fnc_getVariants) apply {toLower _x};
			{
				if (_x in _availiableItems) exitWith {_classname = _x};
			} forEach _variations;

		} else {
			_classname = [_classname, _availiableItems] call fnc_searchParents;
		};
	};

	case "Weapon": {
		private _baseWeapon = [_classname] call BIS_fnc_baseWeapon;
		if (_baseWeapon in _availiableItems) exitWith {_classname = _baseWeapon};

		// Folded RHS Weapon
		private _rhsFold = getText (configFile >> "CfgWeapons" >> _classname >> "rhs_fold");
		if (_rhsFold isNotEqualTo "" && {_rhsFold in _availiableItems}) exitWith {_classname = _rhsFold};

		_classname = [_classname, _availiableItems] call fnc_searchParents;
	};

	case "Equipment": {
		if (((_classname call BIS_fnc_itemType) # 1) isEqualTo "Headgear") exitWith {_return = true};
		if (((_classname call BIS_fnc_itemType) # 1) isEqualTo "Glasses") exitWith {_return = true};
	};

	default {
		_classname = _passedClassname;
	};
};

if (_classname in _availiableItems) exitWith {true};

_return