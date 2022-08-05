params ["_action", "_arrays", "_uid"];

if !(count _arrays > 0) exitWith {diag_log format ["fn_AddToStorage | Empty array is passed."]};

_storage = missionNamespace getVariable [format["pStorage_%1", _uid], nil];
if (isNil {_storage}) exitWith {diag_log format ["fn_AddToStorage |  Can't find the storage."]};

_arrays = [_arrays, _uid] call Shadec_fnc_removeStorageRestrictedItems;
_arrays params ["_weapons", "_magazines", "_items"];

if !(typeName _action == "STRING") exitWith {diag_log format  ["Invalid action type."]};
switch (_action) do {
	case "arsenalHandle"; 
	case "loadStorage": {
		{_storage addWeaponCargoGlobal _x} forEach _weapons;
		{_storage addMagazineAmmoCargo _x} forEach _magazines;
		{_storage addItemCargoGlobal _x} forEach _items;
	};
	case "loadPurchaseOrder": {
		{_storage addWeaponCargoGlobal _x} forEach _weapons;
		{_storage addMagazineCargoGlobal _x} forEach _magazines;
		{_storage addItemCargoGlobal _x} forEach _items;

		private _allDelivered = _weapons + _magazines + _items;
		_allDelivered append (missionNamespace getVariable [format["deliveredItems_%1", _uid], []]);
		missionNamespace setVariable [format["deliveredItems_%1", _uid], _allDelivered];

		private _id = owner ((allPlayers select {(getPlayerUID _x) isEqualTo _uid}) # 0);
		
		deliveredItems = _allDelivered;
		_id publicVariableClient "deliveredItems";
		deliveredItems = nil;
		diag_log format ["DELIVERED ITEMS %1: %2", _uid, _allDelivered];

		["erasePurchaseOrder", [_uid]] spawn Shadec_fnc_call_db;
	};
	default {diag_log format  ["Invalid action. Player: %1", _uid]};
};

// 

//return
true