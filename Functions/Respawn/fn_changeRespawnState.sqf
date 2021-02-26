params ["_side", "_state"];

if (_state isEqualTo "Disable") then {
	missionNamespace setVariable [format["%1_disableStateTickets", toUpper str _side], [_side, 0] call BIS_fnc_respawnTickets];
	[_side, -999] call BIS_fnc_respawnTickets;
	[format["> Server: Respawn for side %1 were disabled!", toUpper str _side]] remoteExec ["systemChat", -2];
} else {
	_tickets = missionNamespace getVariable [format["%1_disableStateTickets", toUpper str _side], [_side, 0] call BIS_fnc_respawnTickets];
	[_side, -999] call BIS_fnc_respawnTickets;
	[_side, _tickets] call BIS_fnc_respawnTickets;
	
	{
		{
			private _time = missionNamespace getVariable ["respawnTime", 0];
			if ((playerRespawnTime < 999) and (playerRespawnTime > 0)) then {
				setPlayerRespawnTime _time;
			};
		} remoteExec ["call", _x];
	} forEach allPlayers;
};

//return
true