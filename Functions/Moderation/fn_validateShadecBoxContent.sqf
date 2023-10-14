//
params[""];

private _serverSaaBoxAddons = missionNamespace getVariable ["SAA_SaaBoxAddons", []];
private _clientSaaBoxAddons = [] call Shadec_fnc_getShadecBoxAddons;

_serverSaaBoxAddons sort true;
_clientSaaBoxAddons sort true;

_serverSaaBoxAddons = toLower(_serverSaaBoxAddons joinString ", ");
_clientSaaBoxAddons = toLower(_clientSaaBoxAddons joinString ", ");

// private _nameLenght = count (name player);
// ["fnc_validateShadecBoxContent | " + (["Server", _nameLenght, " "] call Shadec_fnc_leftPad) + ": " + _serverSaaBoxAddons, "Debug"] call Shadec_fnc_createLogServer;
// ["fnc_validateShadecBoxContent | " + (name player) + ": " + _clientSaaBoxAddons, "Debug"] call Shadec_fnc_createLogServer;

if (_serverSaaBoxAddons isNotEqualTo _clientSaaBoxAddons) exitWith {false};

true