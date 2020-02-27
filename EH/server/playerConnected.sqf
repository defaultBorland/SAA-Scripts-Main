// On Player Connected Handler

//Player connected handler
_EH_PlayerConnected = addMissionEventHandler ["PlayerConnected", {
	params["_id", "_uid", "_name", "_jip", "_owner"];
    _pcid = _this select 0;
    _uid = _this select 1;
    _pname = _this select 2;

	// Do not add tickets if player is server or Zeus
	if (_pname isEqualTo "__SERVER__" or { _uid in (missionNamespace getVariable "ZeusArray")}) exitWith {};

	// Add ticket for connected player
	if (respawnEnabled) then {respawnTickets = respawnTickets + 1};
	[format["%1 connected | Respawn tickets: %2", _pname, respawnTickets]] remoteExec ["systemChat"];
	missionNamespace setVariable [format["respawnEnabled_%1", _uid], true, true];
}];