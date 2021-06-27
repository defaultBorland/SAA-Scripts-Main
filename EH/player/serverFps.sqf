with uiNamespace do {

	ctrlMonitor = findDisplay 12 ctrlCreate ["RscButton", -1];
	ctrlMonitor ctrlSetPosition [safeZoneX + safeZoneW - 0.2, safeZoneY + 0.1 + 0.05 + 0.02, 0.15, 0.05];
	ctrlMonitor ctrlCommit 0;
	ctrlMonitor ctrlSetText "SERVER FPS";
	ctrlMonitor ctrlAddEventHandler ["ButtonDown",
	{	
		params ["_ctrl"];
		{
			[format["> Server: FPS - %1 (OK > 25)", diag_fps]] remoteExec ["systemChat", remoteExecutedOwner];
			"debug_console" callExtension (("Server FPS: " + str diag_fps) + "#1111");
		} remoteExec ["call", 2];
	}];
};