with uiNamespace do {

	private _ctrlMonitor = findDisplay 12 ctrlCreate ["RscButton", -1];
	_ctrlMonitor ctrlSetPosition [safeZoneX + safeZoneW - 0.2, safeZoneY + 0.1 + 0.05 + 0.02, 0.15, 0.05];
	_ctrlMonitor ctrlCommit 0;
	_ctrlMonitor ctrlSetText "SERVER FPS";
	_ctrlMonitor ctrlSetTooltip "Max: 50 | OK: > 25";
	_ctrlMonitor ctrlAddEventHandler ["ButtonDown",
	{	
		params ["_ctrl"];
		{
			private _fps = round diag_fps;
			private _text = if (_fps > 24) then {"OK"} else {"BAD"};

			[format["> Server: FPS - %1 (%2)", _fps, _text]] remoteExec ["systemChat", remoteExecutedOwner];

			private _hcs = [] call Shadec_fnc_getHeadlessInfo;
			
			private _text = _hcs apply {
				format["%1 U:%2 - FPS: %3", 
				_x # 0, 
				[_x # 1, 3, " "] call Shadec_fnc_leftPad, 
				[_x # 2, 2, " "] call Shadec_fnc_leftPad]
			} joinString " | ";
			[_text] call Shadec_fnc_createLogServer;
		} remoteExec ["call", 2];
	}];
};