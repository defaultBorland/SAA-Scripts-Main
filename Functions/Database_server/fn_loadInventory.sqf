// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

params ["_uid", "_unit"];

if (missionNamespace getVariable ["SAA_isMissionSpecial", false]) exitWith {
    _this call Shadec_db_server_fnc_loadInventorySpecial;
};

private _return = "Extdb3" callExtension format ["0:%1:loadInventory:%2", PROTOCOL, _uid];
private _data = [_return, true] call Shadec_db_server_fnc_processExtensionReturn;
if !(isNil {_data}) then {
    _data params ["_inventory"];

    _unit setUnitLoadout _inventory;
};