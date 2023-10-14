//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_ARSENAL", localize "STR_SAA_ZEUS_MODULES_ARSENAL_REMOVE_ARSENAL_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	if !(_objectUnderCursor getVariable ["SAA_isArsenal", false]) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MODULES_ARSENAL_NOT_SHADEC_ARSENAL"] call bis_fnc_showCuratorFeedbackMessage;
	};

	[[_objectUnderCursor], Shadec_fnc_removeShadecArsenal] remoteExec ["call", 2];

	[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_ARSENAL_ADD_ARSENAL_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;