// Create player box with equipment and buylist, access to the box via action from an object with "objectStorage" variable.
// If object with "objectStorage" variable doesn't exists - exit with log.

params ["_storage", "_pcid", "_uid", "_buyList"];
_storageList = _this # 0;
_pcid = _this # 1;
_uid = _this # 2;
_buyList = _this # 3;

missionNamespace setVariable [format["storage_%1", _uid], _storageList];

_objectStorage = missionNamespace getVariable ["objectStorage", nil];
if (isNil {_objectStorage}) exitWith {diag_log format ["objectStorage not found. Storage box cannot be created."]};

(missionNamespace getVariable [format["%1_DATA", _uid], ["PV1","Rifleman", "None"]]) params ["_rank", "_primClass", "_secClass"];
private _boxClass = "";
switch (_primClass) do {
	case "ATSpec": {_boxClass = "Box_NATO_Equip_F"};
	case "Machinegunner": {_boxClass = "CargoNet_01_box_F"};
	case "Rifleman";
	case "Nurse";
	case "Medic";
	case "Grenadier";
	case "Engineer";
	case "Marksman";
	case "Sniper";
	default {_boxClass = "B_supplyCrate_F"};
};

missionNamespace setVariable [format["pStorage_%1", _uid], createVehicle [_boxClass, [0,0,0], [], 0, "CAN_COLLIDE"], true];
_pStorage = missionNamespace getVariable (format["pStorage_%1", _uid]);
_pStorage setVariable ["storageName", format["pStorage_%1", _uid], true];

clearWeaponCargoGlobal _pStorage;
clearMagazineCargoGlobal _pStorage;
clearItemCargoGlobal _pStorage;
clearBackpackCargoGlobal _pStorage;

["loadStorage", _storageList, _uid] spawn Shadec_fnc_addToStorage;
["loadBuylist", _buyList, _uid] spawn Shadec_fnc_addToStorage;

hideObjectGlobal _pStorage;

[_objectStorage, [localize "str_SAA_STORAGE_ACTION", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	(_this # 3 # 0) setPosASLW (getPosASLW (_this # 0));
	(_this # 3 # 0) lock true;
	(_this # 1) action ["Gear", (_this # 3 # 0)];
}, [_pStorage], 6, true, false, "", "true", 3, false ,"", ""]] remoteExec ["addAction", _pcid];

//return