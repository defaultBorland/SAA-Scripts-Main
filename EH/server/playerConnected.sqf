// On Player Connected Handler

//Player connected handler
_EH_PlayerConnected = addMissionEventHandler ["PlayerConnected", {
	params["_pcid", "_uid", "_name", "_jip", "_owner"];

    [
        {missionNamespace getVariable [format["loadoutLoaded_%1", _this # 0], false]}, // Wait when players loadout will be loaded
        {[_this # 0] call Shadec_fnc_composeAvailiableItems}, // Generate list with available items for player classes
        [_uid],
        15,
        {}
    ] call CBA_fnc_waitUntilAndExecute;

    // No headless record
    if (!("headlessclient" in _name)) then {
		// Create connection record
		[_uid, _name] call Shadec_fnc_createConnectionRecord;
	};

}];