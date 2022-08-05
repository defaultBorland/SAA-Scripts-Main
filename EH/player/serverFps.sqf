with uiNamespace do {

	ctrlMonitor = findDisplay 12 ctrlCreate ["RscButton", -1];
	ctrlMonitor ctrlSetPosition [safeZoneX + safeZoneW - 0.2, safeZoneY + 0.1 + 0.05 + 0.02, 0.15, 0.05];
	ctrlMonitor ctrlCommit 0;
	ctrlMonitor ctrlSetText "SERVER FPS";
	ctrlMonitor ctrlAddEventHandler ["ButtonDown",
	{	
		params ["_ctrl"];
		{
			private _fps = round diag_fps;
			private _text = if (_fps > 24) then {"OK"} else {"BAD"};

			[format["> Server: FPS - %1 (%2)", _fps, _text]] remoteExec ["systemChat", remoteExecutedOwner];
			["Server FPS: " + str _fps] call Shadec_fnc_createLogServer;
		} remoteExec ["call", 2];
	}];
};