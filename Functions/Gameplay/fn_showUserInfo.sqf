// ONLY LOCAL EXECUTE
params ["_unit"];

if (_unit getVariable ["SAA_isZeus", false]) then {
	[
		[
			[localize "SAA_ROLES_ROLE", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaBold'>%1: </t>"],
			[localize "SAA_GENERAL_ZEUS", "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 10],

			[format["%1 | %2 | %3:%4", toUpper worldName, mapGridPosition _unit, [daytime, "HH:MM"] call BIS_fnc_timeToString], "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 40]
		], 1, 1
	] spawn BIS_fnc_typeText;
} else {
	[
		[
			[localize "SAA_RANKS_RANK", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaBold'>%1: </t>"],
			[_unit getVariable ["SAA_Rank", "UNKNOWN"], "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 5],
			[localize "SAA_CLASSES_PRIMARY", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaBold'>%1: </t>"],
			[localize ([_unit getVariable ["SAA_PrimaryClass", "SAA_CLASSES_RIFLEMAN"], "LS"] call Shadec_fnc_classSwitcher), "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 5],
			[localize "SAA_CLASSES_SECONDARY", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaBold'>%1: </t>"],
			[localize ([_unit getVariable ["SAA_SecondaryClass", "SAA_CLASSES_RIFLEMAN"], "LS"] call Shadec_fnc_classSwitcher), "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/><br/>", 10],

			[format["%1 | %2 | %3", toUpper worldName, mapGridPosition _unit, [daytime, "HH:MM"] call BIS_fnc_timeToString, date select 4], "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 8],
			[localize "SAA_GENERAL_STATUS", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaBold'>%1: </t>"],
			[[localize "SAA_GENERAL_KIA", localize "SAA_GENERAL_INACTION"] select (alive _unit), "<t align = 'left' shadow = '1' size = '0.7'>%1: %2</t><br/>", 50]
		], 1, 1
	] spawn BIS_fnc_typeText;
};

// Return
true