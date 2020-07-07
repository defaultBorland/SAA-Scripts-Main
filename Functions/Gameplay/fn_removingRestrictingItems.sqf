//

fnc_keepInStorage = {
	params ["_class", "_availiableEquipment"];
	_return = true;
	if !(_class in _availiableEquipment) then {
		switch (([_class] call BIS_fnc_itemType) # 0) do {
			case "Weapon": {
				_additionalWeapons = ["CUP_arifle_AKS_Gold", "CUP_hgun_TaurusTracker455_gold", "rhs_weap_pp2000"];
				if (_class in _additionalWeapons) exitWith {_return = true};
				
				_class = [_class] call BIS_fnc_baseWeapon;
				if !(_class in _availiableEquipment) then {_return = false}
				
			};
			case "Magazine": {
				_return = false;
			};
			case "Item": {
				_additionalOptics = ["CUP_optic_ACOG_TA01B_Black_PIP","CUP_optic_ACOG_TA01B_Coyote_PIP","CUP_optic_ACOG_TA01B_OD_PIP","CUP_optic_ACOG_TA01B_RMR_Black_PIP","CUP_optic_ACOG_TA01B_RMR_Coyote_PIP","CUP_optic_ACOG_TA01B_RMR_OD_PIP","CUP_optic_ACOG_TA01B_RMR_Tan_PIP","CUP_optic_ACOG_TA01B_RMR_Tropic_PIP","CUP_optic_ACOG_TA01B_Tan_PIP","CUP_optic_ACOG_TA01B_Tropic_PIP", "rhsusf_acc_su230_mrds_c_3d", "rhsusf_acc_su230_mrds_3d",  "rhsusf_acc_su230_3d", "rhsusf_acc_su230_c_3d", "SMA_ELCAN_SPECTER_RDS_4z"];
				
				if (((_class call BIS_fnc_itemType) # 1) isEqualTo "Headgear") exitWith {_return = true};
				if (_class in _additionalOptics) exitWith {_return = true};

				_parents = [ configFile >> "CfgWeapons" >> _class, true ] call BIS_fnc_returnParents;
				{
					if ((_class find _x) > -1) then {
						if !(_class isEqualTo _x) then {_class = _x};
					};
				} forEach _parents;
				if !(_class in _availiableEquipment) then {_return = false};
				
			};
			default {};
		};
	};
	//return
	_return
};

//

params ["_arrays", "_uid"];
_arrays params ["_weapons", "_magazines", "_items"]; 
(missionNamespace getVariable [format["%1_DATA", _uid], ["PVT", "Rifleman", "None"]]) params ["_rank", "_firstClass", "_secondClass"];

_availiableEquipment = missionNamespace getVariable [format["availiableItems_%1_%2", _firstClass, _secondClass], [_uid] call Shadec_fnc_composeAvailiableItems];

private _weaponsAllowed = _weapons select {[_x # 0, _availiableEquipment] call fnc_keepInStorage};
private _magazinesAllowed = _magazines select {[_x # 0, _availiableEquipment] call fnc_keepInStorage};
private _itemsAllowed = _items select {[_x # 0, _availiableEquipment] call fnc_keepInStorage};

private _weaponsRemoved = (_weapons - _weaponsAllowed);
private _magazinesRemoved = (_magazines - _magazinesAllowed);
private _itemsRemoved = (_items - _itemsAllowed);

private _allRemoved = _weaponsRemoved + _magazinesRemoved + _itemsRemoved;

_allRemoved append (missionNamespace getVariable [format["removedItems_%1", _uid], []]);
missionNamespace setVariable [format["removedItems_%1", _uid], _allRemoved, true]; // TRIGGER FUNC ON CLIENT SIDE?
diag_log format ["REMOVED ITEMS %1: %2", _uid, _allRemoved];

// return
[_weaponsAllowed, _magazinesAllowed, _itemsAllowed];