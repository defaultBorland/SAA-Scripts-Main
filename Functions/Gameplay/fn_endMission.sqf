params ["_endType"];

["Mission ending started...", "Info"] call Shadec_fnc_createLogServer;

{
	[[_forEachIndex], {	
		params["_forEachI"];

		[getPlayerUID player] call Shadec_fnc_updateConnectionRecord;

		if (player getVariable ["SAA_isZeus", false]) exitWith {};
		
		if (dialog) then {closeDialog 602; true};
		[player] call Shadec_fnc_savePlayer;
		
		[[_forEachI, name player],{
			params["_index", "_name"];
			[format["%1. %2 was saved...", _index, _name]] call Shadec_fnc_createLogServer;
		}] remoteExec ["call", 2];
	}] remoteExec ["call", _x];

} forEach allPlayers;

[] call Shadec_fnc_endMissionDB;

["Mission ended.", "Info"] call Shadec_fnc_createLogServer;

_endType call BIS_fnc_endMissionServer;