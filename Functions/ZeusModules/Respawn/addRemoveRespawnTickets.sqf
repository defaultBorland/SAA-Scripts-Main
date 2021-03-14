//

[localize "SAA_ZEUS_MODULES_CATEGORIES_RESPAWN", localize "SAA_ZEUS_MODULES_RESPAWN_CHANGETICKETSAMOUNT_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// if (isNull _objectUnderCursor) exitWith {
	// 	[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNOOBJECTSELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	// };

	[localize "SAA_ZEUS_MODULES_RESPAWN_CHANGETICKETSAMOUNT_DIALOG_HEADER",
		[
			["SLIDER", [localize "SAA_ZEUS_MODULES_RESPAWN_CHANGETICKETSAMOUNT_DIALOG_TICKETSAMOUNT_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RESPAWN_CHANGETICKETSAMOUNT_DIALOG_TICKETSAMOUNT_TOOLTIP"],
				[
					-99, 99, 1, 0
				]
			],
			["SIDES", [localize "SAA_ZEUS_MODULES_RESPAWN_CHANGETICKETSAMOUNT_DIALOG_SIDE_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RESPAWN_CHANGETICKETSAMOUNT_DIALOG_TICKETSAMOUNT_TOOLTIP"],
				west
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_ticketsChange", "_side"];
			
			[[_SIDE, _ticketsChange], Shadec_fnc_changeRespawnTickets] remoteExec ["call", 2];
			[localize "SAA_GENERAL_SUCCESS", localize "SAA_ZEUS_MODULES_RESPAWN_CHANGETICKETSAMOUNT_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;