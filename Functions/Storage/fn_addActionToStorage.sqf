// LOCAL USE ONLY
params ["_storageProxy"];
_pStorage = missionNamespace getVariable (format["pStorage_%1", getPlayerUID player]);
_storageProxy addAction [
	localize "STR_SAA_STORAGE_ACTION",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_arguments params ["_pStorage"];
		_pStorage setPosASLW (getPosASLW _target);
		_pStorage lock true;
		_caller action ["Gear", _pStorage];
	}, [_pStorage], 6, true, false, "", "true", 3, false ,"", ""
];

_action = [
	"openStorage", localize "STR_SAA_STORAGE_ACTION", "", {
		params ["_target", "_player", "_params"];
		_params params ["_pStorage"];

		_pStorage setPosASLW (getPosASLW _target);
		_pStorage lock true;
		_player action ["Gear", _pStorage];
	}, {true}, {}, [_pStorage]
] call ace_interact_menu_fnc_createAction;

[_storageProxy, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;