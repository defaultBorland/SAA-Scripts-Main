// Server-side exec only
if (!isDedicated) exitWith {diag_log "fnc_initPenalty | Server only function"};

params ["_modlist"];

// Check only client differ to server mods
private _serverMods = missionNamespace getVariable ["SAA_ServerMods", []];
private _whitelistedMods = [] call Shadec_db_server_fnc_getWhitelistedMods;
private _blacklistedMods = [] call Shadec_db_server_fnc_getBlacklistedMods;


// Remove server mods
private _serverModsIds = _serverMods apply {_x # 1};
private _serverModsHashes = _serverMods apply {_x # 2};
private _serverMods = _modlist select {
	_x params ["_name", "_workshopId", "_hash"];

	_workshopId in _serverModsIds
	&& _workshopId isNotEqualTo 0
	&& _hash in _serverModsHashes
};
_modlist = _modlist - _serverMods;

private _clientMods = + _modlist;


// Remove whitelisted mods
private _whitelistedModsIds = (_whitelistedMods apply {_x # 1}) + (_whitelistedMods select {[_x # 0] call Shadec_fnc_isStringNumberValid} apply {_x # 1});
_whitelistedModsIds = _whitelistedModsIds - ["0"];
private _whitelistedModsHashes = _whitelistedMods apply {_x # 2};
private _whitelistedMods = _modlist select {
	_x params ["_name", "_workshopId", "_hash"];
	
	_workshopId in _whitelistedModsIds
	|| _name in _whitelistedModsIds
	|| _hash in _whitelistedModsHashes
};
_modlist = _modlist - _whitelistedMods;


// Check blacklisted mods
private _blacklistedModsIds = (_blacklistedMods apply {_x # 1}) + (_blacklistedMods select {[_x # 0] call Shadec_fnc_isStringNumberValid} apply {_x # 1});
_blacklistedModsIds = _blacklistedModsIds - ["0"];
private _blacklistedModsNames = _blacklistedMods apply {toLower(_x # 0)};
private _blacklistedModsHashes = _blacklistedMods apply {_x # 2};
private _restrictedMods = _modlist select {
	_x params ["_name", "_workshopId", "_hash"];
	
	_workshopId in _blacklistedModsIds
	|| _name in _blacklistedModsIds
	// || toLower(_name) in _blacklistedModsNames
	|| _hash in _blacklistedModsHashes
};
_modlist = _modlist - _restrictedMods;


// Check suspicious keywords
private _suspiciousKeywords = [
	"spawn", "personal", "arsenal", "remove", "stamina", "fatigue", "casual", "scopenvti", "vision", "thermal", "sway", "recoil", "bullet casings", "double weapon", "scope with goggles", "hitmarker", "compass bearing", "range", "hud", "develop", "tool", "assist", "help", "Cheat"
] apply {toLower _x};
private _suspiciousMods = _modlist select {
	_x params ["_name", "_workshopId", "_hash"];

	if (_workshopId isEqualTo "0") then { true }
	else {
		{
			if (_x in toLower(_name)) exitWith { true };
		} forEach _suspiciousKeywords;
	};

};

// return
[
	_clientMods,
	_restrictedMods,
	_suspiciousMods
]