// On Player Respawn Event Handler

// Player Respawn Event Hanlder
_EH_PlayerRespawn = player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

    // Fill player display with black screen with text
    titleText [format["<t color='#ff0000' size='3' align='center' valign='middle' font='PuristaBold'>%1</t><br/><br/><t size='1.5' align='center' valign='middle' font='EtelkaMonospacePro'>%2</t>", "Back In Action", "Let's try this again..."], "BLACK", 0.2, false, true];
    
    // Create public var and send it to server to trigger event
	playerRespawned = [player, getPlayerUID player];
	publicVariableServer "playerRespawned";
	playerRespawned = nil;
    
    // If player was zeus - reassign modules
    if ((getPlayerUID player) in (missionNamespace getVariable "ZeusArray")) then {
        [] call Shadec_fnc_addZeusModules;
        [[player, "assign"], Shadec_fnc_manageCurators] remoteExec ["call", 2];
    };
    
    [] spawn {
        waitUntil {!isNull player};
        sleep 3;

        // Reapply player loadout (In other case some items are local to player and don't save correctly on server)
        [[player, getPlayerUID player], Shadec_fnc_reLoadoutUnit] remoteExec ["call", 2];
        titleFadeOut 1;

        // Reassign medic/engineer roles
        [[player, getPlayerUID player, "Assign"], Shadec_fnc_rolesAssign] remoteExec ["spawn", 2];

        // Reenable fatigue (ace bug)
        player enableFatigue true;
        
        sleep 5;

        // If unit has Long Range Radio - Load Freqs before Respawn
        if (call TFAR_fnc_haveLRRadio) then {
            [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, player getVariable "radioLrSettings"] call TFAR_fnc_setLrSettings;
        };
    };
}];