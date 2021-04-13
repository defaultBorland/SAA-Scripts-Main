//

[localize "SAA_ZEUS_MODULES_CATEGORIES_MAIN", localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNOOBJECTSELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	[localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_DIALOG_HEADER",
		[
			["COMBO", [localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_DIALOG_UNIFORMTYPE_DISPLAYNAME", localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_DIALOG_UNIFORMTYPE_TOOLTIP"],
				[
					["Arid", "Semiarid", "Forest", "Winter", "Black", "All"],
					[
						[localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_UNIFORMTYPE_ARID", "Arid/OGA"], 
						[localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_UNIFORMTYPE_SEMIARID", "Multicam"], 
						[localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_UNIFORMTYPE_FOREST", "Woodland/OD"], 
						[localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_UNIFORMTYPE_WINTER", "Winter/White"], 
						[localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_UNIFORMTYPE_BLACK", "Black/Spec-Ops"], 
						[localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_UNIFORMTYPE_ALL", "Arid/OGA/Multicam/Woodland/OD/White/Black"]
					],
					0
				]
			],
			["CHECKBOX", [localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_DIALOG_CLEAROBJECT_DISPLAYNAME", localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_DIALOG_CLEAROBJECT_TOOLTIP"],
				true
			],
			["CHECKBOX", [localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_DIALOG_SHOWHINT_DISPLAYNAME", localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_DIALOG_SHOWHINT_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_uniformType", "_clearInventory", "_showInfo"];
			_args params ["_selectedObject"];

			[[_selectedObject, _uniformType, _clearInventory, _showInfo], Shadec_fnc_addShadecArsenal] remoteExec ["call", 2];
	
			[localize "SAA_GENERAL_SUCCESS", localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;