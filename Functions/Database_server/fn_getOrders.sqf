// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

params["_uid"];

_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getOrders:%2", PROTOCOL, _uid])) # 1);

private _orders = [_getData] call Shadec_fnc_parseOrder;

//return
_orders