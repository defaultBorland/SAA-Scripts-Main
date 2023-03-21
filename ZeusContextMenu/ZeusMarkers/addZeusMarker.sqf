private _setMarkerAction = [
    "setMarker",
    "Set Marker",
    "\a3\ui_f\data\map\markers\military\circle_ca.paa",
    { // Statement
		params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];

		[_position, _hoveredEntity] spawn {
			
			params ["_position", "_hoveredEntity"];
			disableSerialization;
			
			_display = (findDisplay 312) createDisplay "RscDisplayEmpty";
			_ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
			_ctrlBackground = _display ctrlCreate ["RscTextMulti", -1, _ctrlGroup];
			IDD_EDIT_BOX = 123;
			_ctrlEdit = _display ctrlCreate ["RscEdit", IDD_EDIT_BOX, _ctrlGroup];
			_ctrlButton = _display ctrlCreate ["RscButtonMenuOK", -1, _ctrlGroup];

			_ctrlGroup ctrlSetPosition [0.5, 0.5, 0, 0];
			_ctrlGroup ctrlCommit 0;

			_ctrlBackground ctrlSetPosition [0, 0, 0.43, 0.12];
			_ctrlBackground ctrlSetBackgroundColor [0, 0, 0, 0.7];
			_ctrlBackground ctrlSetText "Text";
			_ctrlBackground ctrlEnable false;
			_ctrlBackground ctrlCommit 0;

			_ctrlEdit ctrlSetPosition [0.01, 0.05, 0.33, 0.05];
			_ctrlEdit ctrlSetBackgroundColor [0, 0, 0, 0.5];
			_ctrlEdit ctrlCommit 0;

			_ctrlButton ctrlSetPosition [0.35, 0.05, 0.07, 0.05];
			_ctrlButton ctrlSetBackgroundColor [0, 1, 0, 0.7];
			_ctrlButton ctrlSetActiveColor [1,1,1,1];
			_ctrlButton ctrlCommit 0;
			_ctrlButton ctrlSetText "OK";

			_ctrlButton setVariable ["_position", _position];
			_ctrlButton setVariable ["_hoveredEntity", _hoveredEntity];
			
			_ctrlButton ctrlAddEventHandler ["ButtonClick", {
				params ["_ctrl"];
				_display = ctrlParent _ctrl;
				_text = ctrlText (_display displayCtrl IDD_EDIT_BOX);
				if (_text != "") then {

					private _position = _ctrl getVariable ["_position", [0,0,0]];
					private _hoveredEntity = _ctrl getVariable ["_hoveredEntity", objNull];
					private _target = [_hoveredEntity, _position] select (_hoveredEntity isEqualTo objNull);

					private _curatorIconID = [ getAssignedCuratorLogic player, ["", [1,1,1,1], _ctrl getVariable ["_position", [0,0,0]], 1, 1, 45, _text, 1, 0.05, "TahomaB"], true, true] call BIS_fnc_addCuratorIcon;	
					uiNamespace setVariable ["SAA_curatorsIconsCount", (uiNamespace getVariable ["SAA_curatorsIconsCount", 0]) + 1];
					_markerAction = "removeMarkerAction" + str (uiNamespace getVariable ["SAA_curatorsIconsCount", 0]);

					private _removeMarkerAction = [
						_markerAction,
						_text,
						"",
						{
							params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
							_args params ["_markerAction", "_curatorIconID"];
							[getAssignedCuratorLogic player, _curatorIconID] call BIS_fnc_removeCuratorIcon;
							["removeMarkerRoot", _markerAction] call zen_context_menu_fnc_removeAction;
						},
						{true},
						[_markerAction, _curatorIconID]
					] call zen_context_menu_fnc_createAction;
					[_removeMarkerAction, ["removeMarkerRoot"], _curatorIconID] call zen_context_menu_fnc_addAction
				};
				_display closeDisplay 1;
			}];

			ctrlSetFocus _ctrlEdit;

			_ctrlGroup ctrlSetPosition [0.25, 0.25, 0.5, 0.5];
			_ctrlGroup ctrlCommit 0;
		};
	}
] call zen_context_menu_fnc_createAction;
[_setMarkerAction, [], 1] call zen_context_menu_fnc_addAction;

private _removeMarkerRootAction = [
    "removeMarkerRoot",
    "Remove Markers",
    "\a3\ui_f\data\map\markers\military\objective_ca.paa",
    {}
] call zen_context_menu_fnc_createAction;
[_removeMarkerRootAction, [], 0] call zen_context_menu_fnc_addAction;