//

["[SAA] Radio Utilites", "Remove Jamming Vehicle",
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
		"Object for Radio Jamming",
		[
			["Remove object from Jammers: ", ["Yes"], 1]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_comboBox"];

	[["Remove",[_selectedObjects # 0]], Shadec_fnc_assignJammer] remoteExec ["spawn", 2];
	["Jamming object removed"] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;