// FNC EXEC LOCALLY
params [];

if (missionNamespace getVariable ["isDebug", false]) exitWith {};

private _uid = getPlayerUID player;

if !(hasInterface) exitWith {"fnc_saveModlist: Player only local function"};

private _isRestrictedModsFounded = false;
private _foundedRestrictedMods = [];
private _lastLoginRestrictedModsFounded = missionNamespace getVariable [format ["%1_lastLoginRestrictedModsFounded", getPlayerUID player], false];

private _serverModlist = missionNamespace getVariable ["ServerMods", []];
private _clientModlist = [] call Shadec_fnc_getModList;

// Check only client differ to server mods
_clientModlist = _clientModlist - (_serverModlist arrayIntersect _clientModlist);

if !((player getVariable ["SAA_isZeus", false]) or {_uid isEqualTo "76561198066438612"}) then {

	private _allowedMods = ["Larger ACE Nightvision Border", "A3 Thermal Improvement", "Larger ACE Nightvision Border - RHS Compat", "Larger ACE Nightvision Border - CUP Compat"] apply {toLower _x};
	private _restrictedKeywords = ["spawn", "personal", "arsenal", "remove", "stamina", "fatigue", "casual", "scopenvti", "vision", "thermal", "sway", "recoil", "bullet casings", "double weapon", "scope with goggles", "hitmarker", "compass bearing & range distance hud", "logic fsm", "develop", "tool", "Assistant", "Double Weapon", "HelpMe", "POLPOX", "Arma 3 Perfomance Extension", "Swap Your Weapons", "Ladder Tweak", "Cheat", "Simple Single Player Cheat Menu", "ZlodziejServMod", "Weapon Slinging"] apply {toLower _x};

	{
		_mod = _x;
		_modName = toLower (_x # 0);
		{
			if ((_x in _modName) and !(_modName in _allowedMods)) exitWith {
				_isRestrictedModsFounded = true;
				_foundedRestrictedMods pushBack (format["%1/%2", _mod # 0, _mod # 1]);
			};
		} forEach _restrictedKeywords;

		// private _equalToServerModName = _serverModlist findIf {(_mod # 0) isEqualTo (_x # 0)};
		private _equalToServerModID = [_serverModlist findIf {(_mod # 1) isEqualTo (_x # 1)}, -1] select ((_mod # 1) isEqualTo "0");

		// if ((_equalToServerModName > -1) || (_equalToServerModID > -1)) then {
		if (_equalToServerModID > -1) then {
			if !((_mod # 2) isEqualTo (_x # 2)) then {
				_isRestrictedModsFounded = true;
				_foundedRestrictedMods pushBack (format["%1/%2 - %3", _mod # 0, _mod # 1, "Modified"]);
			};
		};

	} forEach _clientModlist;

	if (_isRestrictedModsFounded) then {
		[[name player], {systemChat format["> Server: %1! %2 %3:", localize "STR_SAA_GENERAL_WARNING", _this # 0, localize "STR_SAA_MESSAGE_RESTRICTED_MODS_FOUND"]}] remoteExec ["call"];
		[(name player) + " suspicious/restricted mods:", "Warning"] call Shadec_fnc_createLogServer;
		{
			[[_x],{systemChat format["%1", _this # 0]}] remoteExec ["call"];
			[_x, "Warning"] call Shadec_fnc_createLogServer;
		} forEach _foundedRestrictedMods;
		
		missionNamespace setVariable [format ["%1_lastLoginRestrictedModsFounded", getPlayerUID player], true, true];

		[[name player], {diag_log format["WARNING! Possibly restricted mods on player %1!", _this # 0]}] remoteExec ["spawn", 2];
	} else {
		if (_lastLoginRestrictedModsFounded) then {
			[(name player) + " reloged without earlier suspected mods.", "Info"] call Shadec_fnc_createLogServer;
		};
	};
};

_clientModlist = _clientModlist apply {format["%1/%2/%3", _x # 0, _x # 1, _x # 2]};
_clientModlist = [format["%1 | %2 | CLIENTMODS = %3 | SUSPICIOUS = %4", ["SAFE","WARN"] select _isRestrictedModsFounded, count _clientModlist, _clientModlist joinString ", ", _foundedRestrictedMods joinString ", "]];

_data = [_uid, _clientModlist];
diag_log format["SAVE PLAYER MODLIST:%1", _data];

[["saveModlist",_data], Shadec_fnc_call_db] remoteExec ["spawn", 2];