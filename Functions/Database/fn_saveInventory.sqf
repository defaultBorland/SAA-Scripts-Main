//local exec only
params ["_unit", "_uid"];

if (_unit getVariable ["SAA_isZeus", false]) exitWith {diag_log "This is Zeus, abort saving."; false};
if !(missionNamespace getVariable (format["loadoutLoaded_%1", _uid])) exitWith {};
if ((_unit getVariable ["SAA_Rank", "PV1"]) isEqualTo "GUEST") exitWith {};

private _inventory = getUnitLoadout _unit;

// Saving Inventory to local profile to show in ShopMission
profileNamespace setVariable ["SAA_Project_Inventory", _inventory];

private _data = [_uid, _inventory];

[["saveInventory", _data], Shadec_fnc_call_db] remoteExec ["spawn", 2];