// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

params["_uid"];

private _return = "Extdb3" callExtension format ["0:%1:getOrders:%2", PROTOCOL, _uid];
private _data = [_return] call Shadec_db_server_fnc_processExtensionReturn;

private _orders = [_data] call Shadec_fnc_parseOrder;

//return
_orders