// Function to define and init SAA Zeus modules to players (ZEUSES)

[] execVM "Functions\ZeusModules\Respawn\addRemoveRespawnTickets.sqf";
[] execVM "Functions\ZeusModules\Respawn\forceRespawn.sqf";
[] execVM "Functions\ZeusModules\Respawn\removeRespawnPosition.sqf";
[] execVM "Functions\ZeusModules\Respawn\enableDisableRespawn.sqf";
[] execVM "Functions\ZeusModules\Respawn\changeRespawnTime.sqf"; 
[] execVM "Functions\ZeusModules\Respawn\createRespawnPosition.sqf";
[] execVM "Functions\ZeusModules\Respawn\playersRespawnInfo.sqf";
[] execVM "Functions\ZeusModules\Main\addShadecArsenal.sqf";
// [] execVM "Functions\ZeusModules\Respawn\moveRespawnMarker.sqf";
[] execVM "Functions\ZeusModules\Main\endMission.sqf";
[] execVM "Functions\ZeusModules\Main\assignStorage.sqf";
[] execVM "Functions\ZeusModules\Main\playersList.sqf";
[] execVM "Functions\ZeusModules\Utilites\spawnSoldiers.sqf";
[] execVM "Functions\ZeusModules\Radio\addJammingVehicle.sqf";
[] execVM "Functions\ZeusModules\Radio\removeJammingVehicle.sqf";
[] execVM "Functions\ZeusModules\Radio\changeSignalQuality.sqf";
[] execVM "Functions\ZeusModules\Utilites\clearVehicleInventory.sqf";
[] execVM "Functions\ZeusModules\Utilites\healAllPlayers.sqf";

/*
["Shadec Asgardian Alliance", "My Module",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// We check if there is a object under the cursor or not,
	// If the object under cursor is null (nothing was selected), then prompt the user to select object(s) by calling Achilles_fnc_SelectUnits.
	// But if the module had been placed upon an object, then return that object surounded by brackets (add it to an array). 
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
		"Test Dialog",
		[
			// The last number is optional! If you want the first selection you can remove the number.
			["Combo Box Control", ["Choice 1","Choice 2"], 1],
			["Text Control", "", "default text"],
			["Slider Control", "SLIDER", 1],
			["Side Control", "SIDE", 2]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_comboBoxResult", "_typedText", "_sliderResult", "_side"];

	// Output the data to the chat.
	systemChat format ["Combo Box Result: %1", _comboBoxResult];
	systemChat format ["Typed Text: %1", _typedText];
	systemChat format ["Slider Result: %1", _sliderResult];
	systemChat format ["Selected Side: %1", _side];

	// If the selection was canceled, exit the script to prevent any issues and errors.
	if (isNil "_selectedObjects") exitWith {};

	// If the selection is empty, also exit, but with a message.
	// Side note: using isEqualTo [] is faster than count _selectedObjects == 0. So always try to improve performance when ever possible.
	if (_selectedObjects isEqualTo []) exitWith 
	{
		// This is only from 0.1.0 update and higher! Use old Ares_fnc_ShowZeusMessage and playSound "FD_Start_F" if below that version! Syntax is the same.
		// Show the message to the Curator.
		["No object was selected!"] call Achilles_fnc_showZeusErrorMessage;
	};

	// If everything went good, then log the variables.
	systemChat format ["Position: %1 and Selected objects: %2", _position, _selectedObjects];
}] call Ares_fnc_RegisterCustomModule;
*/