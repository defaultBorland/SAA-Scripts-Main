//

["[SAA] Respawn", "Respawn Tickets",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	private _dialogResult =
	[
		"Add/Remove Respawn Tickets [SIDE]",
		[
			["Tickets number: ", "", "Positive value = add, negative = remove."],
			["Player:", "SIDE", 1]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_typedText", "_selectedSide"];

	_SIDE = [_selectedSide - 1] call BIS_fnc_sideType;

	// Check if text is correct value
	_tickets = parseNumber _typedText;

	[[_SIDE, _tickets], Shadec_fnc_changeRespawnTickets] remoteExec ["call", 2];

}] call Ares_fnc_RegisterCustomModule;

// [[_tickets, _selectedSide], Shadec_fnc_changeRespawnTickets] remoteExec ["call", 2];