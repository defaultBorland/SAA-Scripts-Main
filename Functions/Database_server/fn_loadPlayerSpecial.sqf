// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

params ["_uid", "_unit"];

private _return = "Extdb3" callExtension format ["0:%1:loadPlayerSpecial:%2", PROTOCOL, _uid];
private _data = [_return, true] call Shadec_db_server_fnc_processExtensionReturn;
if !(isNil {_data}) then {
    _data params ["_rank", "_pclass", "_sclass", "_inventory", "_storage"];

    _unit setVariable ["SAA_Rank", _rank, true];
    _unit setVariable ["SAA_PrimaryClass", _pclass, true];
    _unit setVariable ["SAA_SecondaryClass", _sclass, true];

    [_unit, "Assign"] spawn Shadec_fnc_rolesAssign;
    
    private _orders = [[], [_uid] call Shadec_db_server_fnc_getOrders] select (missionNamespace getVariable ["SAA_missionSpecial_processOrders", false]);
    //if (missionNamespace getVariable ["SAA_missionSpecial_loadStorage", false]) then {
        [_storage, owner _unit, _uid, _orders] spawn Shadec_fnc_createStorage;
    //};

    if (_rank isEqualTo "GUEST") then {
        missionNamespace setVariable [format["SAA_isGuest_%1", _uid], true, true];
        private _guestLoadout = missionNamespace getVariable [format["SAA_GuestLoadout_%1", getPlayerUID _unit], nil];
        if (!isNil{_guestLoadout}) then {_inventory = _guestLoadout};
    };

    //
    _unit setVariable ["SAA_loadLoadout", _inventory, true];
    _unit setUnitLoadout _inventory;

    [{
        // Condition
        params ["_unit", "_inventory"];
        (getUnitLoadout _unit) isEqualTo _inventory;
    }, {
        // Statement
        params ["_unit", "_inventory", "_uid"];
        
        [[_unit], {
            params ["_unit"];
            [_unit] call Shadec_fnc_reassignUnitRadios;
            [_unit] call Shadec_fnc_loadPlayerRadioSettings;
        }] remoteExec ["call", _unit];

        _unit setVariable ["LoadoutLoaded", true, true];
        missionNamespace setVariable [format["loadoutLoaded_%1", _uid], true, true];
    }, [_unit, _inventory, _uid], 180, {
        params ["_unit", "_inventory"];
        diag_log format["fnc_call_db | loadAll DB action inventory comparing timeout: %1", name _unit];
        diag_log format["Unit Loadout: %1", getUnitLoadout _unit];
        diag_log format["Loaded loadout: %1", _inventory];
        [format["fnc_call_db | loadAll DB action inventory comparing timeout: %1", name _unit], "Warning"] call Shadec_fnc_createLogServer;
    }] call CBA_fnc_waitUntilAndExecute;
} else { 
    // Player is not exists in db, create a new one
    private _loadout = getUnitLoadout _unit;
    
    private _ranksAndClasses = [_uid] call Shadec_db_server_fnc_getRankAndClasses;
    _ranksAndClasses params [["_rank", "PV1"], ["_primaryClass", "Rifleman"], ["_secondaryClass", "None"]];

    "Extdb3" callExtension format ["0:%1:newPlayerSpecial:%2:%3:%4:%5:%6:%7", PROTOCOL, _uid, name _unit, _loadout, _rank, _primaryClass, _secondaryClass];

    sleep 3;
    [_uid, _unit] spawn Shadec_db_server_fnc_loadPlayerSpecial;
};