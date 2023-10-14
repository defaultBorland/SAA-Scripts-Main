// Local exec only
if (!hasInterface) exitWith {diag_log "fnc_setGPSWorkability | Client only local function"};

disableSerialization;

fnc_placeHolder = {
	params["_display", "_state", "_isDialog"];

	if (!isNull (_display displayCtrl 7770000)) then {ctrlDelete (_display displayCtrl 7770000)};
	if (_state) exitWith {};

	private _xPart = 0;
	private _yPart = 0;
	private _wPart = 0;
	private _hPart = 0;

	if (_isDialog) then {
		_xPart = (((60 - 25)/2) + (0)) * (safeZoneH / 64) + (safezoneX + (safezoneW - safeZoneH)/2);
		_yPart = (0 + (2)) * (safeZoneH / 36) + (safezoneY + (safezoneH - (safeZoneH / 1.2))/2);
		_wPart = (25) * (safeZoneH / 64);
		_hPart = (19) * (safeZoneH / 36);
	} else {
		private _profileX = profilenamespace getVariable ['IGUI_grid_ACE_microDagr_X', 0];
		private _profileY = profilenamespace getVariable ['IGUI_grid_ACE_microDagr_Y', 0];
		private _profileW = profilenamespace getVariable ['IGUI_grid_ACE_microDagr_W', 1];
		private _profileH = (16/9) * (profilenamespace getVariable ['IGUI_grid_ACE_microDagr_W', 1]);

		_xPart = 0 / 25 * _profileW + _profileX;
		_yPart = 2 / 25 * _profileH + _profileY;
		_wPart = 25 / 25 * _profileW;
		_hPart = 19 / 25 * _profileH;
	};

	private _ctrl = _display ctrlCreate ["RscPicture", 7770000];
	_ctrl ctrlSetPosition [
		_xPart,
		_yPart,
		_wPart,
		_hPart
	];
	_ctrl ctrlSetText "img\noSignal_black.paa";
	_ctrl ctrlCommit 0;
};

params["_state"];

// Toggle ACE MicroDAGR
[_state] spawn {
	params ["_state"];

	// Wait for JIP players MicroDAGR settings to load
	waitUntil {!(isNil "ace_microdagr_currentShowMode")};

	while {true} do {
		waitUntil {
			ace_microdagr_currentShowMode in [1, 2] 
		|| (!(missionNamespace getVariable ["SAA_isGPSDisabled", false])) isNotEqualTo _state
		}; // Waiting for display to change to visible states
		_state = !(missionNamespace getVariable ["SAA_isGPSDisabled", false]);

		private _display = uiNamespace getVariable [["ace_microdagr_RscTitleDisplay", "ace_microdagr_DialogDisplay"] select (ace_microdagr_currentShowMode == 2), displayNull];
		if (isNull _display) then { break };

		private _topMenuButton = _display displayCtrl 144030;
		_topMenuButton ctrlEnable _state;

		if (ace_microdagr_currentApplicationPage isEqualTo 2) then {
			private _map = _display displayCtrl ([77702, 77703] select ace_microdagr_mapShowTexture);
			private _buttonTrack = _display displayCtrl 144211;
			private _buttonZoomIn = _display displayCtrl 144212;
			private _buttonZoomOut = _display displayCtrl 144213;
			_map ctrlShow _state; 
			_buttonTrack ctrlEnable _state;
			_buttonZoomIn ctrlEnable _state;
			_buttonZoomOut ctrlEnable _state;

			[_display, _state, ace_microdagr_currentShowMode isEqualTo 2] call fnc_placeHolder;
		};

		if (ace_microdagr_currentApplicationPage isEqualTo 0) then {
			private _infoDisplay = _display displayCtrl 144000;
			_infoDisplay ctrlShow _state;

			// private _utmgrid = _display displayCtrl 144001;
			// private _easting = _display displayCtrl 144002;
			// private _northing = _display displayCtrl 144003;
			// _utmgrid ctrlShow _state;
			// _easting ctrlShow _state;
			// _northing ctrlShow _state;

			[_display, _state, ace_microdagr_currentShowMode isEqualTo 2] call fnc_placeHolder;
		};

		if (ace_microdagr_currentApplicationPage isEqualTo 1) then {
			[_display, true, ace_microdagr_currentShowMode isEqualTo 2] call fnc_placeHolder;
		};

		private _showMode = ace_microdagr_currentShowMode;
		private _appPage = ace_microdagr_currentApplicationPage;
		private _mapMode = ace_microdagr_mapShowTexture;

		waitUntil {
			ace_microdagr_currentShowMode isNotEqualTo _showMode 
			|| _mapMode isNotEqualTo ace_microdagr_mapShowTexture 
			|| _appPage isNotEqualTo ace_microdagr_currentApplicationPage 
			|| (!(missionNamespace getVariable ["SAA_isGPSDisabled", false])) isNotEqualTo _state
		}; // Waiting for display to change to another visible state
		_state = !(missionNamespace getVariable ["SAA_isGPSDisabled", false]);

		private _display = uiNamespace getVariable [["ace_microdagr_RscTitleDisplay", "ace_microdagr_DialogDisplay"] select (ace_microdagr_currentShowMode == 2), displayNull];
		if (isNull _display) then {continue};

		if (ace_microdagr_currentApplicationPage isEqualTo 2) then {
			private _map = _display displayCtrl ([77702, 77703] select ace_microdagr_mapShowTexture);
			private _buttonTrack = _display displayCtrl 144211;
			private _buttonZoomIn = _display displayCtrl 144212;
			private _buttonZoomOut = _display displayCtrl 144213;
			_map ctrlShow _state; 
			_buttonTrack ctrlEnable _state;
			_buttonZoomIn ctrlEnable _state;
			_buttonZoomOut ctrlEnable _state;

			[_display, _state, ace_microdagr_currentShowMode isEqualTo 2] call fnc_placeHolder;
		};

		if (ace_microdagr_currentApplicationPage isEqualTo 1) then {
			[_display, true, ace_microdagr_currentShowMode isEqualTo 2] call fnc_placeHolder;
		};

		if (ace_microdagr_currentApplicationPage isEqualTo 0) then {
			private _infoDisplay = _display displayCtrl 144000;
			_infoDisplay ctrlShow _state;

			// private _utmgrid = _display displayCtrl 144001;
			// private _easting = _display displayCtrl 144002;
			// private _northing = _display displayCtrl 144003;
			// _utmgrid ctrlShow _state;
			// _easting ctrlShow _state;
			// _northing ctrlShow _state;

			[_display, _state, ace_microdagr_currentShowMode isEqualTo 2] call fnc_placeHolder;
		};

		if (!(missionNamespace getVariable ["SAA_isGPSDisabled", false])) then { break };
		sleep 0.1;
	};
};