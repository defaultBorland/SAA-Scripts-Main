// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_loadStorage | Server only function"};

params ["_uid", "_player"];

private _return = "Extdb3" callExtension format ["0:%1:getStorage:%2", PROTOCOL, _uid];
private _data = [_return, true] call Shadec_db_server_fnc_processExtensionReturn;
if !(isNil {_data}) then {
    _data params ["_storageContent"];

    private _order = [_uid] call Shadec_fnc_getOrdersServer;

    // diag_log format ["loadStorage params: %1 | %2 | %3", owner _player, _uid, _order];
    [_storageContent, owner _player, _uid, _order] spawn Shadec_fnc_createStorage;
};