["[SAA] Main", "Assign Storage",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	
	private _selectedObjects = if (isNull _objectUnderCursor) then
	{
		["Objects"] call Achilles_fnc_SelectUnits;
	}
	else
	{
		[_objectUnderCursor];
	};

	// If the selection was canceled, exit the script to prevent any issues and errors.
	if (isNil "_selectedObjects") exitWith {};
	
	// If the selection is empty, also exit, but with a message.
	if (_selectedObjects isEqualTo []) exitWith 
	{
		["No object was selected!"] call Achilles_fnc_showZeusErrorMessage;
	};

	private _dialogResult =
	[
		"Assign Selected Object as Storage",
		[
			["Show info to players", ["No", "Yes"], 1],
			["Note:", ["Object will be locked and simulation will be disabled."], 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_additionalInfo", "_info"];

	[[_selectedObjects # 0, _additionalInfo], Shadec_fnc_assignStorage] remoteExec ["spawn", 2];
	["Storage Object changed."] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;