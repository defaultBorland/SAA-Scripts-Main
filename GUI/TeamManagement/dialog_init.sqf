//
params ["_display"];
disableSerialization;
forceUnicode 0;

// LEFT PANEL

[_display, "Left"] call Shadec_fnc_refreshPanel;

private _groupSelectorCombo = _display displayCtrl 5440011;
// Try to select previous selected group
private _prevSelGroup = player getVariable ["SAA_UI_TM_AllyGroup", "None"];
private _comboValues = [_groupSelectorCombo] call Shadec_fnc_getComboListRows;
if (_prevSelGroup isNotEqualTo "None" && {_prevSelGroup in _comboValues}) then {
	private _elementIndex = _comboValues find _prevSelGroup;
	if (_elementIndex > 0 && {_elementIndex < lbSize _groupSelectorCombo}) then {
		_groupSelectorCombo lbSetCurSel _elementIndex;
		[_display, "Left"] call Shadec_fnc_refreshPanel;
	};
};

// Update left list on changing group in selector
_groupSelectorCombo ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel"];
	[ctrlParent _control, "Left"] call Shadec_fnc_refreshPanel;
}];


// MIDDLE PANEL

[_display, "Middle"] call Shadec_fnc_refreshPanel;

private _groupNameEditBox = _display displayCtrl 5440021;
// Update group name in the middle
_groupNameEditBox ctrlSetText (groupId group player);
_groupNameEditBox ctrlAddEventHandler ["KeyDown", {
	params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];

	if (!(_key in [28, 156])) exitWith {}; // If pressed key is not enters -> nothing
	
	private _return = [group player, trim ctrlText _displayOrControl] call ace_interaction_fnc_renameGroup;
	if (!_return) then {
		hint parseText format["<t size='1.5' color='#ff0000' align='center' font='PuristaBold'>%1</t>", localize "STR_SAA_GENERAL_ERROR"];
	};
	[{_this ctrlSetText (groupId group player)}, _displayOrControl, 0.1] call CBA_fnc_waitAndExecute;

	true
}];

private _changeGroupNameButton = _display displayCtrl 5440022;
// Change group name on button click
_changeGroupNameButton ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	
	private _display = ctrlParent _control;
	private _groupNameEditBox = _display displayCtrl 5440021;

	private _return = [group player, ctrlText _groupNameEditBox] call ace_interaction_fnc_renameGroup;
	if (!_return) then {
		hint parseText format["<t size='1.5' color='#ff0000' align='center' font='PuristaBold'>%1</t>", localize "STR_SAA_GENERAL_ERROR"];
	};
	[{_this ctrlSetText (groupId group player)}, _groupNameEditBox, 0.1] call CBA_fnc_waitAndExecute;
}];

// Action on ListNBox doubleclick
private _myGroupPlayersListNBoxCtrl = _display displayCtrl 5440023;
_myGroupPlayersListNBoxCtrl ctrlAddEventHandler ["LBDblClick", {
	params ["_control", "_selectedIndex"];

	private _display = ctrlParent _control;
	private _name = _control lnbText [_selectedIndex, 2];

	if (_name isNotEqualTo "") then {
		_unit = [_name] call Shadec_fnc_getPlayer;
		if (_unit isNotEqualTo objNull) then {
			[_unit] joinSilent grpNull;
			[_display, "Middle"] call Shadec_fnc_refreshPanel;
			[_display, "Right"] call Shadec_fnc_refreshPanel;

			[[group player], {
				params ["_group"];

				while {dialog} do {closeDialog 0}; // ?
				[format["<t size='1'>%1</t>", format[localize "STR_SAA_TMM_MESSAGE_YOU_WERE_REMOVED", name leader _group, groupId _group]], -1, -1, 6, 1, 0] spawn BIS_fnc_dynamicText;
			}] remoteExec ["call", _unit];
		};
	};
}];


// RIGHT PANEL

// Class Filter
private _noGroupClassFilterComboCtrl = _display displayCtrl 5440032;
{
	_noGroupClassFilterComboCtrl lbAdd "";
	_noGroupClassFilterComboCtrl lbSetTooltip [_forEachIndex, localize ([_x, "LS"] call Shadec_fnc_classSwitcher)];
	_noGroupClassFilterComboCtrl lbSetData [_forEachIndex, _x];
	_noGroupClassFilterComboCtrl lbSetPicture [_forEachIndex, "img\Classes\" + _x + ".paa"];
} forEach ["None", "Rifleman", "Medic", "Machinegunner", "Grenadier", "Engineer", "AT", "Marksman", "Sniper"];
_noGroupClassFilterComboCtrl lbSetCurSel 0;


[_display, "Right"] call Shadec_fnc_refreshPanel;

// Clear and update list on button click
private _refreshRightListButton = _display displayCtrl 5440033;
_refreshRightListButton ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	
	private _display = ctrlParent _control;
	private _noGroupPlayersListNBoxCtrl = _display displayCtrl 5440034;

	lnbClear _noGroupPlayersListNBoxCtrl;
	[_display, "Right"] call Shadec_fnc_refreshPanel;
}];

// Update right list on changing filter in selector
_noGroupClassFilterComboCtrl ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel"];
	[ctrlParent _control, "Right"] call Shadec_fnc_refreshPanel;
}];

