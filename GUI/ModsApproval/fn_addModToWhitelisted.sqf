//
params ["_display"];

disableSerialization;

private _modsListNBoxCtrl = _display displayCtrl 5450029;
private _selectedModRow = lbCurSel _modsListNBoxCtrl;

private _modName = _modsListNBoxCtrl lnbData [_selectedModRow, 0];
private _modWorkshopId = _modsListNBoxCtrl lnbData [_selectedModRow, 1];
private _modHash = _modsListNBoxCtrl lnbData [_selectedModRow, 2];
private _initiator = name player;

[[_modName, _modWorkshopId, _modHash, _initiator], {_this call Shadec_fnc_whitelistMod}] remoteExec ["call", 2];
[[_modName], {systemChat format["> Server: %1: %2", localize "STR_SAA_MESSAGE_MOD_HAS_BEEN_WHITELISTED", _this # 0]}] remoteExec ["call", -2];
[format["Mod has been blacklisted: %1 / %2", _modName, _modWorkshopId], "Info"] call Shadec_fnc_createLogServer;

private _playersWithMods = missionNamespace getVariable["SAA_AllSuspiciousMods", []];
{
	_x params ["_userIds", "_susMods"];

	private _susModsHashes = _susMods apply {_x # 2};
	if !(_modHash in _susModsHashes) then { continue };
	
	private _modIndex = _susMods findIf {(_x # 2) isEqualTo _modHash};
	_susMods deleteAt _modIndex;
} forEach _playersWithMods;

_playersWithMods = _playersWithMods select {
	(_x # 1) isNotEqualTo []
};

missionNamespace setVariable["SAA_AllSuspiciousMods", _playersWithMods, true];

private _modsTypeSelectorCombo = _display displayCtrl 5450022;
private _mode = _modsTypeSelectorCombo lbData (lbCurSel _modsTypeSelectorCombo);
if (_mode isEqualTo "SusOnly") then {
	_modsListNBoxCtrl lnbDeleteRow _selectedModRow;
};

private _modsCounterTextCtrl = _display displayCtrl 5450027;
_modsCounterTextCtrl ctrlSetText str ((lnbSize _modsListNBoxCtrl) # 0);

// EH sent message
["SAA_MA_RefreshPanel", ["ModWhitelisted", _modName]] call CBA_fnc_globalEvent;