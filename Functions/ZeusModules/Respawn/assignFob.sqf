["[SAA] Respawn", "Assign Fob",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	
	_markers = allMapMarkers apply {if (_x find "respawn" > -1) then {_x} else {"NULL"}};
	_markers = _markers - ["NULL"];
	
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
		"Assign Selected Vehicle as Fob",
		[
			["Clear Vehicle Inventory?", ["No", "Yes"], 1],
			["Select marker to attach:", _markers, 0],
			["Add 3 Personal Aid Kits to transport:", ["No", "Yes"], 1],
			["Show vehicle info about FOB to players (include distance and direction):", ["No", "Yes"], 1],
			["Note:", ["Move marker via module to abandon current FOB"], 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_clearVehicle","_markerIndex", "_addPAK", "_additionalInfo"];

	[[_selectedObjects # 0, _clearVehicle, _markers # _markerIndex, _addPAK, _additionalInfo], Shadec_fnc_assignFob] remoteExec ["spawn", 2];
	["FOB assign."] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;