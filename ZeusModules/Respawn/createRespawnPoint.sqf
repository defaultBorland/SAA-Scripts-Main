//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_RESPAWN", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (!(isNull _objectUnderCursor) and {_objectUnderCursor getVariable ["SAA_isCV", false]}) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_ERRORZEUSMESSAGE_ALREADYCV"] call bis_fnc_showCuratorFeedbackMessage;
	};

	private _name = "FOB";
	if (!(isNull _objectUnderCursor)) then {
		_name = getText (configFile >> "CfgVehicles" >> typeOf _objectUnderCursor >> "displayName");
	};

	[localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_DIALOG_HEADER",
		[
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_DIALOG_MARKERTYPE_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_DIALOG_MARKERTYPE_TOOLTIP"],
				[
					["respawn_unknown","respawn_inf","respawn_air", "respawn_para"],
					[
						["Respawn", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_MARKERTYPE_RESPAWN", "\A3\UI_F\data\Map\Markers\NATO\respawn_unknown_ca"], 
						["Infantry Respawn", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_MARKERTYPE_INFANTRYRESPAWN", "\A3\UI_F\data\Map\Markers\NATO\respawn_inf_ca"], 
						["Air Respawn", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_MARKERTYPE_AIRRESPAWN", "\A3\UI_F\data\Map\Markers\NATO\respawn_air_ca"], 
						["Paradrop Respawn", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_MARKERTYPE_PARADROPRESPAWN", "\A3\UI_F\data\Map\Markers\NATO\respawn_para_ca"]
					],
					0
				]
			],
			["SIDES", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_DIALOG_SIDE_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_DIALOG_TICKETSAMOUNT_TOOLTIP"],
				west
			],
			["EDIT", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_DIALOG_RESPAWNNAME_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_DIALOG_RESPAWNNAME_TOOLTIP"],
				[
					_name,
					{

					}
				]
			],
			["CHECKBOX", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_DIALOG_SHOWHINT_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_DIALOG_SHOWHINT_TOOLTIP"],
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
				_markerPrefix = "CV";
			};

			_markerNum = {(str _side) in _x} count allMapMarkers;
			_marker = createMarker [format["%1_%2_%3", _markerPrefix, _side, ceil serverTime], _position];
			_marker setMarkerType _markerType;
			_marker setMarkerColor _color;
			_marker setMarkerText _markerText;

			if !(isNull _objectUnderCursor) then {
				[[_objectUnderCursor, west, false], Shadec_fnc_replaceVehicleRadio] remoteExec ["spawn", 2];
			};

			[[_position, _objectUnderCursor, _side, _marker, _showNotification], Shadec_fnc_createRespawnPoint] remoteExec ["spawn", 2];
			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_RESPAWN_CREATE_RESPAWN_POINT_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_position, _objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;