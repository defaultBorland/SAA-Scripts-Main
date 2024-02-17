// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_getOrders | Server only function"};

params["_uid"];

_getData = ((call compile ("Extdb3" callExtension format ["0:%1:getOrders:%2", PROTOCOL, _uid])) # 1);

private _orders = [_getData] call Shadec_fnc_parseOrder;

//return
_orders