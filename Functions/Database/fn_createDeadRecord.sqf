params ["_unit"];

if (missionNamespace getVariable ["isDebug", false]) exitWith {};

// Needs to be on client side bc of sync issues
private _inventory = getUnitLoadout _unit;

[[_unit, _inventory], {
	params ["_unit" ,"_inventory"];

	private _uid = getPlayerUID _unit;
	private _name = name _unit;

	private _data = [_uid, _name, _inventory];

	["createDeadRecord", _data] call Shadec_fnc_call_db;
}] remoteExec ["call", 2];