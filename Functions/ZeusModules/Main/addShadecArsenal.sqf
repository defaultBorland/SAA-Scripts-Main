//

["[SAA] Main", "Add Shadec Arsenal",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	private _arsenalTypes = ["Uniform", "w/Weapons"];
	private _uniformTypes = ["Arid", "Semiarid", "Forest", "Winter", "Spec-Ops", "All of above"];

	private _selectedObjects = if (isNull _objectUnderCursor) then
	{
		["Objects"] call Achilles_fnc_SelectUnits;
	}
	else
	{
		[_objectUnderCursor];
	};

	private _dialogResult =
	[
		"Add Shadec Uniform/Arsenal",
		[
			["Arsenal Type", _arsenalTypes, 0],
			["Uniform Type", _uniformTypes, 0],
			["Clear object inventory", ["No", "Yes"], 1],
			["Show info to players", ["No", "Yes"], 1]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_arsenalTypeEnum", "_uniformTypeEnum", "_clearObject", "_additionalInfo"];

	// If the selection was canceled, exit the script to prevent any issues and errors.
	if (isNil "_selectedObjects") exitWith {};

	// If the selection is empty, also exit, but with a message.
	if (_selectedObjects isEqualTo []) exitWith 
	{
		["No object was selected!"] call Achilles_fnc_showZeusErrorMessage;
	};
	[[_selectedObjects # 0, _arsenalTypes # _arsenalTypeEnum, _uniformTypes # _uniformTypeEnum, _clearObject, _additionalInfo], Shadec_fnc_addShadecArsenal] remoteExec ["call", 2];
	["Arsenal added"] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;