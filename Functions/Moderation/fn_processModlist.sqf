// Server-side exec only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

params ["_unit", "_modlist"];

([_modlist] call Shadec_fnc_checkRestrictedMods) params ["_clientMods", "_restrictedMods", "_suspiciousMods"];
private _uid = getPlayerUID _unit;


if (_uid isEqualTo "76561198066438612") exitWith {[_clientMods, _suspiciousMods, _restrictedMods]};

if (
	!(_unit getVariable ["SAA_isZeus", false]) 
	&& (
		_restrictedMods isNotEqualTo []
		|| _suspiciousMods isNotEqualTo []
	)
) then { 
	[_unit, _suspiciousMods, _restrictedMods] call Shadec_fnc_initPenalty;

	if (_suspiciousMods isEqualTo []) exitWith {};

	// If player exist in sus mods - add new sus mods
	private _allSuspiciousMods = missionNamespace getVariable ["SAA_AllSuspiciousMods", []];
	private _index = _allSuspiciousMods findIf {(_x # 0 # 0) isEqualTo _uid};
	if (_index > -1) then {
		private _oldSuspiciousMods = _allSuspiciousMods # _index # 1;
		private _newSuspiciousMods = _suspiciousMods - _oldSuspiciousMods;
		if (_newSuspiciousMods isNotEqualTo []) then {
			_allSuspiciousMods set [_index, [[_uid, name _unit], _oldSuspiciousMods + _newSuspiciousMods]]
		};
		missionNamespace setVariable["SAA_AllSuspiciousMods", _allSuspiciousMods, true];
	} else {
		missionNamespace setVariable["SAA_AllSuspiciousMods", _allSuspiciousMods + [[[_uid, name _unit], _suspiciousMods]], true];
	};
};

// If player exist in all mods - replace
private _allMods = missionNamespace getVariable ["SAA_AllMods", []];
private _index = _allMods findIf {(_x # 0 # 0) isEqualTo _uid};
if (_index > -1) then {
	_allMods deleteAt _index;
};
_allMods insert [_index, [[[_uid, name _unit], _clientMods]]];
missionNamespace setVariable ["SAA_AllMods", _allMods, true];


// EH sent message
["SAA_MA_RefreshPanel", ["PlayerConnected", name _unit]] call CBA_fnc_globalEvent;

// return
[_clientMods, _suspiciousMods, _restrictedMods]