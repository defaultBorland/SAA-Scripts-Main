params ["_unit", "_uid"];
_unit = _this # 0;
_uid = _this # 1;

if (_uid in (missionNamespace getVariable "ZeusArray")) exitWith {};
if !(missionNamespace getVariable (format["loadoutLoaded_%1", _uid])) exitWith {};
if (((missionNamespace getVariable (format["%1_DATA", _uid])) # 0) isEqualTo "GUEST") exitWith {};

_inventory = getUnitLoadout _unit;

// Saving Inventory to local profile to show in ShopMission
profileNamespace setVariable ["SAA_Project_Inventory", _inventory];

_data = [_inventory,_uid];
diag_log format["SAVE PLAYER INVENTORY:%1", _data];

[["saveInventory",_data], Shadec_fnc_call_db] remoteExec ["spawn", 2];