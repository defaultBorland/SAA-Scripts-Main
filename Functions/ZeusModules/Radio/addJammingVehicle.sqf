//

[localize "SAA_ZEUS_MODULES_CATEGORIES_RADIO", localize "SAA_ZEUS_MODULES_RADIO_ADDJAMMINGOBJECT_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNOOBJECTSELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	[localize "SAA_ZEUS_MODULES_RADIO_ADDJAMMINGOBJECT_DIALOG_HEADER",
		[
			["SLIDER", [localize "SAA_ZEUS_MODULES_RADIO_ADDJAMMINGOBJECT_DIALOG_DISTANCE_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RADIO_ADDJAMMINGOBJECT_DIALOG_DISTANCE_TOOLTIP"],
				[
					1, 20000, 3000, 0
				]
			],
			["SLIDER", [localize "SAA_ZEUS_MODULES_RADIO_ADDJAMMINGOBJECT_DIALOG_STRENGHT_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RADIO_ADDJAMMINGOBJECT_DIALOG_STRENGHT_TOOLTIP"],
				[
					0, 1, 0.5, 1
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_distance","_strenght"];
			_args params ["_selectedObject"];

			_strenght = round (_strenght * 50);
			
			[["Add",[_distance, _strenght, _selectedObject]], Shadec_fnc_assignJammer] remoteExec ["spawn", 2];
			[localize "SAA_GENERAL_SUCCESS", localize "SAA_ZEUS_MODULES_RADIO_ADDJAMMINGOBJECT_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;