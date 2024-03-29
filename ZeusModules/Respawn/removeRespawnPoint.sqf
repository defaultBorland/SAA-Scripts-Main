//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_RESPAWN", localize "STR_SAA_ZEUS_MODULES_RESPAWN_REMOVE_RESPAWN_POINT_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	_respawnPositions = missionNamespace getVariable ["SAA_respawnPoints", []]; //diag_log format ["VARS CHECK RRP | _respawnPositions: %1", _respawnPositions];

	if (count _respawnPositions < 1) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MODULES_RESPAWN_REMOVE_RESPAWN_POINT_ERRORZEUSMESSAGE_NOCVORFOBS"] call bis_fnc_showCuratorFeedbackMessage;
	};

	_markersNames = _respawnPositions apply {markerText (_x # 0)};

	[localize "STR_SAA_ZEUS_MODULES_RESPAWN_REMOVE_RESPAWN_POINT_DIALOG_HEADER",
		[
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_REMOVE_RESPAWN_POINT_DIALOG_SELECTMARKER_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_REMOVE_RESPAWN_POINT_DIALOG_SELECTMARKER_TOOLTIP"],
				[
					_respawnPositions,
					_markersNames,
					0
				]
			],
			["CHECKBOX", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_REMOVE_RESPAWN_POINT_DIALOG_SHOWHINT_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_REMOVE_RESPAWN_POINT_DIALOG_SHOWHINT_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_respawnPosition", "_showNotification"];
			_args params ["_respawnPositions"];

			[[_respawnPosition # 0, _showNotification], Shadec_fnc_removeRespawnPoint] remoteExec ["spawn", 2];

			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_RESPAWN_REMOVE_RESPAWN_POINT_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;