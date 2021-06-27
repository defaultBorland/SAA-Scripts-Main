// Zeus End Mission Module (SCENARIO FLOW TAB)

[localize "SAA_ZEUS_MODULES_CATEGORIES_SCENARIOFLOW", localize "SAA_ZEUS_MODULES_SCENARIOFLOW_ENDMISION_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// if (isNull _objectUnderCursor) exitWith {
	// 	[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNOOBJECTSELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	// };

	[localize "SAA_ZEUS_MODULES_MAIN_ENDMISION_DIALOG_HEADER",
		[
			["COMBO", [localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_DIALOG_ENDTYPE_DISPLAYNAME", localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_DIALOG_ENDTYPE_TOOLTIP"],
				[
					["Win", "Lose", "toBeContinued", "allDead"],
					[
						[localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_WIN", localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_WIN_TOOLTIP", "\A3\UI_F\data\IGUI\Cfg\HoldActions\holdAction_thumbsUp_ca"], 
						[localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_LOSE", localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_LOSE_TOOLTIP", "\A3\UI_F\data\IGUI\Cfg\HoldActions\holdAction_thumbsDown_ca"], 
						[localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_TOBECONTINUED", localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_TOBECONTINUED_TOOLTIP", "\A3\UI_F\data\Map\Diary\Icons\unitGroupPlayable_ca"], 
						[localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_EVERYONEISDEAD", localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_EVERYONEISDEAD_TOOLTIP", "\A3\UI_F\data\GUI\Cfg\Debriefing\endDeath_ca"]
					],
					0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_endType"];

			[[_endType], Shadec_fnc_endMission] remoteExec ["call", 2];
	
			[localize "SAA_GENERAL_SUCCESS", localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;


// Zeus End Mission Module (SAA MAIN TAB)
[localize "SAA_ZEUS_MODULES_CATEGORIES_MAIN", localize "SAA_ZEUS_MODULES_MAIN_ENDMISION_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// if (isNull _objectUnderCursor) exitWith {
	// 	[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNOOBJECTSELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	// };

	[localize "SAA_ZEUS_MODULES_MAIN_ENDMISION_DIALOG_HEADER",
		[
			["COMBO", [localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_DIALOG_ENDTYPE_DISPLAYNAME", localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_DIALOG_ENDTYPE_TOOLTIP"],
				[
					["Win", "Lose", "toBeContinued", "allDead"],
					[
						[localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_WIN", localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_WIN_TOOLTIP", "\A3\UI_F\data\IGUI\Cfg\HoldActions\holdAction_thumbsUp_ca"], 
						[localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_LOSE", localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_LOSE_TOOLTIP", "\A3\UI_F\data\IGUI\Cfg\HoldActions\holdAction_thumbsDown_ca"], 
						[localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_TOBECONTINUED", localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_TOBECONTINUED_TOOLTIP", "\A3\UI_F\data\Map\Diary\Icons\unitGroupPlayable_ca"], 
						[localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_EVERYONEISDEAD", localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ENDTYPE_EVERYONEISDEAD_TOOLTIP", "\A3\UI_F\data\GUI\Cfg\Debriefing\endDeath_ca"]
					],
					0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_endType"];

			[[_endType], Shadec_fnc_endMission] remoteExec ["call", 2];
	
			[localize "SAA_GENERAL_SUCCESS", localize "SAA_ZEUS_MODULES_MAIN_ENDMISSION_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;