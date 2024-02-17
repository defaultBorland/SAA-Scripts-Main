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


params ["_passedClassname", "_availiableItems"];

private _return = false;
private _classname = toLower _passedClassname;

//
if (_classname in _availiableItems) exitWith {true};

//
private _rarities = ["CUP_arifle_AKS_Gold", "CUP_hgun_TaurusTracker455_gold", "UK3CB_Cocaine_Brick"];
if (_classname in _rarities) exitWith {true};

private _itemType = ([_classname] call BIS_fnc_itemType) # 0;

switch (_itemType) do {
	case "Item": {
		if (getText (configFile >> "CfgWeapons" >> _classname >> "rhs_acc_combo") isNotEqualTo "") exitWith { // RHS
			_classname = getText (configFile >> "CfgWeapons" >> _classname >> "rhs_acc_combo");
			if (_classname in _availiableItems) exitWith {_classname};
			
			_classname = [_classname, _availiableItems] call fnc_searchParents;
		};

		if (getText(configFile >> "CfgWeapons" >> _classname >> "mrt_SwitchItemNextClass") isNotEqualTo "") then { // Others (SMA can be problem)
			private _variations = (_classname call CBA_fnc_switchableAttachments) apply {toLower _x};
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