params ["_endType"];

{
	[_x, getPlayerUID _x, name _x] call Shadec_fnc_savePlayer;
	[getPlayerUID _x] call Shadec_fnc_saveStorage;

	{	// Saving Inventory to local profile to show in ShopMission
		if (player getVariable ["SAA_isZeus", false]) exitWith {}; // Disable for zeus
		_inventory = getUnitLoadout player;
		profileNamespace setVariable ["SAA_Project_Inventory", _inventory];
	} remoteExec ["call", _x];

} forEach allPlayers;

["Mission ended.", "Info"] call Shadec_fnc_createLogServer;

_endType call BIS_fnc_endMissionServer;