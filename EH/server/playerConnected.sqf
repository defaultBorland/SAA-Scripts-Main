// On Player Connected Handler

//Player connected handler
_EH_PlayerConnected = addMissionEventHandler ["PlayerConnected", {
	params["_pcid", "_uid", "_name", "_jip", "_owner"];

    // No headless record
    if (!("headlessclient" in _name)) then {
		// Create connection record
		[_uid, _name] call Shadec_fnc_createConnectionRecord;
	};

}];