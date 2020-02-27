// Zeus End Mission Module

// End Mission Module in Scenario Flow tab for those zeuses who forghet the rules
[localize "str_ZEUS_MODULES_ENDSCENARIO_TAB", localize "str_ZEUS_MODULES_ENDSCENARIO_TITLE",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	_endTypes = ["Win", "Lose", "To Be Continued", "All Dead"];

	private _dialogResult =
	[
		localize "str_ZEUS_MODULES_ENDSCENARIO_DIALOG_TITLE",
		[
			[localize "str_ZEUS_MODULES_ENDSCENARIO_DIALOG_TYPE", _endTypes, 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_comboBoxResult"];
	[[_endTypes # _comboBoxResult], Shadec_fnc_endMission] remoteExec ["spawn", 2];
}] call Ares_fnc_RegisterCustomModule;

// End Mission Module
["[SAA] Main", "End Mission",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	_endTypes = ["Win", "Lose", "To Be Continued", "All Dead"];

	private _dialogResult =
	[
		"End Mission",
		[
			["Choose End Type:", _endTypes, 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_comboBoxResult"];
	[[_endTypes # _comboBoxResult], Shadec_fnc_endMission] remoteExec ["spawn", 2];
}] call Ares_fnc_RegisterCustomModule;