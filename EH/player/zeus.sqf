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
	if (_entity isKindOf "Air") then {
		clearWeaponCargoGlobal _entity;
		clearMagazineCargoGlobal _entity;
		clearItemCargoGlobal _entity;
	};
	if (_entity isKindOf "Man") then {
		if !((groupOwner group _entity) isEqualTo 2) then {
			[{
				[[group effectiveCommander (_this # 0)], {(_this # 0) setGroupOwner 2}] remoteExec ["call", 2];
			}, [_entity], 1] call CBA_fnc_waitAndExecute;
		};
	};
}];

//
_EH_CuratorRegistered = _zeusLogic addEventHandler ["CuratorObjectRegistered", {
	params ["_curator", "_input"];
	
	[_curator, [1,[0,0,0],50]] remoteExec ["addCuratorEditingArea", 2];
	[_curator, false] remoteExec ["setCuratorEditingAreaType", 2];
}];

//
with uiNamespace do {
	ctrlLock = findDisplay 12 ctrlCreate ["RscButton", -1];
	ctrlLock ctrlSetPosition [safeZoneX + safeZoneW - 0.2, safeZoneY + 0.1, 0.15, 0.05];
	ctrlLock ctrlCommit 0;
	ctrlLock ctrlSetText "LOCK SERVER";
	ctrlLock ctrlAddEventHandler ["ButtonDown",	{	
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