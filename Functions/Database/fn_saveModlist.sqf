// FNC EXEC LOCALLY
params [];

_uid = getPlayerUID player;

if !(hasInterface) exitWith {"fnc_saveModlist: Player only local function"};

private _isRestrictedModsFounded = false;
private _foundedRestrictedMods = [];

private _serverModlist = missionNamespace getVariable ["ServerMods", []];
private _clientModlist = [] call Shadec_fnc_getModList;

// Check only client differ to server mods
_clientModlist = _clientModlist - (_serverModlist arrayIntersect _clientModlist);

if !((player getVariable ["SAA_isZeus", false]) or {_uid isEqualTo "76561198066438612"}) then {

	private _allowedMods = ["Larger ACE Nightvision Border", "A3 Thermal Improvement", "Larger ACE Nightvision Border - RHS Compat"] apply {toLower _x};
	private _restrictedKeywords = ["personal","arsenal","remove","stamina","fatigue","casual","scopenvti","vision","thermal","sway","bullet casings","double weapon","scope with goggles","hitmarker","compass bearing & range distance hud", "logic fsm","develop","tool","Assistant", "Double Weapon", "HelpMe"] apply {toLower _x};

	{
		_mod = _x;
		_modName = toLower (_x # 0);
		{
			if ((_x in _modName) and !(_modName in _allowedMods)) exitWith {
				_isRestrictedModsFounded = true;
				_foundedRestrictedMods pushBack (format["%1/%2", _mod # 0, _mod # 1]);
			};
		} forEach _restrictedKeywords;

		private _equalToServerModName = _serverModlist findIf {(_mod # 0) isEqualTo (_x # 0)};
		private _equalToServerModID = [_serverModlist findIf {(_mod # 1) isEqualTo (_x # 1)}, -1] select ((_mod # 1) isEqualTo "0");

		if ((_equalToServerModName > -1) || (_equalToServerModID > -1)) then {
			_isRestrictedModsFounded = true;
			_foundedRestrictedMods pushBack (format["%1/%2 - %3", _mod # 0, _mod # 1, "Corrupted"]);
		};

	} forEach _clientModlist;

	if (_isRestrictedModsFounded) then {
		[[name player], {systemChat format["> Server: Warning! %1 modlist contain suspicious or restricted mod(s):", _this # 0]}] remoteExec ["call"];
		[[(name player) + " sus/restr mods:"], {"debug_console" callExtension ((_this # 0) + "#1001")}] remoteExec ["call", 2];
		{
			[[_x],{systemChat format["%1", _this # 0]}] remoteExec ["call"];
			[[_x],{"debug_console" callExtension ((_this # 0) + "#1000")}] remoteExec ["call", 2];
		} forEach _foundedRestrictedMods;

		[[name player], {diag_log format["WARNING! Possibly restricted mods on player %1!", _this # 0]}] remoteExec ["spawn", 2];
	};
};

_clientModlist = _clientModlist apply {format["%1/%2/%3", _x # 0, _x # 1, _x # 2]};
_clientModlist = [format["%1 | %2 | CLIENTMODS = %3 | SUSPICIOUS = %4", ["SAFE","WARN"] select _isRestrictedModsFounded, count _clientModlist, _clientModlist joinString ", ", _foundedRestrictedMods joinString ", "]];

_data = [_clientModlist, _uid];
diag_log format["SAVE PLAYER MODLIST:%1", _data];

[["saveModlist",_data], Shadec_fnc_call_db] remoteExec ["spawn", 2];