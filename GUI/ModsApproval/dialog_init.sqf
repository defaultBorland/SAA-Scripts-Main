//
params ["_display"];
disableSerialization;
forceUnicode 0;

// Mods Types Combo
private _modsTypeSelectorCombo = _display displayCtrl 5450022;
private _row = _modsTypeSelectorCombo lbAdd (localize "STR_SAA_MAM_SUSPICIOUS_MODS");
_modsTypeSelectorCombo lbSetData [_row, "SusOnly"];
_row = _modsTypeSelectorCombo lbAdd (localize "STR_SAA_MAM_ALL_MODS");
_modsTypeSelectorCombo lbSetData [_row, "AllMods"];
_modsTypeSelectorCombo lbSetCurSel 0;

// LEFT PANEL

[_display, "Left"] call Shadec_fnc_refreshPanelMA;

private _refreshListButton = _display displayCtrl 5450012;
// Change group name on button click
_refreshListButton ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	
	private _display = ctrlParent _control;
	[_display, "Left"] call Shadec_fnc_refreshPanelMA;
	[_display, "Right"] call Shadec_fnc_refreshPanelMA;
}];

private _playersListNBoxCtrl = _display displayCtrl 5450016;
_playersListNBoxCtrl ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];

	private _display = ctrlParent _control;
	[_display, "Right"] call Shadec_fnc_refreshPanelMA;
}];


// RIGHT PANEL
[_display, "Right"] call Shadec_fnc_refreshPanelMA;

// Update left and right lists on changing group in selector
_modsTypeSelectorCombo ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel"];
	[ctrlParent _control, "Left"] call Shadec_fnc_refreshPanelMA;
	[ctrlParent _control, "Right"] call Shadec_fnc_refreshPanelMA;
	[ctrlParent _control, "Buttons"] call Shadec_fnc_refreshPanelMA;
}];

private _modsListNBoxCtrl = _display displayCtrl 5450029;
_modsListNBoxCtrl ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];
	[ctrlParent _control, "Buttons"] call Shadec_fnc_refreshPanelMA;
}];


// Add mod to whitelist and refresh lists
private _whitelistModButton = _display displayCtrl 5450023;
_whitelistModButton ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	[ctrlParent _control] call Shadec_fnc_MA_addModToWhitelisted;
	[ctrlParent _control, "Left"] call Shadec_fnc_refreshPanelMA;
	[ctrlParent _control, "Buttons"] call Shadec_fnc_refreshPanelMA;
}];

// Add mod to blacklist and refresh lists
private _blacklistModButton = _display displayCtrl 5450025;
_blacklistModButton ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	[ctrlParent _control] call Shadec_fnc_MA_addModToBlacklisted;
	[ctrlParent _control, "Left"] call Shadec_fnc_refreshPanelMA;
	[ctrlParent _control, "Buttons"] call Shadec_fnc_refreshPanelMA;
}];

//
private _workshopModButton = _display displayCtrl 5450024;
_workshopModButton ctrlSetURLOverlayMode 1;

// Close button
private _closeButtonCtrl = _display displayCtrl 5450100;
_closeButtonCtrl ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];

	private _display = ctrlParent _control;
	_display closeDisplay 1;
}];


// GENERAL EVENT HANDLERS

// Register EH to handle groups changes while dialog is open
private _EH_RefreshPanel_ID = ["SAA_MA_RefreshPanel", {
	_thisArgs params ["_display"]; // Passed on EH creating
	_this params ["_eventType", "_relevantInfo"]; // Passed on EH raising

	switch (_eventType) do {
		case "PlayerConnected": {
			// Update left list and players mods counters
			[_display, "Left"] call Shadec_fnc_refreshPanelMA;

			// If i watch connected player mods - update
			private _playersListNBoxCtrl = _display displayCtrl 5450016;
			private _selectedPlayer = _playersListNBoxCtrl lnbText [lbCurSel _playersListNBoxCtrl, 0]; 
			if (_relevantInfo isEqualTo _selectedPlayer) then {
				[_display, "Right"] call Shadec_fnc_refreshPanelMA;
				[_display, "Buttons"] call Shadec_fnc_refreshPanelMA;
			};
		};
		case "ModBlacklisted";
		case "ModWhitelisted": {
			// Check. If blacklisted in right list - update buttons, update left (update if sus only)
			private _modsTypeSelectorCombo = _display displayCtrl 5450022;
			private _mode = _modsTypeSelectorCombo lbData (lbCurSel _modsTypeSelectorCombo);
			if (_mode isEqualTo "SusOnly") then {
				// Update left list and players mods counters
				[_display, "Left"] call Shadec_fnc_refreshPanelMA;

				private _modsListNBoxCtrl = _display displayCtrl 5450029;
				private _listValues = flatten ([_modsListNBoxCtrl] call Shadec_fnc_getComboListRows);
				if (_relevantInfo in _listValues) then {
					[_display, "Right"] call Shadec_fnc_refreshPanelMA;
					[_display, "Buttons"] call Shadec_fnc_refreshPanelMA;
				};
			};
		};
	};
}, [_display]] call CBA_fnc_addEventHandlerArgs;

// Store EH on display
_display setVariable ["SAA_MA_ResfreshList_EH", _EH_RefreshPanel_ID];

// Remove EH when Interface is closed (-> no updates)
_display displayAddEventHandler ["Unload", {
	params ["_display", "_exitCode"];

	private _EH_RefreshPanel_ID = _display getVariable ["SAA_MA_ResfreshList_EH", 0];
	["SAA_MA_RefreshPanel", _EH_RefreshPanel_ID] call CBA_fnc_removeEventHandler;
}];