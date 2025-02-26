// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

private _garageVehiclesReturn = "Extdb3" callExtension format ["0:%1:getGarageVehicles", PROTOCOL];
private _garageVehiclesData = [_garageVehiclesReturn] call Shadec_db_server_fnc_processExtensionReturn;
if !(isNil {_garageVehiclesData}) then {
    // Another call for all loadouts
    private _vehiclesLoadoutsReturn = "Extdb3" callExtension format ["0:%1:getVehiclesLoadouts", PROTOCOL];
    private _vehiclesLoadoutsData = [_vehiclesLoadoutsReturn] call Shadec_db_server_fnc_processExtensionReturn;
    if !(isNil {_vehiclesLoadoutsData}) then {
        {
            private _tablename = _x # 1;
            private _loadouts = _vehiclesLoadoutsData select {(_x # 1) isEqualTo _tablename};
            if (_loadouts isNotEqualTo []) then {
                _x pushBack (_loadouts apply {_x select [2, 2]});
            };
        } forEach _garageVehiclesData;
        missionNamespace setVariable ["SAA_vehiclesLoadouts", _vehiclesLoadoutsData, true];
    };
    missionNamespace setVariable ["SAA_garageVehicles", _garageVehiclesData, true];
};