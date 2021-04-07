// On Player Disconnected Handler

//Player disconnected handler with _unit passed
_EH_PlayerDisconnected = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

	_unit = _this select 0;
	_pcid = _this select 1;
	_uid = _this select 2;
	_pname = _this select 3;

	// If player equipment didn't load for some reason - don't save
	if (missionNamespace getVariable [format["loadoutLoaded_%1", _uid], false]) then {
		[_unit, _uid, _pname] spawn Shadec_fnc_savePlayer;
		[_uid] spawn Shadec_fnc_deleteStorage;
		
		if !(alive _unit) then {
			private _isTicketsRemain = [false, true] select (([side _unit, 0] call BIS_fnc_respawnTickets) > 0);
			missionNamespace setVariable [format["KIAonExit_%1", _uid], [true, _isTicketsRemain], true];
		};
	} else {
		diag_log format ["Loadout not loaded, abort player saving: %1", _name];
	};

	missionNamespace setVariable [format["loadoutLoaded_%1", _uid], nil, true];
	false;
}];

//Player disconnected handler with _owner passed
_EH_PlayerDisconnected = addMissionEventHandler ["PlayerDisconnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

	if (count allPlayers - 1 < 1) then {"f5znFms2" serverCommand "#unlock"};
}];