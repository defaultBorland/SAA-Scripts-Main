params ["_objectStorage"];

_playersIDs = ["All", "UID"] call Shadec_fnc_usersIDs;
if (_playersIDs isEqualTo []) exitWith {diag_log format ["[INFO] There are none non-Zeus players. [INFO]"]};
{
	if ((isNil {missionNamespace getVariable (format["pStorage_%1", _x])}) or ((missionNamespace getVariable (format["pStorage_%1", _x]) isEqualTo objNull))) then {diag_log format["!Warning! [%1]: Trying to delete Storage that unaccessible", _x]}
	else {[_x] spawn Shadec_fnc_deleteStorage};
} forEach _playersIDs;

_playersIDs = ["All", "ID"] call Shadec_fnc_usersIDs;
{
	{removeAllActions (missionNamespace getVariable "objectStorage")} remoteExec ["call", _x];
	closeDialog 602;
} forEach _playersIDs;
sleep 1;
_objectStorage enableSimulationGlobal true;
_objectStorage lock false;
missionNamespace setVariable ["objectStorage", nil];
_objectStorage = nil;

//return
true