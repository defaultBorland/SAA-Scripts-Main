//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_MAIN", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	[localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_DIALOG_HEADER",
		[
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_DIALOG_UNIFORMTYPE_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_DIALOG_UNIFORMTYPE_TOOLTIP"],
				[
					["Arid", "Semiarid", "Forest", "Winter", "Black", "All"],
					[
						[localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_UNIFORMTYPE_ARID", "Arid/OGA"], 
						[localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_UNIFORMTYPE_SEMIARID", "Multicam"], 
						[localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_UNIFORMTYPE_FOREST", "Woodland/OD"], 
						[localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_UNIFORMTYPE_WINTER", "Winter/White"], 
						[localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_UNIFORMTYPE_BLACK", "Black/Spec-Ops"], 
						[localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_UNIFORMTYPE_ALL", "Arid/OGA/Multicam/Woodland/OD/White/Black"]
					],
					0
				]
			],
			["CHECKBOX", [localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_DIALOG_CLEAROBJECT_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_DIALOG_CLEAROBJECT_TOOLTIP"],
				true
			],
			["CHECKBOX", [localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_DIALOG_SHOWHINT_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_DIALOG_SHOWHINT_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_uniformType", "_clearInventory", "_showInfo"];
			_args params ["_selectedObject"];

			[[_selectedObject, _uniformType, _clearInventory, _showInfo], Shadec_fnc_addShadecArsenal] remoteExec ["call", 2];
	
			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;