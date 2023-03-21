//
params ["_display", "_list"];
disableSerialization;
forceUnicode 0;

switch (toLower _list) do {
	case "left": {
		private _leftCmdListNBoxCtrl = _display displayCtrl 5440016;
		private _leftListNBoxCtrl = _display displayCtrl 5440012;
		private _leftCounterTextCtrl = _display displayCtrl 5440019;
		private _groupSelectorCombo = _display displayCtrl 5440011;

		private _groups = [] call Shadec_fnc_getGroups;
		_groups = _groups - [groupId group player];
		
		if (_groups isEqualTo []) exitWith {
			lbClear _groupSelectorCombo;
			_groupSelectorCombo ctrlEnable false;

			lnbClear _leftCmdListNBoxCtrl;
			lnbClear _leftListNBoxCtrl;
			_leftCounterTextCtrl ctrlSetText "";
		};
		if !(ctrlEnabled _groupSelectorCombo) then {_groupSelectorCombo ctrlEnable true};

		// Adding new groups to list
		private _comboValues = [_groupSelectorCombo] call Shadec_fnc_getComboListRows;
		{
			_groupSelectorCombo lbAdd _x;
		} forEach (_groups select {!(_x in _comboValues)}); // Add all groups that not in list

		// Removing old groups from list
		for "_index" from 0 to lbSize _groupSelectorCombo do {
			private _element = _groupSelectorCombo lbText _index;
			if (!(_element in _groups)) then {
				private _curSelIndex = lbCurSel _groupSelectorCombo;
				private _curSelText = _groupSelectorCombo lbText _curSelIndex;
				
				private _comboValues = [_groupSelectorCombo] call Shadec_fnc_getComboListRows;
				private _elementIndex = _comboValues find _element;

				_groupSelectorCombo lbDelete _elementIndex;
				if (_curSelText isEqualTo _element) then {
					private _newSelIndex = [-1, 0] select ((lbSize _groupSelectorCombo) > 0);
					_groupSelectorCombo lbSetCurSel _newSelIndex;
				};
			};
		};

		// Clear current table anyway
		lnbClear _leftCmdListNBoxCtrl;
		lnbClear _leftListNBoxCtrl;
		_leftCounterTextCtrl ctrlSetText "";

		// Check if some group selected
		private _curSelIndex = lbCurSel _groupSelectorCombo;
		if (_curSelIndex < 0) exitWith {};

		private _selectedGroup = _groupSelectorCombo lbText _curSelIndex;
		private _players = [side player] call Shadec_fnc_getPlayers;
		_players = _players select {(groupId group _x) isEqualTo _selectedGroup};

		if (count _players < 1) exitWith {};

		private _leader = leader group (_players # 0);
		_players = _players - [_leader];

		_players = _players apply {[
			name _x,
			_x getVariable ["SAA_Rank", "PV1"],
			_x getVariable ["SAA_PrimaryClass", "Rifleman"],
			_x getVariable ["SAA_SecondaryClass", "None"]
		]};

		_leader = [
			name _leader,
			_leader getVariable ["SAA_Rank", "PV1"],
			_leader getVariable ["SAA_PrimaryClass", "Rifleman"],
			_leader getVariable ["SAA_SecondaryClass", "None"]
		];

		[_leftCmdListNBoxCtrl, [_leader], true] call Shadec_fnc_fillGroupListNBox;

		_players = [_players, 1] call Shadec_fnc_sortByRank;
		[_leftListNBoxCtrl, _players] call Shadec_fnc_fillGroupListNBox;
		
		_leftCounterTextCtrl ctrlSetText str (((lnbSize _leftListNBoxCtrl) # 0) + 1);
	};
	case "middle": {
		private _middleCmdListNBoxCtrl = _display displayCtrl 5440026;
		private _middleListNBoxCtrl = _display displayCtrl 5440023;
		private _middleCounterTextCtrl = _display displayCtrl 5440029;

		// Clear current table anyway
		lnbClear _middleCmdListNBoxCtrl;
		lnbClear _middleListNBoxCtrl;
		_middleCounterTextCtrl ctrlSetText "";

		private _players = [side player] call Shadec_fnc_getPlayers;
		 _players = _players select {(groupId group _x) isEqualTo (groupId group player)};

		if (count _players < 1) exitWith {};

		private _leader = leader group player;
		_players = _players - [_leader];

		_players = _players apply {[
			name _x,
			_x getVariable ["SAA_Rank", "PV1"],
			_x getVariable ["SAA_PrimaryClass", "Rifleman"],
			_x getVariable ["SAA_SecondaryClass", "None"]
		]};

		_leader = [
			name _leader,
			_leader getVariable ["SAA_Rank", "PV1"],
			_leader getVariable ["SAA_PrimaryClass", "Rifleman"],
			_leader getVariable ["SAA_SecondaryClass", "None"]
		];

		[_middleCmdListNBoxCtrl, [_leader], true] call Shadec_fnc_fillGroupListNBox;

		_players = [_players, 1] call Shadec_fnc_sortByRank;
		[_middleListNBoxCtrl, _players] call Shadec_fnc_fillGroupListNBox;

		_middleCounterTextCtrl ctrlSetText str (((lnbSize _middleListNBoxCtrl) # 0) + 1);
	};
	case "right": {
		private _rightListNBoxCtrl = _display displayCtrl 5440034;
		private _rightCounterTextCtrl = _display displayCtrl 5440039;
		private _classSelectorCombo = _display displayCtrl 5440032;

		private _players = [side player] call Shadec_fnc_getPlayers;
		private _groups = [] call Shadec_fnc_getGroups;
		_players = _players select {!((groupId group _x) in _groups)};
		_players = _players - [player];

		if (count _players < 1) exitWith {
			lnbClear _rightListNBoxCtrl;
			_rightCounterTextCtrl ctrlSetText "";
		};

		_players = _players apply {[
			name _x,
			_x getVariable ["SAA_Rank", "PV1"],
			_x getVariable ["SAA_PrimaryClass", "Rifleman"],
			_x getVariable ["SAA_SecondaryClass", "None"]
		]};

		private _classFilter = _classSelectorCombo lbData (lbCurSel _classSelectorCombo);
		private _prevFilter = _classSelectorCombo getVariable ["SAA_prevValue", ""];
		if (_classFilter isNotEqualTo _prevFilter) then {
			lnbClear _rightListNBoxCtrl;
			_rightCounterTextCtrl ctrlSetText "";
		};
		_classSelectorCombo setVariable ["SAA_prevValue", _classFilter];

		if (_classFilter isNotEqualTo "None") then {
			_players = _players select {(_x # 2) isEqualTo _classFilter || (_x # 3) isEqualTo _classFilter};
		};

		if (count _players < 1) exitWith {
			lnbClear _rightListNBoxCtrl;
			_rightCounterTextCtrl ctrlSetText "";
		};

		_players = [_players, 1, true] call Shadec_fnc_sortByRank;

		fnc_getEmptySlot = {
			params ["_listNBox"];

			private _return = -1;
			private _rows = (lnbSize _listNBox) # 0;
			if (_rows < 1) exitWith {_return};

			for "_index" from 0 to _rows - 1 do {
				if ((_listNBox lnbText [_index, 2]) isEqualTo "") exitWith {
					_return = _index;
				}
			};

			_return
		};

		private _playersNames = _players apply {_x # 0};

		for "_index" from 0 to ((lnbSize _rightListNBoxCtrl) # 0) - 1 do {
			private _name = _rightListNBoxCtrl lnbText [_index, 2];
			if (!(_name in _playersNames)) then {
				[_rightListNBoxCtrl, _index] call Shadec_fnc_nulifyListNBoxRow;
			};
		};

		private _curList = [_rightListNBoxCtrl] call Shadec_fnc_getComboListRows;
		_curList = flatten (_curList apply {_x # 2});
		_players = _players select {!((_x # 0) in _curList)};

		{
			private _index = [_rightListNBoxCtrl] call fnc_getEmptySlot;
			if (_index < 0) exitWith {
				_playes = _players select [_forEachIndex, count _players - _forEachIndex];
				[_rightListNBoxCtrl, _players] call Shadec_fnc_fillGroupListNBox;
			};
			
			_rightListNBoxCtrl lnbSetText [[_index, 1], _x # 1];
			_rightListNBoxCtrl lnbSetText [[_index, 2], _x # 0];
			_rightListNBoxCtrl lnbSetPicture [[_index, 3], "img\Classes\" + _x # 2 + ".paa"];
			_rightListNBoxCtrl lnbSetPicture [[_index, 4], "img\Classes\" + _x # 3 + ".paa"];
			_rightListNBoxCtrl lnbSetData [[_index, 3], _x # 2];
			_rightListNBoxCtrl lnbSetData [[_index, 4], _x # 3];

			private _class1 = localize ([_x # 2, "LS"] call Shadec_fnc_classSwitcher);
			private _class2 = localize ([_x # 3, "LS"] call Shadec_fnc_classSwitcher);

			_rightListNBoxCtrl lnbSetTooltip [[_index, 3], 
				_class1 + ([" / " + _class2, ""] select ((_x # 3) isEqualTo "None"))];

		} forEach _players;

		private _noGroupPlayers = [_rightListNBoxCtrl] call Shadec_fnc_getComboListRows;
		_noGroupPlayers = _noGroupPlayers apply {_x # 2};
		_noGroupPlayers = _noGroupPlayers - [""];
		_rightCounterTextCtrl ctrlSetText str (count _noGroupPlayers);

		// Shadec_fnc_fillGroupListNBox -> Shadec_fnc_listNBox_addRow
		// Переделать на работу по строкам
		// Унифицировать?
	};
};