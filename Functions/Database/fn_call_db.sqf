_act = _this # 0; //"saveAll","loadAll"...
_info = _this # 1; //Player info
switch _act do {
	case "saveAll" : { 
		"Extdb3" callExtension format ["0:%1:savePlayer:%2:%3:%4", PROTOCOL, 
			str(_info # 0), //name
			_info # 1, //inventory
			_info # 2 //UID
		];
		diag_log format ["%1's info was saved. Inventory:%2 | UID:%3", _info # 0, _info # 1, _info # 2];
	};
	
	case "loadAll" : { 
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:loadPlayer:%2", PROTOCOL, _info # 0])) # 1) # 0;
		if !(isNil {_getData}) then {
			private _uid = _info # 0;
			private _unit = _info # 1;
			private _rank = _getData # 0;
			private _pclass = _getData # 1;
			private _sclass = _getData # 2;
			private _inventory = _getData # 3;
			missionNamespace setVariable [format["%1_DATA", _uid], [_rank, _pclass, _sclass], true];

			[_getData # 4, owner _unit, _uid, _getData # 5] spawn Shadec_fnc_createStorage;
			[_unit, _uid, "Assign"] spawn Shadec_fnc_rolesAssign;
			_unit setUnitLoadout _inventory;
			
			missionNamespace setVariable [format["loadoutLoaded_%1", _uid], true, true];
			
			// diag_log format ["%1's info was loaded. Rank:%2 | PClass:%3 | SClass:%4 | Inventory:%5 | Storage:%6 | Buylist:%7 | UID:%8", name _unit, _rank, _pclass, _sclass, _inventory, _getData # 4, _getData # 5, _uid];
		} else {
			private _unit = _info # 1; //unit
			"Extdb3" callExtension format  ["0:%1:newPlayer:%2:%3", PROTOCOL, getPlayerUID _unit, str name _unit];
			sleep 3;
			[_act, _info] spawn Shadec_fnc_call_db;
		};
	};
	
	case "saveInventory" : {
		"Extdb3" callExtension format ["0:%1:saveInventory:%2:%3", PROTOCOL, 
			_info # 0, //inventory
			_info # 1 //UID
		];
	};
	
	case "loadInventory" : {
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getInventory:%2", PROTOCOL, _info # 0])) # 1) # 0;
		if !(isNil {_getData}) then {
			private _inventory = _getData # 0;
			private _unit = _info # 1;
			private _unit setUnitLoadout _inventory;
			
			missionNamespace setVariable [format["pInventory_%1",_info # 0], _inventory];
		};
	};
	
	case "saveStorage" : {
		"Extdb3" callExtension format ["0:%1:saveStorage:%2:%3", PROTOCOL, 
			_info # 1, //storage array
			_info # 0 //UID
		];
		//diag_log format ["Storage was saved. Storage:%1 | UID:%2", _info # 1, _info # 0];
	};
	
	case "loadStorage" : {
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getStorage:%2", PROTOCOL, _info # 0])) # 1) # 0;
		if !(isNil {_getData}) then {
			private _storage = _getData # 0;
			private _buylist = _getData # 1;
			private _uid = _info # 0;
			diag_log format ["loadStorage params: %1 | %2 | %3", owner (_info # 1), _uid, _buylist];
			[_storage, owner (_info # 1), _uid, _buylist] spawn Shadec_fnc_createStorage;
		};
	};
	
	case "eraseBuylist" : {
		"Extdb3" callExtension format ["0:%1:eraseBuylist:%2", PROTOCOL, 
			_info # 0 //UID
		];
		diag_log format ["Buylist was erased. UID:%1", _info # 0];
	};

	case "changeClasses" : {
		"Extdb3" callExtension format ["0:%1:changeClasses:%2:%3:%4", PROTOCOL,
			_info # 1, // First Class
			_info # 2, // Second Class
			_info # 0 // UID
		];
	};
};