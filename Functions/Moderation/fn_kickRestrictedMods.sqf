//
params ["_text"];

disableUserInput true;
disableUserInput false;
disableUserInput true;

"restrictedModsFound" setDebriefingText [
	localize "STR_SAA_DEBRIEFING_RESTRICTED_MODS_FOUND_TITLE", // title
	format["%1: %2", localize "STR_SAA_DEBRIEFING_RESTRICTED_MODS_FOUND_DESCRIPTION", _text],
	localize "STR_SAA_DEBRIEFING_RESTRICTED_MODS_FOUND_SUBTITLE" // subtitle
];

"restrictedModsFound" call BIS_fnc_endMission;

[{
	disableUserInput false;
}, nil, 15] call CBA_fnc_waitAndExecute;