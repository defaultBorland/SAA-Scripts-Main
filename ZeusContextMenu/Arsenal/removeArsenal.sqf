private _removeArsenal = [
    "RemoveArsenal",
    localize "STR_SAA_ZEUS_MODULES_MAIN_REMOVE_ARSENAL_MODULENAME",
    "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_cancel_ca.paa",
    {   // Statement
        params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];

        [_hoveredEntity, true] call ace_arsenal_fnc_removeBox;
        _hoveredEntity setVariable ["SAA_isArsenal", false, true];

        private _jipID = _hoveredEntity getVariable ["SAA_arsenalJIP", ""];
        remoteExec ["", _jipID];

        [localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_MAIN_REMOVE_ARSENAL_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
    }, 
    { // Condition
        params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];

        (player getVariable ["SAA_Context_Toggled", false]) &&
        {_hoveredEntity isEqualType objNull} && 
		{_hoveredEntity isNotEqualTo objNull} && 
        {_hoveredEntity getVariable ["SAA_isArsenal", false]}
    }
] call zen_context_menu_fnc_createAction;
private _removeArsenalActionPath = [_removeArsenal, [], 0] call zen_context_menu_fnc_addAction;
// player setVariable ["SAA_zenContextActions", [_removeArsenalActionPath]];