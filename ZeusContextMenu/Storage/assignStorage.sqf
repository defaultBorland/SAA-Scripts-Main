private _assignStorage = [
    "AssignStorage",
    localize "STR_SAA_ZEUS_MODULES_STORAGE_ASSIGN_STORAGE_MODULENAME",
    "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\box_ca.paa",
    {	// Statement
		params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];

		[[_hoveredEntity, true], Shadec_fnc_assignStorage] remoteExec ["call", 2];
		[localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_STORAGE_ASSIGN_STORAGE_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
	}, 
    { // Condition
        params ["_position", "_objects", "_groups", "_waypoints", "_markers", "_hoveredEntity", "_args"];

        (player getVariable ["SAA_Context_Toggled", false]) &&
        {_hoveredEntity isEqualType objNull} && 
		{_hoveredEntity isNotEqualTo objNull} && 
        {!(_hoveredEntity isKindOf "Man")} &&
        {!(_hoveredEntity getVariable ["SAA_isStorageProxy", false])}
    }
] call zen_context_menu_fnc_createAction;
private _assignStorageActionPath = [_assignStorage, [], 0] call zen_context_menu_fnc_addAction;