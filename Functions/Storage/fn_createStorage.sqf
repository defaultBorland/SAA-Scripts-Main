// Create player box with equipment and PurchaseOrder, access to the box via action from an object with "objectStorage" variable.
// If object with "objectStorage" variable doesn't exists - exit with log.

params ["_storageList", "_pcid", "_uid", "_purchaseOrder"];

(missionNamespace getVariable [format["%1_DATA", _uid], ["PV1","Rifleman", "None"]]) params ["_rank", "_primClass", "_secClass"];
private _boxClass = "";
switch (_primClass) do {
	case "ATSpec": {_boxClass = "Box_NATO_Equip_F"}; // maximumLoad = 7000
	case "Machinegunner": {_boxClass = "CargoNet_01_box_F"}; // maximumLoad = 6000
	case "Rifleman";
	case "Nurse";
	case "Medic";
	case "Grenadier";
	case "Engineer";
	case "Marksman";
	case "Sniper";
	default {_boxClass = "B_supplyCrate_F"}; // maximumLoad = 4000
};

missionNamespace setVariable [format["pStorage_%1", _uid], createVehicle [_boxClass, [0,0,0], [], 0, "CAN_COLLIDE"], true];
_pStorage = missionNamespace getVariable (format["pStorage_%1", _uid]);
_pStorage setVariable ["storageName", format["pStorage_%1", _uid], true];

clearWeaponCargoGlobal _pStorage;
clearMagazineCargoGlobal _pStorage;
clearItemCargoGlobal _pStorage;
clearBackpackCargoGlobal _pStorage;

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