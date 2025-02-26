//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_MAIN", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	private _target = [
		[
			[_objectUnderCursor], 
			[_objectUnderCursor, group _objectUnderCursor]
		] select (_objectUnderCursor isKindOf "Man"),
		[_position]
	] select (isNull _objectUnderCursor);
	
	private _targetDisplayValues = [
		[
			[
				[localize "STR_SAA_GENERAL_OBJECT", "", ""]
			],
			[
				[localize "STR_SAA_GENERAL_OBJECT", "", ""], 
				[localize "STR_SAA_GENERAL_GROUP", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_GROUP_TOOLTIP", ""]
			]
		] select (_objectUnderCursor isKindOf "Man"),
		[
			[localize "STR_SAA_GENERAL_POSITION", "", ""]
		]
	] select (isNull _objectUnderCursor);

	private _markerText = [
		[
			getText (configFile >> "CfgVehicles" >> typeOf _objectUnderCursor >> "displayName"),
			groupId group _objectUnderCursor
		] select (_objectUnderCursor isKindOf "Man"),
		"Position"
	] select (isNull _objectUnderCursor);


	private _markers = ("getNumber (_x >> 'scope') > 0 && ((getText (_x >> 'markerClass') in ['NATO_BLUFOR','NATO_Respawn', 'NATO_OPFOR']) || (getText(_x >> 'name') in ['KIA']))" configClasses (configfile >> "CfgMarkers")) apply {
		configName _x
	};
	_markers sort true;
	private _markersDisplayValues = _markers apply {
		[
			getText(configfile >> "CfgMarkers" >> _x >> "name"),
			_x,
			getText(configfile >> "CfgMarkers" >> _x >> "icon")
		]
	};
	
	private _colors = ("getNumber(_x >> 'scope') == 2" configClasses (configfile >> "CfgMarkerColors")) apply {
		configName _x
	};
	private _colorsDisplayValues = _colors apply {
		[
			getText(configfile >> "CfgMarkerColors" >> _x >> "name"),
			_x,
			"",
			getArray(configfile >> "CfgMarkerColors" >> _x >> "color") call BIS_fnc_colorConfigToRGBA
		]
	};

	[localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_MODULENAME",
		[
			["COMBO", [localize "STR_SAA_GENERAL_TARGET", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_TARGET_TOOLTIP"],
				[
					_target,
					_targetDisplayValues,
					0
				]
			],
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_MARKER", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_MARKER_TOOLTIP"],
				[
					_markers,
					_markersDisplayValues,
					0
				]
			],
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_MARKER_COLOR", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_MARKER_COLOR_TOOLTIP"],
				[
					_colors,
					_colorsDisplayValues,
					1
				]
			],
			["EDIT", [localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_MARKER_TEXT", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_COLOR_MARKER_TEXT_TOOLTIP"],
				[
					_markerText, {}
				]
			],
			["SIDES", [localize "STR_SAA_GENERAL_SIDE", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_SIDE_TOOLTIP"],
				west
			],
			["CHECKBOX", [localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_DELETEIFDEAD", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_DELETEIFDEAD_TOOLTIP"],
				true
			],
			["SLIDER", [localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_UPDATE_TIME", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_UPDATE_TIME_TOOLTIP"],
				[
					1, 600, 1, 0
				]
			],
			["SLIDER", [localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_PRECISION", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_PRECISION_TOOLTIP"],
				[
					0, 1000, 0, 0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_target", "_markerType", "_markerColor", "_markerText", "_side", "_deleteIfDead", "_updateTime", "_precision"];
			_args params ["_position"];

			private _marker = createMarker [format["%1_%2_%3", _markerType, _side, ceil serverTime], _position];
			_marker setMarkerType _markerType;
			_marker setMarkerColor _markerColor;
			_marker setMarkerText _markerText;
			_marker setMarkerAlpha 0;

			private _trackedMarkers = missionNamespace getVariable ["SAA_Tracked_Markers", []];
			missionNamespace setVariable ["SAA_Tracked_Markers", _trackedMarkers + [_marker], true];

			if (_target isEqualType []) then {_target = nil};

			[[_target, _marker, _side, _deleteIfDead, round _updateTime, round _precision], Shadec_fnc_markerTracking] remoteExec ["call", 2];

			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_position]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;