params ["_action", "_arrays", "_uid"];

if !(count _arrays > 0) exitWith {diag_log format ["Empty array is passed."]};

_weapons = _arrays # 0; //diag_log format ["aTS_weapons: %1", _weapons];
_magazines = _arrays # 1; //diag_log format ["aTS_magazines: %1", _magazines];
_items = _arrays # 2; //diag_log format ["aTS_items: %1", _items];

_storage = missionNamespace getVariable [format["pStorage_%1", _uid], nil];
if (isNil {_storage}) exitWith {diag_log format ["Fnc: addToStorage. Err: Can't find the storage."]};

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