params ["_endType"];

["Mission ending started...", "Info"] call Shadec_fnc_createLogServer;

{
	//[_x, getPlayerUID _x, name _x] call Shadec_fnc_savePlayer;
	//[getPlayerUID _x] call Shadec_fnc_saveStorage;

	[[_forEachIndex], {	
		params["_forEachI"];
		if (player getVariable ["SAA_isZeus", false]) exitWith {}; // Disable for zeus
		if (dialog) then {closeDialog 602; true};
		[player, getPlayerUID player, name player] call Shadec_fnc_savePlayer; //
		[getPlayerUID player] call Shadec_fnc_saveStorage; //
		profileNamespace setVariable ["SAA_Project_Inventory", getUnitLoadout player]; // Saving Inventory to local profile to show in ShopMission
		
		[[_forEachI, name player],{
			params["_index", "_name"];
			[format["%1. %2 was saved...", _index, _name]] call Shadec_fnc_createLogServer;
		}] remoteExec ["call", 2];
	}] remoteExec ["call", _x];

} forEach allPlayers;

["Mission ended.", "Info"] call Shadec_fnc_createLogServer;

_endType call BIS_fnc_endMissionServer;