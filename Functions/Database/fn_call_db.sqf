_act = _this # 0;// "saveAll", "loadAll"...
_info = _this # 1;// player info
switch _act do {
	case "saveAll" : {
		private _name = str(_info # 0);
		"Extdb3" callExtension format ["0:%1:savePlayer:%2:%3:%4", PROTOCOL,
			_name, // name
			_info # 1, // inventory
			_info # 2// UID
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

			private _order = [_uid] call Shadec_fnc_getOrdersServer;

			[_storage, owner _unit, _uid, _order] spawn Shadec_fnc_createStorage;
			[_unit, _uid, "Assign"] spawn Shadec_fnc_rolesAssign;
			_unit setUnitLoadout _inventory;

			// try to achieve restricted items removing...
			 [{
				// Condition
				params ["_unit", "_inventory"];
				(getUnitLoadout _unit) isEqualTo _inventory;
			}, {
				// Statement
				params ["_unit", "_inventory"];
				[_unit] call Shadec_fnc_removeInventoryRestrictedItems
			}, [_unit, _inventory], 15, {
				diag_log format ["Warning | fnc_call_db: loadAll DB action inventory comparing timeout."]
			}] call CBA_fnc_waitUntilAndExecute;

			_unit setVariable ["LoadoutLoaded", true, true];
			missionNamespace setVariable [format["loadoutLoaded_%1", _uid], true, true];

			// diag_log format ["%1's info was loaded. Rank: %2 | PClass: %3 | SClass: %4 | Inventory: %5 | Storage: %6 | PurchaseOrder: %7 | UID: %8", name _unit, _rank, _pclass, _sclass, _inventory, _storage, _order, _uid];
		} else {
			private _unit = _info # 1;// unit
			"Extdb3" callExtension format ["0:%1:newPlayer:%2:%3", PROTOCOL, getPlayerUID _unit, str name _unit];
			sleep 3;
			[_act, _info] spawn Shadec_fnc_call_db;
		};
	};

	case "saveInventory" : {
		"Extdb3" callExtension format ["0:%1:saveInventory:%2:%3", PROTOCOL,
			_info # 0, // inventory
			_info # 1// UID
		];
	};

	case "loadInventory" : {
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getInventory:%2", PROTOCOL, _info # 0])) # 1) # 0;
		if !(isNil {_getData}) then {
			private _inventory = _getData # 0;
			private _unit = _info # 1;
			private _unit setUnitLoadout _inventory;

			missionNamespace setVariable [format["pInventory_%1", _info # 0], _inventory];
		};
	};

	case "saveStorage" : {
		"Extdb3" callExtension format ["0:%1:saveStorage:%2:%3", PROTOCOL,
			_info # 1, // storage array
			_info # 0// UID
		];
	};

	case "loadStorage" : {
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getStorage:%2", PROTOCOL, _info # 0])) # 1) # 0;
		if !(isNil {_getData}) then {
			_info params ["_uid", "_player"];
			_getData params ["_storage"];

			private _order = [_uid] call Shadec_fnc_getOrdersServer;

			diag_log format ["loadStorage params: %1 | %2 | %3", owner _player, _uid, _order];
			[_storage, owner _player, _uid, _order] spawn Shadec_fnc_createStorage;
		};
	};

	case "erasePurchaseOrder" : {
		"Extdb3" callExtension format ["0:%1:erasePurchaseOrders:%2", PROTOCOL,
			_info # 0// UID
		];
		// diag_log format ["PurchaseOrder was erased. UID:%1", _info # 0];
	};

	case "changeClasses" : {
		"Extdb3" callExtension format ["0:%1:changeClasses:%2:%3:%4", PROTOCOL,
			_info # 1, // First Class
			_info # 2, // Second Class
			_info # 0 // UID
		];
	};

	case "saveModlist" : {
		"Extdb3" callExtension format ["0:%1:saveModlist:%2:%3", PROTOCOL,
			_info # 0, // modlist array
			_info # 1// UID
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
};