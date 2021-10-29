if (!hasInterface) exitWith {"FNC: renameGroupDisplay | ERROR: Only local execution is allowed"};

[] spawn {
	private _unit = _this # 0;
	disableSerialization;
	
	_display = (findDisplay 46) createDisplay "RscDisplayEmpty";
	_ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
	_ctrlBackground = _display ctrlCreate ["RscTextMulti", -1, _ctrlGroup];
	IDD_EDIT_BOX = 123;
	_ctrlEdit = _display ctrlCreate ["RscEdit", IDD_EDIT_BOX, _ctrlGroup];
	_ctrlButton = _display ctrlCreate ["RscButtonMenuOK", -1, _ctrlGroup];

	_ctrlGroup ctrlSetPosition [0.5, 0.5, 0, 0];
	_ctrlGroup ctrlCommit 0;

	_ctrlBackground ctrlSetPosition [0, 0, 0.43, 0.12];
	_ctrlBackground ctrlSetBackgroundColor [0, 0, 0, 0.7];
	_ctrlBackground ctrlSetText localize "STR_SAA_GROUPNAMING_TITLE_ENTERNAME";
	_ctrlBackground ctrlEnable false;
	_ctrlBackground ctrlCommit 0;

	_ctrlEdit ctrlSetPosition [0.01, 0.05, 0.33, 0.05];
	_ctrlEdit ctrlSetBackgroundColor [0, 0, 0, 0.5];
	_ctrlEdit ctrlCommit 0;

	_ctrlButton ctrlSetPosition [0.35, 0.05, 0.07, 0.05];
	_ctrlButton ctrlSetBackgroundColor [0, 1, 0, 0.7];
	_ctrlButton ctrlSetActiveColor [1,1,1,1];
	_ctrlButton ctrlCommit 0;
	_ctrlButton ctrlSetText "OK";
	
	_ctrlButton ctrlAddEventHandler ["ButtonClick", {
		params ["_ctrl"];
		_display = ctrlParent _ctrl;
		_text = ctrlText (_display displayCtrl IDD_EDIT_BOX);
		if (_text != "") then {
			private _allGroupsWithPlayers = [];
			{_allGroupsWithPlayers pushBackUnique group _x} forEach allPlayers;
			if (_text in (_allGroupsWithPlayers apply {groupID _x})) exitWith {cutText [localize "STR_SAA_GROUPNAMING_ERROR_GROUPNAME_ALREADY_EXISTS", "PLAIN", 1]};
			(group player) setGroupIdGlobal [trim _text];
		};
		_display closeDisplay 1;
	}];

	ctrlSetFocus _ctrlEdit;

	_ctrlGroup ctrlSetPosition [0.25, 0.25, 0.5, 0.5];
	_ctrlGroup ctrlCommit 0;
};