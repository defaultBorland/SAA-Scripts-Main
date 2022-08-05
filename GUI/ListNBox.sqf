//
disableSerialization;

fnc_resetHeadersTooltips = {
	params [["_exclude", [0]]];
	private _ids = [1011, 1012, 1013, 1014] - _exclude;
	{
		((findDisplay 1000) displayCtrl _x) ctrlSetTooltip localize "STR_SAA_GENERAL_NO_SORTING";
	} forEach _ids;
};

params ["_display"];

private _listNBox = _display displayCtrl 1010;
_listNBox ctrlAddEventHandler ["LBDblClick", {	
	params ["_ctrl", "_row"];
	private _classname = _ctrl lnbText [_row, 4];

	[[_classname, name player], {systemChat format ["%1 highlight item: %2", _this # 1, _this # 0]}] remoteExec ["call", -2];
	[[_classname, name player], {format ["%1 highlight item: %2", _this # 1, _this # 0]}] remoteExec ["call", 2];
}];

private _coloumnHeader1 = _display displayCtrl 1011;
_coloumnHeader1 ctrlSetText localize "STR_SAA_GENERAL_DISPLAYNAME";

private _coloumnHeader2 = _display displayCtrl 1012;
_coloumnHeader2 ctrlSetText localize "STR_SAA_GENERAL_COUNT";

private _coloumnHeader3 = _display displayCtrl 1013;
_coloumnHeader3 ctrlSetText localize "STR_SAA_GENERAL_TYPE";

private _coloumnHeader4 = _display displayCtrl 1014;
_coloumnHeader4 ctrlSetText localize "STR_SAA_GENERAL_CLASSNAME";

{ // ctrl EH for 1-4 coloumn headers
	_x ctrlAddEventHandler ["ButtonDown",	{	
		params ["_ctrl"];

		private _listNBox = (findDisplay 1000) displayCtrl 1010;
		[[ctrlIDC _ctrl]] call fnc_resetHeadersTooltips;

		private _reverse = false;
		if ((ctrlTooltip _ctrl) isEqualTo localize "STR_SAA_GENERAL_ASCENDING") then {
			_reverse = true;
			_ctrl ctrlSetTooltip localize "STR_SAA_GENERAL_DESCENDING";
		} else {
			_reverse = false;
			_ctrl ctrlSetTooltip localize "STR_SAA_GENERAL_ASCENDING";
		};

		private _coloumn = (ctrlIDC _ctrl) % 10;
		if (_coloumn isEqualTo 2) then { // 2nd coloumn needs to be sorted by value (numbers)
			_listNBox lnbSortByValue [(ctrlIDC _ctrl) % 10, _reverse];
		} else {
			_listNBox lnbSort [(ctrlIDC _ctrl) % 10, _reverse];
		};
	}];
} forEach [_coloumnHeader1, _coloumnHeader2, _coloumnHeader3, _coloumnHeader4];


private _buttonHide = _display displayCtrl 1070;
_buttonHide ctrlSetText localize "STR_SAA_GENERAL_HIDE";
_buttonHide ctrlAddEventHandler ["ButtonDown", {	
	params ["_ctrl"];
	closeDialog 0;
}];

// buttonClose defined in action

// buttonHelp defined in action

[] call fnc_resetHeadersTooltips;