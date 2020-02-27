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
    hint "";
	private _uid = getPlayerUID player;
	if !(_uid in (missionNamespace getVariable "ZeusArray")) then {["save"] call Shadec_fnc_gearList};

    // disableSerialization;
    // _text = (_this # 0) ctrlCreate ["RscStructuredText", -1];
    // _text ctrlSetPosition [safeZoneX + 0.1,safeZoneX + safeZoneY - 0.1,0.8,0.2];
    // _text ctrlSetBackgroundColor [0, 0, 0, 0.4];
    // _text ctrlSetTextColor [1,0,0,1];
    // _text ctrlSetStructuredText parseText "<t>Hey there, it works... for now</t>";
    // _text ctrlCommit 0;

}] call CBA_fnc_addEventHandler;

// ACE Arsenal Handler Closed
_EH_ArsenalClose = ["ace_arsenal_displayClosed", {
    private _uid = getPlayerUID player;
   if !(_uid in (missionNamespace getVariable "ZeusArray")) then {["load"] call Shadec_fnc_gearList};
}] call CBA_fnc_addEventHandler;