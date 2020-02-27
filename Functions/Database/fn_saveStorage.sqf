params["_uid"];
_uid = _this # 0;
if (_uid in (missionNamespace getVariable "ZeusArray")) exitWith {};
if !(missionNamespace getVariable (format["loadoutLoaded_%1", _uid])) exitWith {};
if (((missionNamespace getVariable (format["%1_DATA", _uid])) # 0) isEqualTo "RD") exitWith {};

_pStorage = missionNamespace getVariable (format["pStorage_%1", _uid]);
if ((isNil {_pStorage}) or (_pStorage isEqualTo objNull)) exitWith {diag_log format["!Warning! [%1]: Trying to save Storage that unaccessible", _uid]; false};
_weapons = ["Weapons", getWeaponCargo _pStorage] call Shadec_fnc_getCargoCompat;
_magazines = ["Magazines", magazinesAmmoCargo _pStorage] call Shadec_fnc_getCargoCompat;
_items = ["Items", getItemCargo _pStorage] call Shadec_fnc_getCargoCompat;
_data = [_weapons, _magazines, _items];

missionNamespace setVariable [format["storage_%1", _uid], _data];

[["saveStorage", [_uid,_data]], Shadec_fnc_call_db] remoteExec ["spawn", 2];

//return
true