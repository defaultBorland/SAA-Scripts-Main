private _garageVehicles = missionNamespace getVariable ["SAA_garageVehicles", []];
if (count _garageVehicles < 1) exitWith {
	diag_log format ["%1 | %2", "file_spawnCompanyVehicles", "Info: No garage vehicles"]
};

private _root = [
	"spawnGarageVehicleRoot",
	localize "STR_SAA_ZEUS_CONTEXT_ACTIONS_SPAWN_VEHICLES_ACTIONNAME",
	"\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\spaceGarage_ca.paa",
	{}, // Statement
	{
		// Condition
		params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
		(_hoveredEntity isEqualTo objNull) && (player getVariable ["SAA_Context_Toggled", false])
	},
	[ // Args
		_garageVehicles
	],
	{
		_this call fnc_generateVehiclesActions
	}
] call zen_context_menu_fnc_createAction;

private _rootActionPath = [_root, [], 0] call zen_context_menu_fnc_addAction;
// player setVariable ["SAA_ZEN_ContextActions_Garage", (player getVariable ["SAA_ZEN_ContextActions_Garage", []]) append _rootActionPath];

fnc_generateVehiclesActions = {
	params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
	_args params ["_garageVehicles"];

	private _childActions = [];

	{ // forEach
		_x params ["_vehicleClass", "_vehicleName", "_vehicleType", "_loadouts"];

		private _priority = (count _garageVehicles) - _forEachIndex;
		private _spawnActionName = format ["%1_%2_%3", "spawnGarageVehicle", _vehicleClass, _priority];
		private _icon = if (_vehicleType isEqualTo "КШМ") then {
			"\a3\ui_f\data\IGUI\RscTitles\MPProgress\respawn_ca.paa"
		} else {
			//getText (configfile >> "CfgVehicles" >> _vehicleClass >> "picture")
			""
		};
		private _spawnGarageVehicle = [
			_spawnActionName,
			_vehicleName,
			_icon,
			{
				// Statement
				params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
				_args params ["_vehicleClass", "_vehicleName", "_loadouts"];

				[_position, _vehicleClass] call Shadec_fnc_spawnVehicle;
			},
			{
				true
			}, // Condition
			[ // Args
				_vehicleClass, _vehicleName, _loadouts
			], {
				_this call fnc_generateLoadoutsActions
			}
		] call zen_context_menu_fnc_createAction;
		_childActions pushBack [_spawnGarageVehicle, [], _priority];
	} forEach _garageVehicles;

	// return
	_childActions
};

fnc_generateLoadoutsActions = {
	params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
	_args params ["_vehicleClass", "_vehicleName", "_loadouts"];

	if (_loadouts isEqualTo []) exitWith {
		[]
	};

	private _childActions = [];
	{
		_x params ["_loadoutName", "_loadout"];

		private _priority = (count _loadouts) - _forEachIndex;
		private _spawnActionName = format ["%1_%2_%3", "spawnGarageVehicleLoadout", _vehicleClass, _priority];
		private _spawnLoadout = [
			_spawnActionName,
			_loadoutName,
			"",
			{
				params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
				_args params ["_vehicleClass", "_loadout", "_position"];

				private _vehicle = [_position, _vehicleClass] call Shadec_fnc_spawnVehicle;
				if (_vehicle isEqualTo objNull) then {
					[objNull, "There are no empty place for this vehicle"] call BIS_fnc_showCuratorFeedbackMessage;
				} else {
					[_vehicle, _loadout] call Shadec_fnc_applyLoadout;
				};
			},
			{
				true
			}, // Condition
			[ // Args
				_vehicleClass, _loadout, _position
			]
		] call zen_context_menu_fnc_createAction;
		_childActions pushBack [_spawnLoadout, [], _priority];
	} forEach _loadouts;

	_childActions
};