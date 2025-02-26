//
params [""];

private _serverSaaBoxAddons = missionNamespace getVariable ["SAA_SaaBoxAddons", []];
if (_serverSaaBoxAddons isEqualTo []) exitWith {true}; // SAABOX does not enabled on server. No checks needed.

private _clientSaaBoxAddons = [] call Shadec_fnc_getShadecBoxAddons;

_serverSaaBoxAddons sort true;
_clientSaaBoxAddons sort true;

private _serverSaaBoxAddonsText = toLower(_serverSaaBoxAddons joinString ", ");
private _clientSaaBoxAddonsText = toLower(_clientSaaBoxAddons joinString ", ");

// private _nameLenght = count (name player);
// ["fnc_validateShadecBoxContent | " + (["Server", _nameLenght, " "] call Shadec_fnc_leftPad) + ": " + _serverSaaBoxAddons, "Debug"] call Shadec_fnc_createLogServer;
// ["fnc_validateShadecBoxContent | " + (name player) + ": " + _clientSaaBoxAddons, "Debug"] call Shadec_fnc_createLogServer;

private _notOnClient = _serverSaaBoxAddons - _clientSaaBoxAddons;
private _potentialProblemModsClient = [];
if (_notOnClient isNotEqualTo []) then {
	_potentialProblemModsClient = _notOnClient apply {[_x] call Shadec_fnc_getModByAddonInfo};
};

if (_serverSaaBoxAddonsText isNotEqualTo _clientSaaBoxAddonsText) exitWith {

	[[player, _serverSaaBoxAddons, _clientSaaBoxAddons, _potentialProblemModsClient], {
		params ["_unit", "_serverSaaBoxAddons", "_clientSaaBoxAddons", "_potentialProblemModsClient"];

		private _notOnClient = _serverSaaBoxAddons - _clientSaaBoxAddons;
		private _notOnServer = _clientSaaBoxAddons - _serverSaaBoxAddons;

		diag_log format ["SAABOX mismatch | Player: %1 (%2)", name _unit, getPlayerUID _unit];
		diag_log format ["SAABOX mismatch | (%2) Server - Client: %1", toLower(_notOnClient joinString ", "), count _serverSaaBoxAddons];
		diag_log format ["SAABOX mismatch | Server - Client, potential client mods causing problems: %1", _potentialProblemModsClient joinString ", "];
		diag_log format ["SAABOX mismatch | (%2) Client - Server: %1", toLower(_notOnServer joinString ", "), count _clientSaaBoxAddons];

		if (_potentialProblemModsClient isNotEqualTo []) then {
			[format["SAABOX Mismatch (Potential Mods on Client) | %1: %2", name _unit, (_potentialProblemModsClient arrayIntersect _potentialProblemModsClient) joinString ", "], "Debug"] call Shadec_fnc_createLogServer;
		};

		private _potentialProblemModsServer = [];
		if (_notOnServer isNotEqualTo []) then {
			_potentialProblemModsServer = _notOnServer apply {[_x] call Shadec_fnc_getModByAddonInfo};
			diag_log format ["SAABOX mismatch | Client - Server, potential server mods causing problems: %1", _potentialProblemModsServer joinString ", "];
			[format["SAABOX Mismatch (Potential Mods on Server) | %1: %2", name _unit, (_potentialProblemModsServer arrayIntersect _potentialProblemModsServer) joinString ", "], "Debug"] call Shadec_fnc_createLogServer;
		};

	}] remoteExec ["call", 2];

	false
};

true