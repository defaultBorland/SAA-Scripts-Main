// Create player box with equipment and PurchaseOrder, access to the box via action from an object with "objectStorage" variable.
// If object with "objectStorage" variable doesn't exists - exit with log.

params ["_storageList", "_pcid", "_uid", "_purchaseOrder"];

(missionNamespace getVariable [format["%1_DATA", _uid], ["PV1","Rifleman", "None"]]) params ["_rank", "_primClass", "_secClass"];
private _boxMaxLoad = [_rank, _primClass, _secClass] call Shadec_fnc_calcStorageSize;

missionNamespace setVariable [format["pStorage_%1", _uid], createVehicle ["B_supplyCrate_F", [0,0,0], [], 0, "CAN_COLLIDE"], true]; // CAN_COLLIDE || NONE
_pStorage = missionNamespace getVariable (format["pStorage_%1", _uid]);
_pStorage setVariable ["storageName", format["pStorage_%1", _uid], true];

clearWeaponCargoGlobal _pStorage;
clearMagazineCargoGlobal _pStorage;
clearItemCargoGlobal _pStorage;
clearBackpackCargoGlobal _pStorage;

_pStorage setMaxLoad _boxMaxLoad;

["loadStorage", _storageList, _uid] spawn Shadec_fnc_addToStorage;
["loadPurchaseOrder", _purchaseOrder, _uid] spawn Shadec_fnc_addToStorage;

hideObjectGlobal _pStorage;
_pStorage setVariable ["ace_cookoff_enable", false, true];

_storages = missionNamespace getVariable ["storagesProxys", []];
if !(_storages isEqualTo []) then {
	{
		[[_x], {
			[_this # 0] call Shadec_fnc_addActionToStorage;
		}] remoteExec ["spawn", _pcid];
	} forEach _storages;
};