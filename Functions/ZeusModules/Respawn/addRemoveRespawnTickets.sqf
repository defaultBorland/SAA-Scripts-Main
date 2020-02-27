//

["[SAA] Respawn", "Add/Remove Respawn Tickets",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	[["respawnTickets"], Shadec_fnc_getMsgServerVariable] remoteExec ["call", 2];

	private _dialogResult =
	[
		"Add/Remove Respawn Tickets",
		[
			["Change count of tickets for", "", "Positive value = add, negative = remove."],
			["Enable respawn: ", ["No", "Yes"], 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_typedText", "_comboBoxResult"];

	// Check if text is correct value
	_tickets = parseNumber _typedText;
	[[_tickets, _comboBoxResult], Shadec_fnc_changeRespawnTickets] remoteExec ["call", 2];
	[["respawnTickets"], Shadec_fnc_getMsgServerVariable] remoteExec ["call", 2];
}] call Ares_fnc_RegisterCustomModule;