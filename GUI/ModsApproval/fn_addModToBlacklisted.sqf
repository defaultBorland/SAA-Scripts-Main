//
params ["_display"];

disableSerialization;

private _modsListNBoxCtrl = _display displayCtrl 5450029;
private _selectedModRow = lbCurSel _modsListNBoxCtrl;

private _modName = _modsListNBoxCtrl lnbData [_selectedModRow, 0];
private _modWorkshopId = _modsListNBoxCtrl lnbData [_selectedModRow, 1];
private _modHash = _modsListNBoxCtrl lnbData [_selectedModRow, 2];
private _initiator = name player;

[[_modName, _modWorkshopId, _modHash, _initiator], {_this call Shadec_db_server_fnc_blacklistMod}] remoteExec ["call", 2];
[[_modName], {systemChat format["> Server: %1: %2", localize "STR_SAA_MESSAGE_MOD_HAS_BEEN_BLACKLISTED", _this # 0]}] remoteExec ["call", -2];
[format["Mod has been blacklisted: %1 / %2", _modName, _modWorkshopId], "Warning"] call Shadec_fnc_createLogServer;

private _suspiciousMods = missionNamespace getVariable["SAA_AllSuspiciousMods", []];
{
	_x params ["_userIds", "_susMods"];

	private _susModsHashes = _susMods apply {_x # 2};
	if !(_modHash in _susModsHashes) then { continue };
	
	private _modIndex = _susMods findIf {(_x # 2) isEqualTo _modHash};
	_susMods deleteAt _modIndex;	
} forEach _suspiciousMods;

_playersWithMods = _suspiciousMods select {
	(_x # 1) isNotEqualTo []
};
missionNamespace setVariable["SAA_AllSuspiciousMods", _playersWithMods, true];

private _allMods = missionNamespace getVariable ["SAA_AllMods", []];
{
	_x params ["_userIds", "_allMods"];

	private _restrictedModsHashes = _allMods apply {_x # 2};
	if !(_modHash in _restrictedModsHashes) then { continue };
	
	_userIds params ["_uid", "_name"];
	if (_uid isEqualTo getText(missionConfigFile >> "adminUID")) then { continue };
	
	private _player = [_uid] call Shadec_fnc_getPlayer;
	if (_player getVariable ["SAA_isZeus", false]) then { continue };

	[[_modName], {
		[_this # 0] call Shadec_fnc_kickRestrictedMods;
	}] remoteExec ["call", _player];
} forEach _allMods;

private _modsTypeSelectorCombo = _display displayCtrl 5450022;
private _mode = _modsTypeSelectorCombo lbData (lbCurSel _modsTypeSelectorCombo);
if (_mode isEqualTo "SusOnly") then {
	_modsListNBoxCtrl lnbDeleteRow _selectedModRow;
};

private _modsCounterTextCtrl = _display displayCtrl 5450027;
_modsCounterTextCtrl ctrlSetText str ((lnbSize _modsListNBoxCtrl) # 0);

// EH sent message
["SAA_MA_RefreshPanel", ["ModBlacklisted", _modName]] call CBA_fnc_globalEvent;