// Arsenal Handlers
// Restirct BIS Arsenal and Handle Ace Arsenal (Players are not allowed to 
// take any item from arsenal except uniform/vest/backpack/glasses/helmet/radio)

// BIS Arsenal Handler
[missionNamespace, "arsenalOpened", {
    disableSerialization;
    _display = _this select 0;
    _display closeDisplay 1;
	hint "BIS Arsenal is not allowed.";
}] call BIS_fnc_addScriptedEventHandler;

// ACE Arsenal Handler Opened
_EH_ArsenalOpened = ["ace_arsenal_displayOpened", {
    params ["_display"];
    disableSerialization;

    hint "";
    player setVariable["isArsenalOpened", true, true];
	["save"] call Shadec_fnc_gearList;

    _display call Shadec_fnc_hideBottomButtons;
    _display call Shadec_fnc_hideLeftPanelButtons;
    _display call Shadec_fnc_repositionArsenalButtons;

    [[player], {
        backpackContainer (_this # 0) lockInventory true;
    }] remoteExec ["call", -2];
    
}] call CBA_fnc_addEventHandler;

_EH_LeftPanelFilled = ["ace_arsenal_leftPanelFilled", {
	params ["_display", "_leftPanelIDC", "_rightPanelIDC"];
	disableSerialization;

    if (_leftPanelIDC isEqualTo 2002) then {
        [_display] call ace_arsenal_fnc_buttonStats;
        [_display, false] call Shadec_fnc_toggleLeftPanel;
    } else {
        [_display, true] call Shadec_fnc_toggleLeftPanel;
    };

    if (_leftPanelIDC in [2010, 2012, 2014]) then { // Uniforms, Vests, Backpacks
        private _ctrlLbLeftPanel = _display displayCtrl 13;
        [_ctrlLbLeftPanel, (_leftPanelIDC - 2010) / 2] call Shadec_fnc_addCapacityTooltips;
    };

}] call CBA_fnc_addEventHandler;

_EH_RightPanelFilled = ["ace_arsenal_rightPanelFilled", {
	params ["_display", "_leftPanelIDC", "_rightPanelIDC"];
	disableSerialization;

    _display call Shadec_fnc_hideRightPanel;

}] call CBA_fnc_addEventHandler;

// ACE Arsenal Handler Closed
_EH_ArsenalClose = ["ace_arsenal_displayClosed", {
    player setVariable ["isArsenalOpened", false, true];

    ["load"] call Shadec_fnc_gearList;
    player setSpeaker "ACE_NoVoice";

    [[player], {
        backpackContainer (_this # 0) lockInventory false;
    }] remoteExec ["call", -2];

}] call CBA_fnc_addEventHandler;

//
_EH_BackpackOpened = player addEventHandler ["InventoryOpened", {
	params ["_unit", "_container"];

    private _allPlayersBackpacks = allPlayers apply {backpackContainer _x};
    if !(_container in _allPlayersBackpacks) exitWith {};
    private _player = (allPlayers select {(backpackContainer _x) isEqualTo _container}) # 0;

    [_player] spawn {
        params ["_player"];
        [{ // condition
            !(isNull (findDisplay 602))
        }, { // statement
            params ["_player"];

            [_player] spawn {
                params ["_player"];

                while {!isNull (findDisplay 602)} do {
                    if (_player getVariable ["isArsenalOpened", false]) exitWith {
                        closeDialog 602; true;
                    };
                    sleep 0.5;
                };
            };           
        }, [_player], 3, {}] call CBA_fnc_waitUntilAndExecute;
    };
}];