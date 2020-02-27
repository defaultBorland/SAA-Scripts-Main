//

["[SAA] Utilites", "Heal All Players",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	private _dialogResult =
	[
		"Confirmation: ",
		[
			["Heal All Players", ["Yes"], 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_comboBox1Result"];

	{
	//	[player] call ace_medical_treatment_fnc_fullHealLocal
	[objNull, this] call ace_medical_fnc_treatmentAdvanced_fullHeal;
	} remoteExec ["call", -2];

	["All players were healed."] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;