//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_MAIN", localize "STR_SAA_ZEUS_MODULES_MAIN_REMOVE_TRACKING_MARKER_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	private _trackedMarkers = missionNamespace getVariable ["SAA_Tracked_Markers", []];

	if (count _trackedMarkers < 1) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MODULES_MAIN_REMOVE_TRACKING_MARKER_ERRORZEUSMESSAGE_NOCVORFOBS"] call bis_fnc_showCuratorFeedbackMessage;
	};

	_markersNames = _trackedMarkers apply {markerText _x};

	["Maker Tracking",
		[
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_TRACKING_MARKER_DIALOG_MARKER", ""],
				[
					_trackedMarkers,
					_markersNames,
					0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_marker"];
			_args params ["_trackedMarkers"];
			
			missionNamespace setVariable ["SAA_Tracked_Markers", _trackedMarkers - [_marker], true];
			deleteMarker _marker;

			[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_MAIN_REMOVE_TRACKING_MARKER_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_trackedMarkers]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;