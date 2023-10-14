// Server Exec Only
if (!isDedicated) exitWith {diag_log format["fnc_getOrdersServer | ERROR: Non-server execution is prohibited"]};

params["_uid"];
_getData = ((call compile ("Extdb3" callExtension format ["0:%1:checkOrders:%2", PROTOCOL, _uid])) # 1);

private _orders = [_getData] call Shadec_fnc_parseOrder;

//return
_orders