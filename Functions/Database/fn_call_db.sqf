params ["_act", "_info"];

//[format["%1: %2", _act, _info joinString ", "], "Debug"] call Shadec_fnc_createLogServer;

switch (_act) do {
	case "saveAll" : {
		_info params ["_name", "_inventory", "_storage", "_uid"];
		"Extdb3" callExtension format ["0:%1:savePlayer:%2:%3:%4:%5", PROTOCOL,
			str _name,
			_inventory,
			_storage,
			_uid
		];

		// diag_log format ["%1's info was saved. Inventory:%2 | UID:%3", _info # 0, _info # 1, _info # 2];
	};

	case "loadAll" : {
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:loadPlayer:%2", PROTOCOL, _info # 0])) # 1) # 0;
		if !(isNil {_getData}) then {
			_info params ["_uid", "_unit"];
			_getData params ["_rank", "_pclass", "_sclass", "_inventory", "_storage"];

			_unit setVariable ["SAA_Rank", _rank, true];
			_unit setVariable ["SAA_PrimaryClass", _pclass, true];
			_unit setVariable ["SAA_SecondaryClass", _sclass, true];
			missionNamespace setVariable [format["%1_DATA", _uid], [_rank, _pclass, _sclass], true];
			[_unit, "Assign"] spawn Shadec_fnc_rolesAssign;

			private _order = [_uid] call Shadec_fnc_getOrdersServer;
			[_storage, owner _unit, _uid, _order] spawn Shadec_fnc_createStorage;

			if (_rank isEqualTo "GUEST") then {
				private _guestLoadout = missionNamespace getVariable [format["SAA_GuestLoadout_%1", getPlayerUID _unit], nil];
				if (!isNil{_guestLoadout}) then {_inventory = _guestLoadout};
			};

			//
			_unit setVariable ["SAA_loadLoadout", _inventory, true];
			_unit setUnitLoadout _inventory;

			// try to achieve restricted items removing...
			[{
				// Condition
				params ["_unit", "_inventory"];
				(getUnitLoadout _unit) isEqualTo _inventory;
			}, {
				// Statement
				params ["_unit", "_inventory", "_uid"];
				[_unit] call Shadec_fnc_removeInventoryRestrictedItems;
				[_unit] call Shadec_fnc_reassignUnitRadios;
				[[], Shadec_fnc_loadPlayerRadioSettings] remoteExec ["call", _unit];

				_unit setVariable ["LoadoutLoaded", true, true];
				missionNamespace setVariable [format["loadoutLoaded_%1", _uid], true, true];
			}, [_unit, _inventory, _uid], 180, {
				params ["_unit", "_inventory"];
				diag_log format["fnc_call_db | loadAll DB action inventory comparing timeout: %1", name _unit];
				diag_log format["Unit Loadout: %1", getUnitLoadout _unit];
				diag_log format["Loaded loadout: %1", _inventory];
				[format["fnc_call_db | loadAll DB action inventory comparing timeout: %1", name _unit], "Warning"] call Shadec_fnc_createLogServer;
			}] call CBA_fnc_waitUntilAndExecute;

			// diag_log format ["%1's info was loaded. Rank: %2 | PClass: %3 | SClass: %4 | Inventory: %5 | Storage: %6 | PurchaseOrder: %7 | UID: %8", name _unit, _rank, _pclass, _sclass, _inventory, _storage, _order, _uid];
		} else { 
			// Player is not exists in db, create a new one
			_info params ["_uid", "_unit"];
			private _loadout = call Shadec_fnc_selectRandomLoadout;

			"Extdb3" callExtension format ["0:%1:newPlayer:%2:%3:%4", PROTOCOL, _uid, str name _unit, _loadout];
			sleep 3;
			[_act, _info] spawn Shadec_fnc_call_db;
		};
	};

	case "saveInventory" : {
		_info params ["_uid", "_inventory"];
		"Extdb3" callExtension format ["0:%1:saveInventory:%2:%3", PROTOCOL,
			_inventory,
			_uid
		];
	};

	case "loadInventory" : {
		_info params ["_uid", "_unit"];
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getInventory:%2", PROTOCOL, _uid])) # 1) # 0;
		if !(isNil {_getData}) then {
			_getData params ["_inventory"];

			_unit setUnitLoadout _inventory;
		};
	};

	case "saveStorage" : {
		_info params ["_uid", "_storageContent"];
		"Extdb3" callExtension format ["0:%1:saveStorage:%2:%3", PROTOCOL,
			_storageContent,
			_uid
		];
	};

	case "loadStorage" : {
		_info params ["_uid", "_player"];
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getStorage:%2", PROTOCOL, _uid])) # 1) # 0;
		if !(isNil {_getData}) then {
			_getData params ["_storageContent"];

			private _order = [_uid] call Shadec_fnc_getOrdersServer;

			// diag_log format ["loadStorage params: %1 | %2 | %3", owner _player, _uid, _order];
			[_storageContent, owner _player, _uid, _order] spawn Shadec_fnc_createStorage;
		};
	};

	case "erasePurchaseOrder" : {
		_info params ["_uid"];
		"Extdb3" callExtension format ["0:%1:erasePurchaseOrders:%2", PROTOCOL,
			_uid
		];
		// diag_log format ["PurchaseOrder was erased. UID:%1", _info # 0];
	};

	case "changeClasses" : {
		_info params ["_uid", "_pclass", "_sClass"];
		"Extdb3" callExtension format ["0:%1:changeClasses:%2:%3:%4", PROTOCOL,
			_pclass,
			_sClass,
			_uid
		];
	};

	case "saveModlist" : {
		_info params ["_uid", "_modlist"];
		"Extdb3" callExtension format ["0:%1:saveModlist:%2:%3", PROTOCOL,
			_modlist,
			_uid
		];
		diag_log format ["modlist was saved. UID:%1 | MODLIST: %2", _info # 0, _info # 1];
	};

	case "getGarageVehicles" : {
		_garageVehiclesData = (call compile ("Extdb3" callExtension format ["0:%1:getGarageVehicles", PROTOCOL])) # 1;
		if !(isNil {_garageVehiclesData}) then {

			// Another call for all loadouts
			_loadoutsData = (call compile ("Extdb3" callExtension format ["0:%1:getVehiclesLoadouts", PROTOCOL])) # 1;
			if !(isNil {_loadoutsData}) then {

				{
					private _tablename = _x # 1;

					private _index = _loadoutsData findIf {(_x # 1) isEqualTo _tablename};
					if (_index > 0) then {
						_x pushBack ((_loadoutsData # _index) select [2, 2]);
					};
				} forEach _garageVehiclesData;
				missionNamespace setVariable ["SAA_vehiclesLoadouts", _loadoutsData, true];
			};

			missionNamespace setVariable ["SAA_garageVehicles", _garageVehiclesData, true];
		};
	};

	case "createMission" : {
		_info params ["_missionID", "_map"];
		"Extdb3" callExtension format ["0:%1:createMission:%2:%3", PROTOCOL, _missionID, _map];
	};

	case "endMission" : {
		_info params ["_missionID", "_zeuses", "_cmds"];
		"Extdb3" callExtension format ["0:%1:endMission:%2:%3:%4", PROTOCOL, _zeuses, _cmds, _missionID];
	};

	case "createDeadRecord" : {
		_info params ["_uid", "_name", "_inventory"];
		"Extdb3" callExtension format ["0:%1:createDeadRecord:%2:%3:%4", PROTOCOL, _uid, _name, _inventory];
	};

	case "updateDeadRecord" : {
		_info params ["_uid"];
		"Extdb3" callExtension format ["0:%1:updateDeadRecord:%2", PROTOCOL, _uid];
	};

	case "getRespawnInventory" : {
		_info params ["_uid", "_unit"];
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getRespawnInventory:%2", PROTOCOL, _uid])) # 1) # 0;
		if !(isNil {_getData}) then {
			_getData params ["_inventory"];

			_unit setUnitLoadout _inventory;
		};
	};

	case "createConnectionRecord" : {
		_info params ["_uid", "_name", "_mission"];
		"Extdb3" callExtension format ["0:%1:createConnectionRecord:%2:%3:%4", PROTOCOL, _uid, _name, _mission];
	};

	case "updateConnectionRecord" : {
		_info params ["_uid", "_mission"];
		"Extdb3" callExtension format ["0:%1:updateConnectionRecord:%2:%3", PROTOCOL, _uid, _mission];
	};

	case "getRespawnTime" : {
		_info params ["_uid", "_unit", "_mission"];
		[format["_info: %1", _info], "Debug"] call Shadec_fnc_createLogServer;
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getDeadTime:%2:%3", PROTOCOL, _uid, _mission])) # 1) # 0;
		[format["_getData: %1", _getData], "Debug"] call Shadec_fnc_createLogServer;
		if !(isNil {_getData}) then {
			_getData params ["_deadTime"];

			[format["Player %1 dead time: %2", _uid, _deadTime], "Debug"] call Shadec_fnc_createLogServer;
			if (isNil {_deadTime}) exitWith {};

			// Problem: need to considerate wave respawnTemplate (x2 time to respawn)
			private _timeToRespawn = (respawnTime - _deadTime) max 10;

			[format["Player %1 time to respawn: %2", _uid, _timeToRespawn], "Debug"] call Shadec_fnc_createLogServer;

			// [_timeToRespawn] remoteExec ["setPlayerRespawnTime", _unit];
		};
	};
};