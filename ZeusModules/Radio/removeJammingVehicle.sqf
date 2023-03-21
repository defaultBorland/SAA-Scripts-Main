//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_RADIO", localize "STR_SAA_ZEUS_MODULES_RADIO_REMOVE_JAMMING_OBJECT_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	[["Remove",[_objectUnderCursor]], Shadec_fnc_assignJammer] remoteExec ["spawn", 2];
	[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_RADIO_REMOVE_JAMMING_OBJECT_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;	

}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;