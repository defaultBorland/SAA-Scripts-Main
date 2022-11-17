// Zeus handlers

//
if (player getVariable ["SAA_zeus_init_complete", false]) exitWith {};
// 
_zeusLogic = getAssignedCuratorLogic player;

//
_EH_ObjectPlaced = _zeusLogic addEventHandler ["CuratorObjectPlaced", {
	params ["_curator", "_entity"];

	if (_entity isKindOf "LandVehicle") then {
		[_entity, true, true, true, true] call Shadec_fnc_clearContainerInventory;
		_entity setFuel ((random [18, 33, 65]) / 100);
	};

	if (_entity isKindOf "Air") then {
		[_entity, true, true, true, true] call Shadec_fnc_clearContainerInventory;
		_entity addBackpackCargoGlobal ["B_Parachute", 8];
	};

	if (_entity isKindOf "Ship") then {
		[_entity, true, true, true, true] call Shadec_fnc_clearContainerInventory;
		_entity setFuel ((random [18, 33, 65]) / 100);
	};

	if (_entity isKindOf "Man") then {
		private _group = group effectiveCommander _entity;
		[{
			params ["_group"];
			[[_group], {
				if !((groupOwner (_this # 0)) isEqualTo 2) then {
				(_this # 0) setGroupOwner 2;
			};
			}] remoteExec ["call", 2];
		}, [_group], 1] call CBA_fnc_waitAndExecute;
	};
}];

//
_EH_CuratorRegistered = _zeusLogic addEventHandler ["CuratorObjectRegistered", {
	params ["_curator", "_cfgClasses"];
	
	//
	[_curator, [1,[0,0,0],50]] remoteExec ["addCuratorEditingArea", 2];
	[_curator, false] remoteExec ["setCuratorEditingAreaType", 2];

	//
	private _blockedModules = ["ModuleEndMission_F", "ModuleOrdnanceHowitzer_F", "ModuleOrdnanceMortar_F", "ModuleOrdnanceRocket_F", "ModuleOrdnance_F", "ModuleRespawnInventory_F", "ModuleRespawnPositionCiv_F", "ModuleRespawnPositionEast_F", "ModuleRespawnPositionGuer_F", "ModuleRespawnPositionWest_F", "ModuleRespawnPosition_F", "ModuleRespawnTickets_F", "ModuleRespawnVehicle_F", "ModuleVehicleRespawnPositionCiv_F", "ModuleVehicleRespawnPositionEast_F", "ModuleVehicleRespawnPositionGuer_F", "ModuleVehicleRespawnPositionWest_F", "ModuleCASBomb_F", "ModuleCASGunMissile_F", "ModuleCASGun_F", "ModuleCASMissile_F", "ModuleCAS_F", "ModuleCountdown_F"];
	_output = [];

	{
		private _module = if (_x in _blockedModules) then {[false, 0]} else {[true, 0]};
		_output pushBack _module;
	} forEach _cfgClasses;

	_output
}];

//
[] call Shadec_fnc_addContextActions;
[] call Shadec_fnc_addZeusModules;

[] execVM "Mechanics\ZeusContextActions\ZeusContextActions_On.sqf";
[] execVM "Mechanics\ZeusContextActions\ZeusContextActions_Off.sqf";

//
with uiNamespace do {
	disableSerialization;
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

player setVariable ["SAA_zeus_init_complete", true];