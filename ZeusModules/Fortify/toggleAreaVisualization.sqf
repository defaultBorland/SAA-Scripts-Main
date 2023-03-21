// 
[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_FORTIFY", localize "STR_SAA_ZEUS_MODULES_FORTIFY_VISUALIZE_AREAS_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	private _fortifyLocationsInfo = missionNamespace getVariable ["SAA_fortify_locations", []];
	if (_fortifyLocationsInfo isEqualTo []) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MODULES_FORTIFY_REMOVE_FORTIFY_AREA_MESSAGES_NO_AREAS"] call bis_fnc_showCuratorFeedbackMessage;
	};

	private _visibleAreas = player getVariable ["SAA_fortify_visibleLocations", []];

	private _dialog = _fortifyLocationsInfo apply {
		["CHECKBOX", [_x # 0, localize "STR_SAA_ZEUS_MODULES_FORTIFY_VISUALIZE_AREAS_DIALOG_NAME_TOOLTIP"], (_x # 0) in _visibleAreas, true]
	};

	[localize "STR_SAA_ZEUS_MODULES_FORTIFY_VISUALIZE_AREAS_DIALOG_HEADER",
		_dialog,
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_args params ["_fortifyLocationsInfo", "_visibleAreas"];

			private _fortifyLocationsNames = _fortifyLocationsInfo apply {_x # 0};
			private _alreadyVisible = +_visibleAreas;

			{
				if (_x) then {
					_visibleAreas pushBackUnique (_fortifyLocationsNames # _forEachIndex)
				} else {
					_visibleAreas = _visibleAreas - [_fortifyLocationsNames # _forEachIndex];
				};
			} forEach _dialogResult;

			player setVariable ["SAA_fortify_visibleLocations", _visibleAreas];

			{
				if !(_x in _alreadyVisible) then {
					private _index = _fortifyLocationsNames find _x;
					(_fortifyLocationsInfo # _index) call Shadec_fnc_drawArea;
				};
			} forEach _visibleAreas;
		},
		{},
		[_fortifyLocationsInfo, _visibleAreas]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;