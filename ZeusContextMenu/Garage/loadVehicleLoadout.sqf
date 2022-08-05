private _loadoutsData = missionNamespace getVariable ["SAA_vehiclesLoadouts", []];
if (count _loadoutsData < 1) exitWith {
	diag_log format ["%1 | %2", "file_loadVehicleLoadout", "Info: No garage vehicles"]
};

private _loadoutsDataNames = _loadoutsData apply {_x # 0};
_loadoutsDataNames = _loadoutsDataNames arrayIntersect _loadoutsDataNames;
_allLoadouts = [];
{
	private _classname = _x;
	private _loadoutsForX = _loadoutsData select {(_x # 0) isEqualTo _classname};
	_loadoutsForX = _loadoutsForX apply {[_x # 2, _x # 3]};
	_allLoadouts pushBack ([_classname, _loadoutsForX]);

} forEach _loadoutsDataNames;

private _root = [
	"loadVehicleLoadout",
	localize "STR_SAA_ZEUS_CONTEXT_ACTIONS_LOAD_LOADOUT_ACTIONNAME",
	"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_loadDevice_ca.paa",
	{}, // Statement
	{
		// Condition
		params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
		_args params ["_allLoadouts"];

		(player getVariable ["SAA_Context_Toggled", false]) &&
		{_hoveredEntity isEqualType objNull} && 
		{_hoveredEntity isNotEqualTo objNull} && 
		{(typeOf _hoveredEntity) in (_allLoadouts apply {_x # 0})}
	},
	[ // Args
		_allLoadouts
	],
	{ // Children
		_this call fnc_generateLoadLoadoutsActions
	}
] call zen_context_menu_fnc_createAction;
private _rootActionPath = [_root, [], 0] call zen_context_menu_fnc_addAction;

fnc_generateLoadLoadoutsActions = {
	params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
	_args params ["_allLoadouts"];

	private _loadouts = _allLoadouts select {(_x # 0) isEqualTo (typeOf _hoveredEntity)};
	if (_loadouts isEqualTo []) exitWith {[]};

	_loadouts = _loadouts # 0 # 1;
	private _childActions = [];

	{
		_x params ["_loadoutName", "_loadout"];

		private _priority = (count _loadouts) - _forEachIndex;
		private _loadActionName = format ["%1_%2_%3", "loadVehicleLoadout", _loadoutName, _priority];
		private _loadLoadout = [
			_loadActionName,
			_loadoutName,
			"",
			{
				params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
				_args params ["_loadout"];

				[_hoveredEntity, _loadout] call Shadec_fnc_applyLoadout;
			},
			{
				true
			}, // Condition
			[ // Args
				_loadout
			]
		] call zen_context_menu_fnc_createAction;
		_childActions pushBack [_loadLoadout, [], _priority];
	} forEach _loadouts;

	_childActions
};