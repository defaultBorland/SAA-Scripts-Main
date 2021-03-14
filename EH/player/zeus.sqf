// Zeus handlers

// 
_zeusLogic = (getAssignedCuratorLogic player);

//
_EH_ObjectPlaced = _zeusLogic addEventHandler ["CuratorObjectPlaced", {
	params ["_curator", "_entity"];

	if (_entity isKindOf "LandVehicle") then {
		clearWeaponCargoGlobal _entity;
		clearMagazineCargoGlobal _entity;
		clearItemCargoGlobal _entity;
		clearBackpackCargoGlobal _entity;
	};
	if (_entity isKindOf "Air" ) then {
		clearWeaponCargoGlobal _entity;
		clearMagazineCargoGlobal _entity;
		clearItemCargoGlobal _entity;
	};
	
}];

//
_EH_CuratorRegistered = _zeusLogic addEventHandler ["CuratorObjectRegistered", {
	params ["_curator", "_input"];
	
	[_this, [1,[0,0,0],50]] remoteExec ["addCuratorEditingArea", 2];
	[_this, false] remoteExec ["setCuratorEditingAreaType", 2];

}];

//
with uiNamespace do {
	ctrl = findDisplay 12 ctrlCreate ["RscButton", -1];
	ctrl ctrlSetPosition [safeZoneX + safeZoneW - 0.2,safeZoneY + 0.1,0.15,0.05];
	ctrl ctrlCommit 0;
	ctrl ctrlSetText "LOCK SERVER";
	ctrl ctrlAddEventHandler ["ButtonDown",
	{	
		params ["_ctrl"];
		if (ctrlText _ctrl isEqualTo "LOCK SERVER") then {
			{"f5znFms2" serverCommand "#lock"} remoteExec ["call", 2];
			_ctrl ctrlSetText "UNLOCK SERVER";
			["> Server: Server locked."] remoteExec ["systemChat"];
		} else {
			{"f5znFms2" serverCommand "#unlock"} remoteExec ["call", 2];
			_ctrl ctrlSetText "LOCK SERVER";
			["> Server: Server unlocked."] remoteExec ["systemChat"];
		};
	}];
};