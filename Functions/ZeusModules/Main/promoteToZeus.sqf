//

[localize "SAA_ZEUS_MODULES_CATEGORIES_MAIN", localize "SAA_ZEUS_MODULES_MAIN_PROMOTETOZEUS_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNOOBJECTSELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	if !(_objectUnderCursor isKindOf "Man") exitWith {
		[objNull, localize "SAA_ZEUS_MESSAGES_MUSTBEAMAN"] call bis_fnc_showCuratorFeedbackMessage; // SAA_ZEUS_MESSAGES_MUSTBEAMAN
	};

	if !(isPlayer _objectUnderCursor) exitWith {
		[objNull, localize "SAA_ZEUS_MESSAGES_MUSTBEAPLAYER"] call bis_fnc_showCuratorFeedbackMessage; // SAA_ZEUS_MESSAGES_MUSTBEAPLAYER
	};

	if (_objectUnderCursor getVariable ["SAA_isZeus", false]) exitWith {
		[objNull, localize "SAA_ZEUS_MESSAGES_ALREADYZEUS"] call bis_fnc_showCuratorFeedbackMessage; // SAA_ZEUS_MESSAGES_ALREADYZEUS
	};

	[_objectUnderCursor] call Shadec_fnc_promoteToZeus;
	
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;