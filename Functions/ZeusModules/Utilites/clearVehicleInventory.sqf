//

["[SAA] Utilites", "Clear Object Inventory",
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
		"Clearing Types: ",
		[
			["Weapons", ["No", "Yes"], 1],
			["Magazines", ["No", "Yes"], 1],
			["Items", ["No", "Yes"], 1],
			["Backpacks", ["No", "Yes"], 1]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_comboBox1Result", "_comboBox2Result", "_comboBox3Result", "_comboBox4Result"];

	if ((_selectedObjects # 0) isKindOf "Man") exitWith {["Fuck this shit, I'm out."] call Achilles_fnc_showZeusErrorMessage};

	{
		[[_x, _comboBox1Result, _comboBox2Result, _comboBox3Result, _comboBox4Result], Shadec_fnc_clearVehicleInventory] remoteExec ["call", 2];
	} forEach _selectedObjects;

	["Inventory Cleared"] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;