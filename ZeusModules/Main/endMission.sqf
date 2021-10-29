// Zeus End Mission Module (SCENARIO FLOW TAB)

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_SCENARIO_FLOW", localize "STR_SAA_ZEUS_MODULES_SCENARIO_FLOW_END_MISSION_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// if (isNull _objectUnderCursor) exitWith {
	// 	[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	// };

	[localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_DIALOG_HEADER",
		[
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_DIALOG_ENDTYPE_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_DIALOG_ENDTYPE_TOOLTIP"],
				[
					["Win", "Lose", "toBeContinued", "allDead"],
					[
						[localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_WIN", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_WIN_TOOLTIP", "\A3\UI_F\data\IGUI\Cfg\HoldActions\holdAction_thumbsUp_ca"], 
						[localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_LOSE", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_LOSE_TOOLTIP", "\A3\UI_F\data\IGUI\Cfg\HoldActions\holdAction_thumbsDown_ca"], 
						[localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_TOBECONTINUED", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_TOBECONTINUED_TOOLTIP", "\A3\UI_F\data\Map\Diary\Icons\unitGroupPlayable_ca"], 
						[localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_EVERYONEISDEAD", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_EVERYONEISDEAD_TOOLTIP", "\A3\UI_F\data\GUI\Cfg\Debriefing\endDeath_ca"]
					],
					0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_endType"];

			[[_endType], Shadec_fnc_endMission] remoteExec ["call", 2];
	
			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;


// Zeus End Mission Module (SAA MAIN TAB)
[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_MAIN", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// if (isNull _objectUnderCursor) exitWith {
	// 	[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	// };

	[localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_DIALOG_HEADER",
		[
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_DIALOG_ENDTYPE_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_DIALOG_ENDTYPE_TOOLTIP"],
				[
					["Win", "Lose", "toBeContinued", "allDead"],
					[
						[localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_WIN", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_WIN_TOOLTIP", "\A3\UI_F\data\IGUI\Cfg\HoldActions\holdAction_thumbsUp_ca"], 
						[localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_LOSE", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_LOSE_TOOLTIP", "\A3\UI_F\data\IGUI\Cfg\HoldActions\holdAction_thumbsDown_ca"], 
						[localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_TOBECONTINUED", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_TOBECONTINUED_TOOLTIP", "\A3\UI_F\data\Map\Diary\Icons\unitGroupPlayable_ca"], 
						[localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_EVERYONEISDEAD", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ENDTYPE_EVERYONEISDEAD_TOOLTIP", "\A3\UI_F\data\GUI\Cfg\Debriefing\endDeath_ca"]
					],
					0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_endType"];

			[[_endType], Shadec_fnc_endMission] remoteExec ["call", 2];
	
			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_MAIN_END_MISSION_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;