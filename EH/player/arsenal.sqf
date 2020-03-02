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
    player setVariable["isArsenalOpen", true];
	private _uid = getPlayerUID player;
	if !(_uid in (missionNamespace getVariable "ZeusArray")) then {["save"] call Shadec_fnc_gearList};

    [_this # 0] spawn {
        params ["_display"];
        
        _counter = 0;
        _textsArray = [
            "АРСЕНАЛ ПРЕДНАЗНАЧЕН ТОЛЬКО ДЛЯ СМЕНЫ ОДЕЖДЫ. ПРИ ПОПЫТКЕ ИЗМЕНИТЬ СНАРЯЖЕНИЕ - ЕГО ВЕРНЕТ К ИСХОДНОМУ СОСТОЯНИЮ.",
            "ЕСЛИ У ВАС В ОБМУНДИРОВАНИИ ЕСТЬ НЕПОЛНЫЕ МАГАЗИНЫ - ВЫ НЕ СМОЖЕТЕ ЕГО СМЕНИТЬ, ВЫЛОЖИТЕ ИХ.",
            "ЕСЛИ У ВАС В ОБМУНДИРОВАНИИ ЕСТЬ ОРУЖИЕ С МОДУЛЯМИ - СНИМИТЕ ИХ, СМЕНА ЭКИПИРОВКИ ПРИВЕДЕТ К ИХ ПОТЕРЕ.",
            "ВО ИЗБЕЖАНИЕ НЕДОПОНИМАНИЯ СО СТОРОНЫ СОРАТНИКОВ - НОСИТЕ ОДИНАКОВУЮ ФОРМУ, ПРЕДЛОЖЕННУЮ В АРСЕНАЛЕ, И НЕ НАДЕВАЙТЕ ФОРМУ ПРОТИВНИКА."
        ];

        while {player getVariable ["isArsenalOpen", false]} do {
            if (_counter == count _textsArray) then {_counter = 0};
            sleep 7;
            [_display, _textsArray # _counter] call ace_arsenal_fnc_message;
            _counter = _counter + 1;
        };
    };

    
}] call CBA_fnc_addEventHandler;

// ACE Arsenal Handler Closed
_EH_ArsenalClose = ["ace_arsenal_displayClosed", {
    player setVariable["isArsenalOpen", false];
    private _uid = getPlayerUID player;
   if !(_uid in (missionNamespace getVariable "ZeusArray")) then {["load"] call Shadec_fnc_gearList};
}] call CBA_fnc_addEventHandler;