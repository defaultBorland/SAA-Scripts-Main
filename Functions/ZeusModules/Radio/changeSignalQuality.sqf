//

[localize "SAA_ZEUS_MODULES_CATEGORIES_RADIO", localize "SAA_ZEUS_MODULES_RADIO_CHANGESIGNALQUALITY_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// if (isNull _objectUnderCursor) exitWith {
	// 	[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNOOBJECTSELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	// };

	[localize "SAA_ZEUS_MODULES_RADIO_CHANGESIGNALQUALITY_DIALOG_HEADER",
		[
			["SLIDER", [localize "SAA_ZEUS_MODULES_RADIO_CHANGESIGNALQUALITY_DIALOG_DISTANCE_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RADIO_CHANGESIGNALQUALITY_DIALOG_DISTANCE_TOOLTIP"],
				[
					0, 1, 1, 2
				]
			],
			["SLIDER", [localize "SAA_ZEUS_MODULES_RADIO_CHANGESIGNALQUALITY_DIALOG_TERRAININTERCEPTION_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RADIO_CHANGESIGNALQUALITY_DIALOG_TERRAININTERCEPTION_TOOLTIP"],
				[
					0, 7, 7, 1
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_rangeMod","_terrainIntercept"];

			missionNamespace setVariable ["tf_reciveVar", 26-(_rangeMod*25), true];
			missionNamespace setVariable ["tf_sendVar", _rangeMod, true];
			missionNamespace setVariable ["TF_terrain_interception_coefficient", _terrainIntercept, true];
			
			[[_rangeMod], Shadec_fnc_radioSignalQuality] remoteExec ["spawn", -2];
			[localize "SAA_GENERAL_SUCCESS", localize "SAA_ZEUS_MODULES_RADIO_CHANGESIGNALQUALITY_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;