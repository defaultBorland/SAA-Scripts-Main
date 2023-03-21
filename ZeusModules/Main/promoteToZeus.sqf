//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_MAIN", localize "STR_SAA_ZEUS_MODULES_MAIN_PROMOTE_TO_ZEUS_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	if !(_objectUnderCursor isKindOf "Man") exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_MUST_BE_A_MAN"] call bis_fnc_showCuratorFeedbackMessage; // SAA_ZEUS_MESSAGES_ERRORMUSTBEAMAN
	};

	if !(isPlayer _objectUnderCursor) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_MUST_BE_A_PLAYER"] call bis_fnc_showCuratorFeedbackMessage; // SAA_ZEUS_MESSAGES_ERRORMUSTBEAPLAYER
	};

	if (_objectUnderCursor getVariable ["SAA_isZeus", false]) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_ALREADY_ZEUS"] call bis_fnc_showCuratorFeedbackMessage; // SAA_ZEUS_MESSAGES_ERRORALREADYZEUS
	};

	[_objectUnderCursor] call Shadec_fnc_promoteToZeus;
	
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;