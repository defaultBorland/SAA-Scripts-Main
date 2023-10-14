//
[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_MAIN", localize "STR_SAA_ZEUS_MODULES_MAIN_TOGGLE_GPS_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	[localize "STR_SAA_ZEUS_MODULES_MAIN_TOGGLE_GPS_MODULENAME",
		[
			["CHECKBOX", [localize "STR_SAA_ZEUS_MODULES_MAIN_TOGGLE_GPS_DIALOG_DISABLE", localize "STR_SAA_ZEUS_MODULES_MAIN_TOGGLE_GPS_DIALOG_DISABLE_TOOLTIP"],
				missionNamespace getVariable ["SAA_isGPSDisabled", false],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_state"];

			missionNamespace setVariable ["SAA_isGPSDisabled", _state, true];

			[[!_state], {
				params["_state"];
				[_state] call Shadec_fnc_toggleGPS;
				if (!_state) then {[_state] call Shadec_fnc_toggleMicroDAGR};
			}] remoteExec ["spawn", -2, "SAA_toggleGPS_JIP"];

			if (!_state) then { remoteExec ["", "SAA_toggleGPS_JIP"] };

			swt_markers_DisableLoc = _state;
			
			[localize "STR_SAA_GENERAL_SUCCESS", [localize "STR_SAA_ZEUS_MODULES_MAIN_TOGGLE_GPS_ZEUSMESSAGE_SUCCESS_ENABLED", localize "STR_SAA_ZEUS_MODULES_MAIN_TOGGLE_GPS_ZEUSMESSAGE_SUCCESS_DISABLED"] select _state, 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;