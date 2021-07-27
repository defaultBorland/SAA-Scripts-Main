//

[localize "SAA_ZEUS_MODULES_CATEGORIES_STORAGE", localize "SAA_ZEUS_MODULES_STORAGE_ASSIGNSTORAGE_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNOOBJECTSELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	[localize "SAA_ZEUS_MODULES_STORAGE_ASSIGNSTORAGE_DIALOG_HEADER",
		[
			["CHECKBOX", [localize "SAA_ZEUS_MODULES_STORAGE_ASSIGNSTORAGE_DIALOG_SHOWHINT_DISPLAYNAME", localize "SAA_ZEUS_MODULES_STORAGE_ASSIGNSTORAGE_DIALOG_SHOWHINT_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_showInfo"];
			_args params ["_selectedObject"];

			if (_selectedObject getVariable ["SAA_isStorageProxy", false]) exitWith {[objNull, localize "SAA_ZEUS_MODULES_STORAGE_ASSIGNSTORAGE_MESSAGES_ALREADYSTORAGEPROXY"] call bis_fnc_showCuratorFeedbackMessage};

			[[_selectedObject, _showInfo], Shadec_fnc_assignStorage] remoteExec ["call", 2];
	
			[localize "SAA_GENERAL_SUCCESS", localize "SAA_ZEUS_MODULES_STORAGE_ASSIGNSTORAGE_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;