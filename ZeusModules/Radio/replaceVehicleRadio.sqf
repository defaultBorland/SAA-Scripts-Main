//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_RADIO", localize "STR_SAA_ZEUS_MODULES_RADIO_REPLACE_VEHICLE_RADIO_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	if !(_objectUnderCursor call TFAR_fnc_hasVehicleRadio) exitWith { // If vehicle has no LR radio
		[objNull, localize "STR_SAA_ZEUS_MODULES_RADIO_REPLACE_VEHICLE_RADIO_MESSAGES_VEHICLEHASNOLRRADIO"] call bis_fnc_showCuratorFeedbackMessage;
	};

	[localize "STR_SAA_ZEUS_MODULES_RADIO_REPLACE_VEHICLE_RADIO_DIALOG_HEADER",
		[
			["SIDES", [localize "STR_SAA_GENERAL_SIDE", localize "STR_SAA_ZEUS_MODULES_RADIO_REPLACE_VEHICLE_RADIO_DIALOG_DISTANCE_TOOLTIP"],
				west
			],
			["CHECKBOX", [localize "STR_SAA_ZEUS_MODULES_RADIO_REPLACE_VEHICLE_RADIO_DIALOG_SHOWHINT_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RADIO_REPLACE_VEHICLE_RADIO_DIALOG_SHOWHINT_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_side", "_showNotification"];
			_args params ["_position", "_objectUnderCursor"]; // Object or position

			[[_objectUnderCursor, _side, _showNotification], Shadec_fnc_replaceVehicleRadio] remoteExec ["spawn", 2];	
			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_RADIO_REPLACE_VEHICLE_RADIO_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_position, _objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;