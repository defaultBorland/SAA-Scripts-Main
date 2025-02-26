#include "\a3\ui_f\hpp\definedikcodes.inc"
([] call BIS_fnc_GUIGrid) params ["", "", "_GUI_GRID_W", "_GUI_GRID_H"];
_GUI_GRID_W = _GUI_GRID_W / 40;
_GUI_GRID_H = _GUI_GRID_H / 25;

// Register EH to recieve updates from server while zeus is open and toggle is on
private _EH_ServerFpsMonitoring_ID = ["SAA_ServerFpsMonitoring", {
    _thisArgs params ["_GUI_GRID_W", "_GUI_GRID_H"];
    _this params ["_serverHcsFpsInfo"];

    if (!isNull (findDisplay 312)) then {
        _curatorDisplay = findDisplay 312;
        
        private _controlGroup = _curatorDisplay displayCtrl 54473860;
        if (!isNull _controlGroup) then {ctrlDelete _controlGroup};

        _screenshotMode = uiNamespace getVariable ["RscDisplayCurator_screenshotMode", false];
        if (_screenshotMode) exitWith {};

        _controlGroup = _curatorDisplay ctrlCreate ["RscControlsGroupNoScrollbars", 54473860];
        _controlGroup ctrlSetPosition [
            safezoneX + safezoneW - 21 * _GUI_GRID_W,
            safeZoneY + 1.6 * _GUI_GRID_H,
            9 * _GUI_GRID_W,
            10 * _GUI_GRID_H
        ];
        _controlGroup ctrlCommit 0;

        private _totalBots = [_serverHcsFpsInfo apply {_x # 1}] call Shadec_fnc_sumArray;
        private _totalBotsWarningColor = ["#ffffff", "#ff0000"] select (_totalBots > 250);

        private _textsArray = _serverHcsFpsInfo apply {
            parseText format[
                "<t color='%5'>%1</t><t> | UNITS: </t><t color='%4'>%2</t><t> | FPS: </t><t color='%5'>%3</t>",
                [_x # 0, 6, " "] call Shadec_fnc_leftPad,
                [_x # 1, 3, " "] call Shadec_fnc_leftPad,
                [_x # 2, 2, " "] call Shadec_fnc_leftPad,
                _totalBotsWarningColor,
                "#ffffff"
                //["#ffffff", "#ff0000"] select ((parseNumber str(_x # 2)) < 25)
            ];
        };
        {
            private _ctrlBG = _curatorDisplay ctrlCreate ["RscStructuredText", -1, _controlGroup];
            _ctrlBG ctrlSetPosition [0, 1.1 * _GUI_GRID_H * _forEachIndex, 9 * _GUI_GRID_W, 1 * _GUI_GRID_H];
            _ctrlBG ctrlSetBackgroundColor [0, 0, 0, 0.3];
            _ctrlBG ctrlCommit 0;

            private _ctrl = _curatorDisplay ctrlCreate ["RscStructuredText", -1, _controlGroup];
            _ctrl ctrlSetPosition [0, 1.1 * _GUI_GRID_H * _forEachIndex, 9 * _GUI_GRID_W, 1 * _GUI_GRID_H];
            _ctrl ctrlSetStructuredText _x;
            _ctrl ctrlCommit 0;
        } forEach _textsArray;
        

        // Do not recreate eh attached to display (not ctrl) on each info update
        private _screenshotMode_EH_ID = _curatorDisplay getVariable ["SAA_screenshotMode_EH_ID", 0];
        if (_screenshotMode_EH_ID isNotEqualTo 0) exitWith {};
	    
        _screenshotMode_EH_ID = _curatorDisplay displayAddEventHandler ["KeyDown", {
            params ["_curatorDisplay", "_key"];
            if (_key in actionkeys 'curatorToggleInterface') then {
                _screenshotMode = uiNamespace getVariable ["RscDisplayCurator_screenshotMode", false];
                _controlGroup = _curatorDisplay displayCtrl 54473860;
                _controlGroup ctrlShow _screenshotMode;
                _controlGroup ctrlCommit 0;
            };
        }];
        _curatorDisplay setVariable ["SAA_screenshotMode_EH_ID", _screenshotMode_EH_ID];

        _curatorDisplay displayAddEventHandler ["Unload", {
			params ["_display", "_exitCode"];

			private _screenshotMode_EH_ID = _display getVariable ["SAA_screenshotMode_EH_ID", 0];
			["SAA_screenshotMode_EH_ID", _screenshotMode_EH_ID] call CBA_fnc_removeEventHandler;
		}];
    };
}, [_GUI_GRID_W, _GUI_GRID_H]] call CBA_fnc_addEventHandlerArgs;
player setVariable ["SAA_ServerFpsMonitoring_EH_ID", _EH_ServerFpsMonitoring_ID];