//

[localize "SAA_ZEUS_MODULES_CATEGORIES_RADIO", localize "SAA_ZEUS_MODULES_RADIO_REMOVEJAMMINGOBJECT_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNOOBJECTSELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	[["Remove",[_objectUnderCursor]], Shadec_fnc_assignJammer] remoteExec ["spawn", 2];
	[localize "SAA_GENERAL_SUCCESS", localize "SAA_ZEUS_MODULES_RADIO_REMOVEJAMMINGOBJECT_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;	

}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;