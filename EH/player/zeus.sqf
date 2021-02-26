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
	
	[_zeusLogic,[1,[0,0,0],50]] remoteExec ["addCuratorEditingArea", 2];
	[_zeusLogic, false] remoteExec ["setCuratorEditingAreaType", 2];

}];