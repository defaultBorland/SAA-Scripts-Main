// Remove player box with equipment

params ["_uid"];
_uid = _this # 0;

if !([_uid] call Shadec_fnc_saveStorage) exitWith {diag_log format["fnc_deleteStorage | Error [%1]: Trying to delete Storage that unaccessible", _uid]};

_pStorage = missionNamespace getVariable (format ["pStorage_%1", _uid]);
clearWeaponCargoGlobal _pStorage;
clearMagazineCargoGlobal _pStorage;
clearItemCargoGlobal _pStorage;
deleteVehicle _pStorage;

missionNamespace setVariable [format["pStorage_%1", _uid], nil];

//return
true