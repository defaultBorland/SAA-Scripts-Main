// Zeus handlers

//
if (player getVariable ["SAA_zeus_init_complete", false]) exitWith {};
// 
_zeusLogic = getAssignedCuratorLogic player;

//
_EH_ObjectPlaced = _zeusLogic addEventHandler ["CuratorObjectPlaced", {
	params ["_curator", "_entity"];

	if (_entity isKindOf "LandVehicle" || _entity isKindOf "Air" || _entity isKindOf "Ship") then {
		_entity setVariable ["ace_rearm_scriptedLoadout", true, true];
		if (player getVariable ["SAA_TransferAI_Toggled", true]) then {
			[_entity] call Shadec_fnc_transferVehicleOwnership;
		};
	};

	// if (_entity isKindOf "Man") then {
	// 	private _group = group effectiveCommander _entity;
	// 	if (count units _group > 1) exitWith {};
	// 	[_group] call Shadec_fnc_transferGroupOwnership;
	// };

	if (_entity isKindOf "Man") then {

		if (player getVariable ["SAA_TransferAI_Toggled", true]) then {

			private _leader = effectiveCommander _entity;
			if (_entity isEqualTo _leader) then {
				private _group = group _leader;
				[_group] call Shadec_fnc_transferGroupOwnership;
			};

		};
	};
}];

// _EH_GroupPlaced = _zeusLogic addEventHandler ["CuratorGroupPlaced", {
// 	params ["_curator", "_group"];
// 	[_group] call Shadec_fnc_transferGroupOwnership;
// }];

