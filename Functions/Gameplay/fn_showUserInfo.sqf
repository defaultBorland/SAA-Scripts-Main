// ONLY LOCAL EXECUTE
if (!hasInterface) exitWith {diag_log format["%1 | Local only function", __FILE_NAME__]; false};

params ["_unit"];

if (_unit getVariable ["SAA_isZeus", false]) then {
	[
		[
			[localize "STR_SAA_ROLES_ROLE", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaBold'>%1: </t>"],
			[localize "STR_SAA_GENERAL_ZEUS", "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 10],

			[format["%1 | %2 | %3", toUpper getText(configFile >> "CfgWorlds" >> worldName >> "description"), mapGridPosition _unit, [daytime, "HH:MM"] call BIS_fnc_timeToString], "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 40]
		], 1, 1
	] spawn BIS_fnc_typeText;
} else {
	[
		[
			[localize "STR_SAA_RANKS_RANK", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaBold'>%1: </t>"],
			[_unit getVariable ["SAA_Rank", "UNKNOWN"], "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 5],
			[localize "STR_SAA_CLASSES_PRIMARY", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaBold'>%1: </t>"],
			[localize ([_unit getVariable ["SAA_PrimaryClass", "SAA_CLASSES_RIFLEMAN"], "LS"] call Shadec_fnc_classSwitcher), "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 5],
			[localize "STR_SAA_CLASSES_SECONDARY", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaBold'>%1: </t>"],
			[localize ([_unit getVariable ["SAA_SecondaryClass", "SAA_CLASSES_RIFLEMAN"], "LS"] call Shadec_fnc_classSwitcher), "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/><br/>", 10],

			[format["%1 | %2 | %3", toUpper getText(configFile >> "CfgWorlds" >> worldName >> "description"), mapGridPosition _unit, [daytime, "HH:MM"] call BIS_fnc_timeToString, date select 4], "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 8],
			[localize "STR_SAA_GENERAL_STATUS", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaBold'>%1: </t>"],
			[[localize "STR_SAA_GENERAL_KIA", localize "STR_SAA_GENERAL_IN_ACTION"] select (alive _unit), "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 50]
		], 1, 1
	] spawn BIS_fnc_typeText;
};

// Return
true