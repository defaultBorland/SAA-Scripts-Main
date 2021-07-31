//

[localize "SAA_ZEUS_MODULES_CATEGORIES_RESPAWN", localize "SAA_ZEUS_MODULES_RESPAWN_REMOVERESPAWNPOINT_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	_respawnPositions = missionNamespace getVariable ["respawnPositions", []]; diag_log format ["VARS CHECK RRP | _respawnPositions: %1", _respawnPositions];
	_markersNames = _respawnPositions apply { markerText (_x # 0)};

	[localize "SAA_ZEUS_MODULES_RESPAWN_REMOVERESPAWNPOINT_DIALOG_HEADER",
		[
			["COMBO", [localize "SAA_ZEUS_MODULES_RESPAWN_REMOVERESPAWNPOINT_DIALOG_SELECTMARKER_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RESPAWN_REMOVERESPAWNPOINT_DIALOG_SELECTMARKER_TOOLTIP"],
				[
					_respawnPositions,
					_markersNames,
					0
				]
			],
			["CHECKBOX", [localize "SAA_ZEUS_MODULES_RESPAWN_REMOVERESPAWNPOINT_DIALOG_SHOWHINT_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RESPAWN_REMOVERESPAWNPOINT_DIALOG_SHOWHINT_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_respawnPosition", "_showNotification"];
			_args params ["_respawnPositions"];

			[[_respawnPosition # 0, _showNotification], Shadec_fnc_removeRespawnPoint] remoteExec ["spawn", 2];

			[localize "SAA_GENERAL_SUCCESS", localize "SAA_ZEUS_MODULES_RESPAWN_REMOVERESPAWNPOINT_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;