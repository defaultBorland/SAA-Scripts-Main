_act = _this # 0; //"saveAll","loadAll"...
_info = _this # 1; //Player info
switch _act do {
	case "saveAll" : { 
		"Extdb3" callExtension format ["0:%1:savePlayer:%2:%3:%4:%5", PROTOCOL, 
			str(_info # 0), //name
			_info # 1, //cash
			_info # 2, //inventory
			_info # 3 //UID
		];
		diag_log format ["%1's info was saved. Cash:%2 | Inventory:%3 | Storage:%4 | UID:%5", _info # 0, _info # 1, _info # 2, _info # 3, _info # 4];
	};
	case "loadAll" : { 
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:loadPlayer:%2", PROTOCOL, _info # 0])) # 1) # 0;
		if !(isNil {_getData}) then {
			private _uid = _info # 0;
			private _unit = _info # 1;
			private _rank = _getData # 0;
			private _pclass = _getData # 1;
			private _sclass = _getData # 2;
			private _cash = _getdata # 3;
			private _inventory = _getData # 4;
			missionNamespace setVariable [format["%1_DATA", _uid], [_rank, _pclass, _sclass, _cash], true];

			[_getData # 5, owner _unit, _uid, _getData # 6] spawn Shadec_fnc_createStorage;
			[_unit, _uid] spawn Shadec_fnc_rolesAutoAssign;
			_unit setUnitLoadout _inventory;
			missionNamespace setVariable [format["loadoutLoaded_%1", _uid], true, true];
			diag_log format ["%1's info was loaded. Rank:%2 | PClass:%3 | SClass:%4 | Cash:%5 | Inventory:%6 | Storage:%7 | Buylist:%8 | UID:%9", name _unit, _rank, _pclass, _sclass, _cash, _inventory, _getData # 5, _getData # 6, _uid];


			//[[[format["Name: %1", name _unit],3,1,8], [format["Rank: %1", _getData # 0],3,1,8], [format["Class: %1", _getData # 1],3,1,8]], BIS_fnc_EXP_camp_SITREP] remoteExec ["spawn", owner(_unit)];
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
		//diag_log format ["Inventory was saved. Inventory:%1 | UID:%2", _info # 0, _info # 1];
	};
	case "loadInventory" : {
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getInventory:%2", PROTOCOL, _info # 0])) # 1) # 0;
		if !(isNil {_getData}) then {
			private _inventory = _getData # 0;
			private _unit = _info # 1;
			private _unit setUnitLoadout _inventory;
			
			missionNamespace setVariable [format["pInventory_%1",_info # 0], _inventory];
			//diag_log format ["Inventory was loaded. Inventory:%1 | UID:%2", _inventory, _info # 0];
		} else {
			//diag_log format ["Inventory was NOT loaded. UID:%1", _info # 0];
		};
	};
	case "saveCash" : {
		"Extdb3" callExtension format ["0:%1:saveCash:%2:%3", PROTOCOL, 
			_info # 0, //cash
			_info # 1 //UID
		];
		//diag_log format ["Cash was saved. Cash:%1 | UID:%2", _info # 0, _info # 1];
	};
	case "loadCash" : {
		_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getCash:%2", PROTOCOL, _info # 0])) # 1) # 0;
		if !(isNil {_getData}) then {
			private _cash = _getData # 0;
			private _uid = _info # 0;
			
			missionNamespace setVariable [format["pCash_%1", _uid], _cash];
			//diag_log format ["Cash was loaded. Cash:%1 | UID:%2", _cash, _uid];
		} else {
			//diag_log format ["Cash was NOT loaded. UID:%1", _info # 0];
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
			//diag_log format ["Storage was loaded. Storage:%1 | UID:%2", _storage, _uid];
		} else {
			//diag_log format ["Storage was NOT loaded. UID:%1", _info # 0];
		};
	};
	case "eraseBuylist" : {
		"Extdb3" callExtension format ["0:%1:eraseBuylist:%2", PROTOCOL, 
			_info # 0 //UID
		];
		diag_log format ["Buylist was erased. UID:%1", _info # 0];
	};
	case "getAllNames": {
		_getData = (call compile("Extdb3" callExtension format ["0:%1:getAllNames", PROTOCOL])) # 1;
		if !(isNil {_getData}) then {
			diag_log format ["NAMES: %1", _getData];
			missionNamespace setVariable ["AllDBNames", _getData, true];
		} else {
			diag_log format ["WHERE IS FUCKING NAMES?"];
		};
	};
	case "getStorageByName": {
		_getData = (call compile("Extdb3" callExtension format ["0:%1:getStorageByName", PROTOCOL])) # 1;
		if !(isNil {_getData}) then {
			diag_log format ["getStorageByName: %1", _getData];
			missionNamespace setVariable ["getStorageByName", _getData, true];
		} else {
			
		};
	};
};