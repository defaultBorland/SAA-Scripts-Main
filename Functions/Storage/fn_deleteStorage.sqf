// Remove player box with equipment
params ["_uid"];

private _storageInventory = [_uid] call Shadec_fnc_getStorageInventory;
if (_storageInventory isEqualTo false) then {
    diag_log format["fnc_getStorageInventory | Error: Trying to save Storage that unaccessible: %1", _uid]}
else {
    [_uid, _storageInventory] call Shadec_db_server_fnc_saveStorage;
};

private _pStorage = missionNamespace getVariable [format["pStorage_%1", _uid], objNull];
if (isNull _pStorage) exitWith {};
clearWeaponCargoGlobal _pStorage;
clearMagazineCargoGlobal _pStorage;
clearItemCargoGlobal _pStorage;
deleteVehicle _pStorage;

missionNamespace setVariable [format["pStorage_%1", _uid], nil, true];

//return
true