//
_EH_CuratorRegistered = _zeusLogic addEventHandler ["CuratorObjectRegistered", {
	params ["_curator", "_cfgClasses"];
	
	//
	[_curator, [1,[0,0,0],50]] remoteExec ["addCuratorEditingArea", 2];
	[_curator, false] remoteExec ["setCuratorEditingAreaType", 2];

	//
	private _blockedModules = ["ModuleEndMission_F", "ModuleOrdnanceHowitzer_F", "ModuleOrdnanceMortar_F", "ModuleOrdnanceRocket_F", "ModuleOrdnance_F", "ModuleRespawnInventory_F", "ModuleRespawnPositionCiv_F", "ModuleRespawnPositionEast_F", "ModuleRespawnPositionGuer_F", "ModuleRespawnPositionWest_F", "ModuleRespawnPosition_F", "ModuleRespawnTickets_F", "ModuleRespawnVehicle_F", "ModuleVehicleRespawnPositionCiv_F", "ModuleVehicleRespawnPositionEast_F", "ModuleVehicleRespawnPositionGuer_F", "ModuleVehicleRespawnPositionWest_F", "ModuleCASBomb_F", "ModuleCASGunMissile_F", "ModuleCASGun_F", "ModuleCASMissile_F", "ModuleCAS_F", "ModuleCountdown_F"];
	_blockedModules = _blockedModules + ["UK3CB_T55","UK3CB_B_T55_ADA","UK3CB_B_T55_ADM","UK3CB_B_T55_ANA","UK3CB_B_T55_ARD","UK3CB_B_T55_CHD","UK3CB_B_T55_CDF","UK3CB_B_T55_FIA","UK3CB_B_T55_GAF","UK3CB_B_T55_LNM","UK3CB_B_T55_LSM","UK3CB_B_T55_NAP","UK3CB_B_T55_NFA","UK3CB_B_T55_OLI","UK3CB_B_T55_TKA","UK3CB_B_T55_UN","UK3CB_B_G_T55","UK3CB_B_G_T55_TKM","UK3CB_I_T55_AAF","UK3CB_I_T55_ADA","UK3CB_I_T55_ADM","UK3CB_I_T55_ARD","UK3CB_I_T55_CHD","UK3CB_I_T55_CDF","UK3CB_I_T55_FIA","UK3CB_I_T55_GAF","UK3CB_I_T55_LNM","UK3CB_I_T55_LSM","UK3CB_I_T55_MEE","UK3CB_I_T55_NAP","UK3CB_I_T55_NFA","UK3CB_I_T55_OLI","UK3CB_I_T55_TKA","UK3CB_I_T55_UN","UK3CB_I_G_T55","UK3CB_I_T55_CHK","UK3CB_I_G_T55_TKM","UK3CB_O_T55_AAF","UK3CB_O_T55_ADA","UK3CB_O_T55_ADM","UK3CB_O_T55_ARD","UK3CB_O_T55_CHD","UK3CB_O_T55_CHK","UK3CB_O_T55_CSAT_A","UK3CB_O_T55_CSAT_B","UK3CB_O_T55_CSAT_F","UK3CB_O_T55_CSAT_G","UK3CB_O_T55_CSAT_M","UK3CB_O_T55_CSAT_N","UK3CB_O_T55_CSAT_S","UK3CB_O_T55_CSAT_U","UK3CB_O_T55_CSAT_W","UK3CB_O_T55_FIA","UK3CB_O_T55_GAF","UK3CB_O_T55_LNM","UK3CB_O_T55_LSM","UK3CB_O_T55_MEE","UK3CB_O_T55_NAP","UK3CB_O_T55_NFA","UK3CB_O_T55_OLI","UK3CB_O_T55_SOV","UK3CB_O_T55_TKA","UK3CB_O_G_T55","UK3CB_O_G_T55_TKM","UK3CB_AAF_I_T55","UK3CB_AAF_O_T55","UK3CB_ADA_B_T55","UK3CB_ADA_I_T55","UK3CB_ADA_O_T55","UK3CB_ADM_B_T55","UK3CB_ADM_I_T55","UK3CB_ADM_O_T55","UK3CB_ANA_B_T55","UK3CB_ARD_B_T55","UK3CB_ARD_I_T55","UK3CB_ARD_O_T55","UK3CB_CHD_B_T55","UK3CB_CHD_I_T55","UK3CB_CHD_O_T55","UK3CB_CHD_W_B_T55","UK3CB_CHD_W_I_T55","UK3CB_CHD_W_O_T55","UK3CB_CSAT_A_O_T55","UK3CB_CSAT_B_O_T55","UK3CB_CSAT_G_O_T55","UK3CB_CSAT_F_O_T55","UK3CB_CSAT_N_O_T55","UK3CB_CSAT_M_O_T55","UK3CB_CSAT_U_O_T55","UK3CB_CSAT_S_O_T55","UK3CB_CSAT_W_O_T55","UK3CB_CW_SOV_O_EARLY_T55","UK3CB_CW_SOV_O_LATE_T55","UK3CB_FIA_B_T55","UK3CB_FIA_I_T55","UK3CB_FIA_O_T55","UK3CB_GAF_B_T55","UK3CB_GAF_I_T55","UK3CB_GAF_O_T55","UK3CB_KDF_B_T55","UK3CB_KDF_I_T55","UK3CB_KDF_O_T55","UK3CB_LNM_B_T55","UK3CB_LNM_I_T55","UK3CB_LNM_O_T55","UK3CB_LSM_B_T55","UK3CB_LSM_I_T55","UK3CB_LSM_O_T55","UK3CB_MEE_I_T55","UK3CB_MEE_O_T55","UK3CB_MEI_B_T55","UK3CB_MEI_I_T55","UK3CB_MEI_O_T55","UK3CB_NAP_B_T55","UK3CB_NAP_I_T55","UK3CB_NAP_O_T55","UK3CB_NFA_B_T55","UK3CB_NFA_I_T55","UK3CB_NFA_O_T55","UK3CB_TKA_B_T55","UK3CB_TKA_I_T55","UK3CB_TKA_O_T55","UK3CB_TKM_B_T55","UK3CB_TKM_I_T55","UK3CB_TKM_O_T55","UK3CB_UN_B_T55","UK3CB_UN_I_T55"];
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

[] execVM "Mechanics\Zeus\ContextActions\ZeusContextActions_On.sqf";
[] execVM "Mechanics\Zeus\ContextActions\ZeusContextActions_Off.sqf";
[] execVM "Mechanics\Zeus\PlayersList\PlayersList_Init.sqf";

[] execVM "Mechanics\Zeus\TransferAIToggle\TransferAI_On.sqf";
[] execVM "Mechanics\Zeus\TransferAIToggle\TransferAI_Off.sqf";

[] execVM "Mechanics\Zeus\ShowServerFps\ShowServerFps_On.sqf";
[] execVM "Mechanics\Zeus\ShowServerFps\ShowServerFps_Off.sqf";

[] execVM "Mechanics\Zeus\LockServer\LockServer.sqf";
[] execVM "Mechanics\Zeus\LockServer\UnlockServer.sqf";

player setVariable ["SAA_zeus_init_complete", true];