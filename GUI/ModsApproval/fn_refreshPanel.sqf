//
params ["_display", "_list"];
disableSerialization;
forceUnicode 0;

private _playersListNBoxCtrl = _display displayCtrl 5450016;
private _playersCounterTextCtrl = _display displayCtrl 5450014;

private _modsSelectorCombo = _display displayCtrl 5450022;
private _curSelIndex = lbCurSel _modsSelectorCombo;

private _playersWithMods = switch (_modsSelectorCombo lbData _curSelIndex) do {
	case "AllMods": { // All mods
		missionNamespace getVariable ["SAA_AllMods", []]
	};
	default { // Suspicious only
		missionNamespace getVariable ["SAA_AllSuspiciousMods", []]
	};
};

private _players = _playersWithMods apply {_x # 0};
private _mods = _playersWithMods apply {_x # 1};

switch (toLower _list) do {
	case "left": {
		
		lnbClear _playersListNBoxCtrl;
		{
			private _row = _playersListNBoxCtrl lnbAddRow [_x # 1, str count (_mods # _forEachIndex)];
			_playersListNBoxCtrl lnbSetData [[_row, 0], _x # 0];
			_playersListNBoxCtrl lnbSetTooltip [[_row, 0], _x # 0];
		} forEach _players;

		_playersCounterTextCtrl ctrlSetText str ((lnbSize _playersListNBoxCtrl) # 0);

		// Update right panel?
	};
	
	case "right": {

		private _modsListNBoxCtrl = _display displayCtrl 5450029;
		private _modsCounterTextCtrl = _display displayCtrl 5450027;

		lnbClear _modsListNBoxCtrl;

		private _selectedPlayerRow = lbCurSel _playersListNBoxCtrl;
		if (_selectedPlayerRow < 0) exitWith {};

		private _selectedPlayerUID = _playersListNBoxCtrl lnbData [_selectedPlayerRow, 0];
		private _playerIndex = _players findIf {(_x # 0)isEqualTo _selectedPlayerUID};
		if (_playerIndex < 0) exitWith {};

		private _playerMods = _mods # _playerIndex;
		{
			private _row = _modsListNBoxCtrl lnbAddRow [_x # 0, _x # 1, ""];
			_modsListNBoxCtrl lnbSetData [[_row, 0], _x # 0];
			_modsListNBoxCtrl lnbSetData [[_row, 1], _x # 1];
			_modsListNBoxCtrl lnbSetData [[_row, 2], _x # 2];
		} forEach _playerMods;

		private _whitelistModButton = _display displayCtrl 5450023;
		private _blacklistModButton = _display displayCtrl 5450025;
		private _workshopModButton = _display displayCtrl 5450024;
		{
			_x ctrlEnable false
		} forEach [_whitelistModButton, _blacklistModButton, _workshopModButton];

		_modsCounterTextCtrl ctrlSetText str ((lnbSize _modsListNBoxCtrl) # 0);

	};

	case "buttons": {
		private _whitelistModButton = _display displayCtrl 5450023;
		private _blacklistModButton = _display displayCtrl 5450025;
		private _workshopModButton = _display displayCtrl 5450024;

		private _modsListNBoxCtrl = _display displayCtrl 5450029;
		private _lbCurSel = lbCurSel _modsListNBoxCtrl;

		if (_lbCurSel < 0) exitWith {
			_workshopModButton ctrlSetURL "";
			_workshopModButton ctrlSetTooltip "";
			_workshopModButton ctrlEnable false;
			_whitelistModButton ctrlEnable false;
			_blacklistModButton ctrlEnable false;
		};

		_whitelistModButton ctrlEnable true;
		_blacklistModButton ctrlEnable true;

		private _modWorkshopId = _modsListNBoxCtrl lnbData [_lbCurSel, 1];
		if (_modWorkshopId isEqualTo "0") exitWith {
			_workshopModButton ctrlSetTooltip "";
			_workshopModButton ctrlSetURL "";
			_workshopModButton ctrlEnable false;
		};

		private _url = "https://steamcommunity.com/sharedfiles/filedetails/?id=" + _modWorkshopId;
		_workshopModButton ctrlSetURL _url;
		_workshopModButton ctrlEnable true;
	};
};