// On Player Connected Handler

//Player connected handler
_EH_PlayerConnected = addMissionEventHandler ["PlayerConnected", {
	params["_pcid", "_uid", "_name", "_jip", "_owner"];

    // Create connection record if not HC
    if (!("headlessclient" in _name)) then {
		[_uid, _name] call Shadec_db_server_fnc_createConnectionRecord;
	};

}];