// Action on ListNBox doubleclick
private _noGroupPlayersListNBoxCtrl = _display displayCtrl 5440034;
_noGroupPlayersListNBoxCtrl ctrlAddEventHandler ["LBDblClick", {
	params ["_control", "_selectedIndex"];
	private _display = ctrlParent _control;
	private _name = _control lnbText [_selectedIndex, 2];

	if (_name isNotEqualTo "") then {
		_unit = [_name] call Shadec_fnc_getPlayer;
		if (_unit isNotEqualTo objNull) then {
			[_unit] joinSilent group player;
			[_control, _selectedIndex] call Shadec_fnc_nulifyListNBoxRow;
			[_display, "Middle"] call Shadec_fnc_refreshPanel;

			[[group player], {
				params ["_group"];

				while {dialog} do {closeDialog 0}; // ?
				[format["<t size='1'>%1</t>", format[localize "STR_SAA_TMM_MESSAGE_YOU_WERE_JOINED", name leader _group, groupId _group]], -1, -1, 6, 1, 0] spawn BIS_fnc_dynamicText;
			}] remoteExec ["call", _unit];
		};
	};
}];

// Close button
private _closeButtonCtrl = _display displayCtrl 5440100;
_closeButtonCtrl ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];

	private _display = ctrlParent _control;
	_display closeDisplay 1;
}];

// Disband group button
private _disbandButtonCtrl = _display displayCtrl 5440101;
_disbandButtonCtrl ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];

	private _IsSecondClick = _control getVariable ["SAA_IsSecondClick", false];
	if (!_IsSecondClick) exitWith {
		_control setVariable ["SAA_IsSecondClick", true];
	};
	
	private _display = ctrlParent _control;
	private _group = group player;

	{
		[[groupId _group, name leader _group], {
			params ["_groupName", "_leaderName"];

			while {dialog} do {closeDialog 0}; // ?
			[format["<t size='1'>%1</t>", format[localize "STR_SAA_TMM_MESSAGE_GROUP_DISBANDED", _groupName, _leaderName]], -1, -1, 6, 1, 0] spawn BIS_fnc_dynamicText;
		}] remoteExec ["call", _x];
		[_x] joinSilent grpNull;
	} forEach (units _group - [player]);

	_display closeDisplay 1;
	[player] joinSilent grpNull;
}];

// GENERAL EVENT HANDLERS

// Register EH to handle groups changes while dialog is open
private _EH_RefreshPanel_ID = ["SAA_TM_RefreshPanel", {
	_thisArgs params ["_display"]; // Passed on EH creating
	_this params ["_eventType", "_group", "_relevantInfo"]; // Passed on EH raising

	private _othersGroupSelector = _display displayCtrl 5440011;
	private _groupNameEditBox = _display displayCtrl 5440021;

	switch (_eventType) do {
		case "UnitJoined": {
			// If i was joined to another group
			if (_relevantInfo isEqualTo player) exitWith {
				_display closeDisplay 1;  // To restrict concurrent access to managing same group?
			};

			if (_group isEqualTo group player) exitWith { // If my group
				[_display, "Middle"] call Shadec_fnc_refreshPanel;
			};

			// If other group and it's new (solo player joined)
			if (count units _group isEqualTo 1) exitWith {
				[_display, "Right"] call Shadec_fnc_refreshPanel;
			};

			[_display, "Left"] call Shadec_fnc_refreshPanel;

			// If other group and i watch this group
			// private _watchedGroup = _othersGroupSelector lbText (lbCurSel _othersGroupSelector);
			// if (_watchedGroup isEqualTo (groupId _group)) then { // If i watch this group
			// 	[_display, "Left"] call Shadec_fnc_refreshPanel;
			// };
		};
		case "UnitLeft": {
			// All left units goes to separated group anyway
			[_display, "Right"] call Shadec_fnc_refreshPanel;

			if (_group isEqualTo group player) exitWith { // If left from my group
				[_display, "Middle"] call Shadec_fnc_refreshPanel;
			};
			
			// If left from other group
			private _watchedGroup = _othersGroupSelector lbText (lbCurSel _othersGroupSelector);
			if (_watchedGroup isEqualTo (groupId _group)) then { // If i watch this group
				[_display, "Left"] call Shadec_fnc_refreshPanel;
			};
		};
		case "GroupIdChanged": {
			if (_group isEqualTo group player) exitWith {
				_groupNameEditBox ctrlSetText (groupId group player);
			};

			// If some group on the left (we need to update combo at least)
			[_display, "Left"] call Shadec_fnc_refreshPanel;
			// Check eh params, mb _group will be with old id on trigger?
		};
		case "LeaderChanged": {
			private _watchedGroup = _othersGroupSelector lbText (lbCurSel _othersGroupSelector);
			if (_watchedGroup isEqualTo (groupId _group)) exitWith { // If i watch this group
				[_display, "Left"] call Shadec_fnc_refreshPanel;
			};

			// Leader in my own group changes somehow
			if (_group isEqualTo group player) exitWith {
				[_display, "Middle"] call Shadec_fnc_refreshPanel;
				_display closeDisplay 1; // To restrict concurrent access to managing same group?
			};
		};
	};
}, [_display]] call CBA_fnc_addEventHandlerArgs;

// Store EH on display
_display setVariable ["SAA_TM_ResfreshList_EH", _EH_RefreshPanel_ID];

// Remove EH when Interface is closed (-> no updates)
_display displayAddEventHandler ["Unload", {
	params ["_display", "_exitCode"];

	private _groupSelectorCombo = _display displayCtrl 5440011;
	if (lbSize _groupSelectorCombo > 0 && {lbCurSel _groupSelectorCombo isNotEqualTo ""}) then {
		private _selGroup = _groupSelectorCombo lbText (lbCurSel _groupSelectorCombo);
		player setVariable ["SAA_UI_TM_AllyGroup", _selGroup];
	};

	private _EH_RefreshPanel_ID = _display getVariable ["SAA_TM_ResfreshList_EH", 0];
	["SAA_TM_RefreshPanel", _EH_RefreshPanel_ID] call CBA_fnc_removeEventHandler;
}];