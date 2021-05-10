//

[localize "SAA_ZEUS_MODULES_CATEGORIES_RADIO", localize "SAA_ZEUS_MODULES_RADIO_REPLACEVEHICLERADIO_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNOOBJECTSELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

	if !(_objectUnderCursor call TFAR_fnc_hasVehicleRadio) exitWith { // If vehicle has no LR radio
		[objNull, localize "SAA_ZEUS_MODULES_RADIO_REPLACEVEHICLERADIO_MESSAGES_VEHICLEHASNOLRRADIO"] call bis_fnc_showCuratorFeedbackMessage;
	};

	[localize "SAA_ZEUS_MODULES_RADIO_REPLACEVEHICLERADIO_DIALOG_HEADER",
		[
			["SIDES", [localize "SAA_ZEUS_MODULES_RADIO_REPLACEVEHICLERADIO_DIALOG_DISTANCE_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RADIO_REPLACEVEHICLERADIO_DIALOG_DISTANCE_TOOLTIP"],
				west
			],
			["CHECKBOX", [localize "SAA_ZEUS_MODULES_RADIO_REPLACEVEHICLERADIO_DIALOG_SHOWHINT_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RADIO_REPLACEVEHICLERADIO_DIALOG_SHOWHINT_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_side", "_showNotification"];
			_args params ["_position", "_objectUnderCursor"]; // Object or position

			[[_objectUnderCursor, _side, _showNotification], Shadec_fnc_replaceVehicleRadio] remoteExec ["spawn", 2];	
			[localize "SAA_GENERAL_SUCCESS", localize "SAA_ZEUS_MODULES_RADIO_REPLACEVEHICLERADIO_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_position, _objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;