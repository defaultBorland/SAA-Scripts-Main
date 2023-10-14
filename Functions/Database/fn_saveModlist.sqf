// FNC EXEC LOCALLY
params [];

if (missionNamespace getVariable ["isDebug", false]) exitWith {};

private _modlist = [] call Shadec_fnc_getModList;

_data = [player, _modlist];

[["saveModlist", _data], Shadec_fnc_call_db] remoteExec ["spawn", 2];