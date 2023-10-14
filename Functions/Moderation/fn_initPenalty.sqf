// Server-side only
params["_unit", "_suspiciousMods", "_restrictedMods"];

if (!isDedicated) exitWith {diag_log "fnc_initPenalty | Server only function"};


//
if (_restrictedMods isNotEqualTo []) then {
	private _text = (_restrictedMods apply {_x # 0}) joinString ", ";

	[[name _unit], {systemChat format["> Server: %1! '%2' %3:", localize "STR_SAA_GENERAL_WARNING", _this # 0, localize "STR_SAA_MESSAGE_RESTRICTED_MODS_FOUND"]}] remoteExec ["call", -2];
	[[_text],{systemChat (_this # 0)}] remoteExec ["call", -2];
	
	[(name _unit) + " has restricted mods:", "Warning"] call Shadec_fnc_createLogServer;
	{
		[format["%1 / %2", _x # 0, _x # 1], "Warning"] call Shadec_fnc_createLogServer;
	} forEach _restrictedMods;

	diag_log format["WARNING! Restricted mods on %1: %2", name _unit, _suspiciousMods apply {_x joinString "/"} joinString ", "];

	[[_text], {
		(_this # 0) call Shadec_fnc_kickRestrictedMods;
	}] remoteExec ["call", _unit];
};


//
if (_suspiciousMods isNotEqualTo []) then {
	private _text = (_suspiciousMods apply {_x # 0}) joinString ", ";
	
	[[name _unit], {systemChat format["> Server: %1! '%2' %3:", localize "STR_SAA_GENERAL_WARNING", _this # 0, localize "STR_SAA_MESSAGE_SUSPICIOUS_MODS_FOUND"]}] remoteExec ["call", -2];
	[[_text],{systemChat (_this # 0)}] remoteExec ["call", -2];
	
	[(name _unit) + " has suspicious mods:", "Warning"] call Shadec_fnc_createLogServer;
	{
		[format["%1 / %2", _x # 0, _x # 1]] call Shadec_fnc_createLogServer;
	} forEach _suspiciousMods;

	diag_log format["WARNING! Suspicious mods on %1: %2", name _unit, _suspiciousMods apply {_x joinString "/"} joinString ", "];
};