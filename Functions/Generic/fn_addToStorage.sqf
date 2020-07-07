params ["_action", "_arrays", "_uid"];

if !(count _arrays > 0) exitWith {diag_log format ["fn_AddToStorage | Empty array is passed."]};

_storage = missionNamespace getVariable [format["pStorage_%1", _uid], nil];
if (isNil {_storage}) exitWith {diag_log format ["fn_AddToStorage |  Can't find the storage."]};

_arrays = [_arrays, _uid] call Shadec_fnc_removingRestrictingItems;
_arrays params ["_weapons", "_magazines", "_items"];

if !(typeName _action == "STRING") exitWith {diag_log format  ["Invalid action type."]};
switch (_action) do {
	case "arsenalHandle"; 
	case "loadStorage": {
		{_storage addWeaponCargoGlobal _x} forEach _weapons;
		{_storage addMagazineAmmoCargo _x} forEach _magazines;
		{_storage addItemCargoGlobal _x} forEach _items;
	};
	case "loadBuylist": {
		{_storage addWeaponCargoGlobal _x} forEach _weapons;
		{_storage addMagazineCargoGlobal _x} forEach _magazines;
		{_storage addItemCargoGlobal _x} forEach _items;

		["eraseBuylist", [_uid]] spawn Shadec_fnc_call_db;
	};
	case "someGear": {
		//
	};
	default {diag_log format  ["Invalid action. Player: %1", _uid]};
};

// 

//return
true