params ["_act", "_info"];

//[format["%1: %2", _act, _info joinString ", "], "Debug"] call Shadec_fnc_createLogServer;

switch (_act) do {

	case "saveAll" : {
		_info params ["_name", "_inventory", "_storage", "_uid"];
		"Extdb3" callExtension format ["1:%1:savePlayer:%2:%3:%4:%5", PROTOCOL,
			str _name,
			_inventory,
			_storage,
			_uid
		];

		// diag_log format ["%1's info was saved. Inventory:%2 | UID:%3", _info # 0, _info # 1, _info # 2];
	};

	case "loadAll" : {
		_info params ["_uid"];
		private _return = "Extdb3" callExtension format ["0:%1:loadPlayer:%2", PROTOCOL, _uid];
		private _data = [_return, true] call Shadec_fnc_processExtensionReturn;
		if !(isNil {_data}) then {
			_info params ["_uid", "_unit"];
			_data params ["_rank", "_pclass", "_sclass", "_inventory", "_storage"];

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
		"Extdb3" callExtension format ["1:%1:saveInventory:%2:%3", PROTOCOL,
			_inventory,
			_uid
		];
	};

	case "loadInventory" : {
		_info params ["_uid", "_unit"];
		private _return = "Extdb3" callExtension format ["0:%1:getInventory:%2", PROTOCOL, _uid];
		private _data = [_return, true] call Shadec_fnc_processExtensionReturn;
		if !(isNil {_data}) then {
			_data params ["_inventory"];

			_unit setUnitLoadout _inventory;
		};
	};

	case "saveStorage" : {
		_info params ["_uid", "_storageContent"];
		"Extdb3" callExtension format ["1:%1:saveStorage:%2:%3", PROTOCOL,
			_storageContent,
			_uid
		];
	};

	case "loadStorage" : {
		_info params ["_uid", "_player"];
		private _return = "Extdb3" callExtension format ["0:%1:getStorage:%2", PROTOCOL, _uid];
		private _data = [_return, true] call Shadec_fnc_processExtensionReturn;
		if !(isNil {_data}) then {
			_data params ["_storageContent"];

			private _order = [_uid] call Shadec_fnc_getOrdersServer;

			// diag_log format ["loadStorage params: %1 | %2 | %3", owner _player, _uid, _order];
			[_storageContent, owner _player, _uid, _order] spawn Shadec_fnc_createStorage;
		};
	};

	case "erasePurchaseOrder" : {
		_info params ["_uid"];
		"Extdb3" callExtension format ["1:%1:erasePurchaseOrders:%2", PROTOCOL,
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

	case "getGarageVehicles" : {
		private _garageVehiclesReturn = "Extdb3" callExtension format ["0:%1:getGarageVehicles", PROTOCOL];
		private _garageVehiclesData = [_garageVehiclesReturn] call Shadec_fnc_processExtensionReturn;
		diag_log format ["fnc_call_db | getGarageVehicles: %1", _garageVehiclesData];
		if !(isNil {_garageVehiclesData}) then {
			// Another call for all loadouts
			private _vehiclesLoadoutsReturn = "Extdb3" callExtension format ["0:%1:getVehiclesLoadouts", PROTOCOL];
			private _vehiclesLoadoutsData = [_vehiclesLoadoutsReturn] call Shadec_fnc_processExtensionReturn;
			diag_log format ["fnc_call_db | _vehiclesLoadoutsData: %1", _vehiclesLoadoutsData];
			if !(isNil {_vehiclesLoadoutsData}) then {
				{
					private _tablename = _x # 1;
					private _loadouts = _vehiclesLoadoutsData select {(_x # 1) isEqualTo _tablename};
					if (_loadouts isNotEqualTo []) then {
						_x pushBack (_loadouts apply {_x select [2, 2]});
						diag_log format ["fnc_call_db | _x: %1", _x];
					};
				} forEach _garageVehiclesData;
				missionNamespace setVariable ["SAA_vehiclesLoadouts", _vehiclesLoadoutsData, true];
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
		private _return = "Extdb3" callExtension format ["0:%1:getRespawnInventory:%2", PROTOCOL, _uid];
		private _data = [_return, true] call Shadec_fnc_processExtensionReturn;
		if !(isNil {_data}) then {
			_data params ["_inventory"];

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

	case "saveModlist" : {
		if (missionNamespace getVariable ["isDebug", false]) exitWith {};
		
		_info params ["_unit", "_modlist"];

		private _processedMods = [_unit, _modlist] call Shadec_fnc_processModlist;
		_processedMods params ["_clientMods", "_suspiciousMods", "_restrictedMods"];

		private _count = count _clientMods; // _modlist
		
		"Extdb3" callExtension format ["1:%1:saveModlist:%2:%3:%4:%5:%6:%7", PROTOCOL,
			getPlayerUID _unit,
			name _unit,
			_count,
			_clientMods, // _modlist
			_suspiciousMods,
			_restrictedMods
		];
	};

	case "getBlacklistedMods" : {
		private _return = "Extdb3" callExtension format ["0:%1:getBlacklistedMods", PROTOCOL];
		private _mods = [_return] call Shadec_fnc_processExtensionReturn;
		if !(isNil {_mods}) then {
			if (true) exitWith { _mods };
		} else {
			if (true) exitWith { [] };
		};
	};

	case "getWhitelistedMods" : {
		private _return = "Extdb3" callExtension format ["0:%1:getWhitelistedMods", PROTOCOL];
		private _mods = [_return] call Shadec_fnc_processExtensionReturn;
		if !(isNil {_mods}) then {
			if (true) exitWith { _mods };
		} else {
			if (true) exitWith { [] };
		};
	};

	case "blacklistMod" : {
		if (missionNamespace getVariable ["isDebug", false]) exitWith {};
		
		_info params ["_modName", "_modWorkshopId", "_modHash", "_initiator_name"];
		"Extdb3" callExtension format ["1:%1:blacklistMod:%2:%3:%4:%5", PROTOCOL, _modName, _modWorkshopId, _modHash, _initiator_name];
	};

	case "whitelistMod" : {
		if (missionNamespace getVariable ["isDebug", false]) exitWith {};
		
		_info params ["_modName", "_modWorkshopId", "_modHash", "_initiator_name"];
		"Extdb3" callExtension format ["1:%1:whitelistMod:%2:%3:%4:%5", PROTOCOL, _modName, _modWorkshopId, _modHash, _initiator_name];
	};

	case "getAvailiableItems" : {
		_info params ["_pClass", "_sClass"];
		private _sql = format["SELECT classname FROM items_restrictions WHERE %1_P = 1", _pClass];
		if (_sClass isNotEqualTo "None") then {_sql = format["%1 OR %2_S = 1", _sql, _sClass]};
		
		private _return = "Extdb3" callExtension format ["0:SQL:%1", _sql];
	
		if (true) exitWith { [_return] call Shadec_fnc_processExtensionReturn };
	};

	case "getUniform" : {
		_info params [["_camo", "None"], ["_class", "None"], ["_type", "None"]];
		private _sql = format["SELECT classname FROM uniforms WHERE 1=1"];
		if (_camo isNotEqualTo "None") then {_sql = format ["%1 AND camotype = '%2'", _sql, _camo]};
		if (_class isNotEqualTo "None") then {_sql = format ["%1 AND class = '%2'", _sql, _class]};
		if (_type isNotEqualTo "None") then {_sql = format ["%1 AND type = '%2'", _sql, _type]};
		
		private _return = "Extdb3" callExtension format ["0:SQL:%1", _sql];
		if (true) exitWith { [_return] call Shadec_fnc_processExtensionReturn };
	};

	case "getCommandingStats": {
		_info params ["_uids"];
		private _sql = format [
		"
			SELECT
				CONCAT ('""', S_PCS.uid, '""')
				, S_PCS.cnt
			FROM (
				SELECT 
					S_PP.mission mission
					, S_PP.name name
					, S_PP.uid uid
					, COUNT(uid) OVER (PARTITION BY uid) cnt
				FROM (
					SELECT
						M.id AS mission
						, P.name AS name
						, p.uid AS uid
						, SUM(TIMESTAMPDIFF(MINUTE, PC.connected, PC.disconnected)) AS PT_sum
						, (TIMESTAMPDIFF(MINUTE, M.`start`, M.`end`) - 45) AS M_time
						, RANK() OVER (PARTITION BY P.uid ORDER BY m.id DESC) AS RNK
					FROM players_connections PC
					JOIN missions M
						ON M.id = PC.mission
					JOIN players P
						ON P.uid = PC.uid
					WHERE P.uid IN (%1)
					GROUP BY P.name, M.id
				) S_PP
				LEFT JOIN missions m
					ON S_PP.mission = m.id AND m.commanders LIKE CONCAT('%2', S_PP.uid, '%2')
				WHERE ROUND(S_PP.PT_sum / S_PP.M_time, 2) * 100 > 40
					AND RNK > 1 AND RNK < 7
					AND m.id IS NOT NULL
				ORDER BY 2 ASC, 1 DESC
			) S_PCS
			GROUP BY S_PCS.uid, S_PCS.cnt
			;
		", _uids apply {"'" + _x + "'"} joinString ", ", "%"];

		private _return = "Extdb3" callExtension format ["0:SQL:%1", _sql];
		if (true) exitWith { [_return] call Shadec_fnc_processExtensionReturn };
	};
};