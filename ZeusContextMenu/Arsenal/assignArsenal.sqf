private _assignArsenalRoot = [
    "AssignArsenal",
    localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_MODULENAME",
    "\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\uniform_ca.paa",
    {}, // Statement
    { // Condition
        params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];

        (player getVariable ["SAA_Context_Toggled", false]) &&
        {_hoveredEntity isEqualType objNull} && 
		{_hoveredEntity isNotEqualTo objNull} && 
        {!(_hoveredEntity isKindOf "Man")} &&
        {!(_hoveredEntity getVariable ["SAA_isArsenal", false])}
    }, 
    [], 
    { // Children
        private _childActions = [];

        {
            _x params ["_displayName", "_type"];

            private _priority = 6 - _forEachIndex;
            private _assignArsenalActionName = format ["%1_%2_%3", "assignArsenal", _type, _priority];
            private _assignArsenalType = [
                _assignArsenalActionName,
                localize _displayName,
                "",
                { // Statement
                    params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];
                    _args params ["_type"];

                    [[_hoveredEntity, _type, true, true], Shadec_fnc_addShadecArsenal] remoteExec ["call", 2];
                    [localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
                },
                { // Condition
                    true
                },
                [ // Args
                    _type
                ]
            ] call zen_context_menu_fnc_createAction;
            _childActions pushBack [_assignArsenalType, [], _priority];
        } forEach [
            ["STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_UNIFORMTYPE_ARID", "Arid"], 
            ["STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_UNIFORMTYPE_SEMIARID", "Semiarid"], 
            ["STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_UNIFORMTYPE_FOREST", "Forest"], 
            ["STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_UNIFORMTYPE_WINTER", "Winter"], 
            ["STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_UNIFORMTYPE_BLACK", "Black"], 
            ["STR_SAA_ZEUS_MODULES_MAIN_ADD_ARSENAL_UNIFORMTYPE_ALL", "All"]
        ];

        _childActions
    }
] call zen_context_menu_fnc_createAction;
private _assignArsenalActionPath = [_assignArsenalRoot, [], 0] call zen_context_menu_fnc_addAction;