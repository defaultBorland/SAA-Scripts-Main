// LOCAL USE ONLY
params ["_storageProxy"];
_pStorage = missionNamespace getVariable (format["pStorage_%1", getPlayerUID player]);
_storageProxy addAction [
	localize "STR_SAA_STORAGE_ACTION",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_arguments params ["_pStorage"];
		_pStorage setPos (_target modelToWorld [0,0,-1]);
		_caller action ["Gear", _pStorage];
		
		[[_pStorage], {
			(_this # 0) lockInventory true;
		}] remoteExec ["call", -2, format["SAA_isStorageLocked_%1", _pStorage getVariable "SAA_storageOwner"]];

	}, [_pStorage], 6, true, false, "", "true", 3, false ,"", ""
];

_action = [
	"openStorage", localize "STR_SAA_STORAGE_ACTION", "", {
		params ["_target", "_player", "_params"];
		_params params ["_pStorage"];

		_pStorage setPos (_target modelToWorld [0,0,-1]); // _pStorage setPos (_target modelToWorld [0,0,0]);
		_player action ["Gear", _pStorage];

		[[_pStorage], {
			(_this # 0) lockInventory true;
		}] remoteExec ["call", -2, format["SAA_isStorageLocked_%1", _pStorage getVariable "SAA_storageOwner"]];

	}, {true}, {}, [_pStorage]
] call ace_interact_menu_fnc_createAction;

[_storageProxy, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;