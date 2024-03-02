// Create player box with equipment and PurchaseOrder, access to the box via action from an object with "objectStorage" variable.
// If object with "objectStorage" variable doesn't exists - exit with log.

params ["_storageList", "_pcid", "_uid", "_purchaseOrder"];

private _unit = [_uid] call Shadec_fnc_getPlayer;

private _rank = _unit getVariable ["SAA_Rank", "PV1"];
private _firstClass = _unit getVariable ["SAA_PrimaryClass", "Rifleman"];
private _secondClass = _unit getVariable ["SAA_SecondaryClass", "None"];

private _boxMaxLoad = [_rank, _firstClass, _secondClass] call Shadec_fnc_calcStorageSize;

// Check if storage already exists and delete it
private _oldStorage = missionNamespace getVariable [format["pStorage_%1", _uid], objNull];
if (!isNull _oldStorage) then {
	[[_uid], {
		params ["_uid"];
		[_uid] call Shadec_db_client_fnc_saveStorage;
	}] remoteExec ["call", _unit];
	
	deleteVehicle _oldStorage;
	missionNamespace setVariable [format["pStorage_%1", _uid], nil, true];
};

private _storage = createVehicle ["B_supplyCrate_F", [0,0,0], [], 0, "CAN_COLLIDE"]; // CAN_COLLIDE || NONE
_storage setVariable ["SAA_isPersonalStorage", true, true];
_storage setVariable ["SAA_storageOwner", _uid, true];

missionNamespace setVariable [format["pStorage_%1", _uid], _storage, true];

clearWeaponCargoGlobal _storage;
clearMagazineCargoGlobal _storage;
clearItemCargoGlobal _storage;
clearBackpackCargoGlobal _storage;

_storage setMaxLoad _boxMaxLoad;

["loadStorage", _storageList, _uid] spawn Shadec_fnc_addToStorage;
["loadPurchaseOrder", _purchaseOrder, _uid] spawn Shadec_fnc_addToStorage;

hideObjectGlobal _storage;
_storage setVariable ["ace_cookoff_enable", false, true];

_storages = missionNamespace getVariable ["storagesProxys", []];
if !(_storages isEqualTo []) then {
	{
		[[_x], {
			[_this # 0] call Shadec_fnc_addActionToStorage;
		}] remoteExec ["spawn", _pcid];
	} forEach _storages;
};