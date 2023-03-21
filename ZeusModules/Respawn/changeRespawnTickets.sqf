//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_RESPAWN", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// if (isNull _objectUnderCursor) exitWith {
	// 	[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	// };

	[localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_ZEUSMESSAGE_TICKETSLEFT", format["WEST: %1 | EAST: %2 | GUER: %3 | CIV: %4", [west] call BIS_fnc_respawnTickets, [east] call BIS_fnc_respawnTickets, [independent] call BIS_fnc_respawnTickets, [civilian] call BIS_fnc_respawnTickets], 3] call BIS_fnc_curatorHint;

	[localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_DIALOG_HEADER",
		[
			["SLIDER", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_DIALOG_TICKETSAMOUNT_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_DIALOG_TICKETSAMOUNT_TOOLTIP"],
				[
					-99, 99, 1, 0
				]
			],
			["SIDES", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_DIALOG_SIDE_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_DIALOG_SIDE_TOOLTIP"],
				west
			],
			["CHECKBOX", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_DIALOG_SHOWHINT_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_DIALOG_SHOWHINT_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_ticketsChange", "_side", "_showToAll"];
			
			if (_ticketsChange isEqualTo 0) then {
				[localize "STR_SAA_GENERAL_FAILURE", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_ZEUSMESSAGE_FAILED", 3] call BIS_fnc_curatorHint;
			} else {
				[[_SIDE, _ticketsChange, _showToAll], Shadec_fnc_changeRespawnTickets] remoteExec ["call", 2];
				[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;

				[ // Update zeus hint with tickets amount
					{
						[localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_ZEUSMESSAGE_TICKETSLEFT", format ["WEST: %1 | EAST: %2 | GUER: %3 | CIV: %4", [west] call BIS_fnc_respawnTickets, [east] call BIS_fnc_respawnTickets, [independent] call BIS_fnc_respawnTickets, [civilian] call BIS_fnc_respawnTickets], 3] call BIS_fnc_curatorHint;
					}, [], 1
				] call CBA_fnc_waitAndExecute;
			};
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;