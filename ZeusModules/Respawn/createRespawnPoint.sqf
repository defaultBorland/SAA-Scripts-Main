//

[localize "SAA_ZEUS_MODULES_CATEGORIES_RESPAWN", localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (!(isNull _objectUnderCursor) and {_objectUnderCursor getVariable ["isFOB", false]}) exitWith {
		[objNull, localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_ERRORZEUSMESSAGE_ALREADYCV"] call bis_fnc_showCuratorFeedbackMessage;
	};

	[localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_DIALOG_HEADER",
		[
			["COMBO", [localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_DIALOG_MARKERTYPE_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_DIALOG_MARKERTYPE_TOOLTIP"],
				[
					["respawn_unknown","respawn_inf","respawn_air", "respawn_para"],
					[
						["Respawn", localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_MARKERTYPE_RESPAWN", "\A3\UI_F\data\Map\Markers\NATO\respawn_unknown_ca"], 
						["Infantry Respawn", localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_MARKERTYPE_INFANTRYRESPAWN", "\A3\UI_F\data\Map\Markers\NATO\respawn_inf_ca"], 
						["Air Respawn", localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_MARKERTYPE_AIRRESPAWN", "\A3\UI_F\data\Map\Markers\NATO\respawn_air_ca"], 
						["Paradrop Respawn", localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_MARKERTYPE_PARADROPRESPAWN", "\A3\UI_F\data\Map\Markers\NATO\respawn_para_ca"]
					],
					0
				]
			],
			["SIDES", [localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_DIALOG_SIDE_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_DIALOG_TICKETSAMOUNT_TOOLTIP"],
				west
			],
			["EDIT", [localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_DIALOG_RESPAWNNAME_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_DIALOG_RESPAWNNAME_TOOLTIP"],
				[
					"FOB/CV",
					{

					}
				]
			],
			["CHECKBOX", [localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_DIALOG_SHOWHINT_DISPLAYNAME", localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_DIALOG_SHOWHINT_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_markerType", "_side", "_markerText", "_showNotification"];
			_args params ["_position", "_objectUnderCursor"]; // Object or position

			_color = "Color" + str _side;

			_markerPrefix = "";
			if (isNull _objectUnderCursor) then {
				_markerPrefix = "POS";
			} else {
				_markerPrefix = "FOB";
			};

			_markerNum = {(str _side) in _x} count allMapMarkers;
			_marker = createMarker [format["%1_%2_%3", _markerPrefix, _side, _markerNum], _position]; // [format["respawn_%1_%2", _SIDE, _markerNum], _position];
			_marker setMarkerType _markerType;
			_marker setMarkerColor _color;
			_marker setMarkerText _markerText;

			[[_position, _objectUnderCursor, str _side, _marker, _showNotification], Shadec_fnc_createRespawnPoint] remoteExec ["spawn", 2];	
			[localize "SAA_GENERAL_SUCCESS", localize "SAA_ZEUS_MODULES_RESPAWN_CREATERESPAWNPOINT_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_position, _objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;