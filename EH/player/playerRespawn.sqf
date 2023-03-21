// On Player Respawn Event Handler

// Player Respawn Event Hanlder
_EH_PlayerRespawn = player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

    // Fill player display with black screen with text
    titleText [format["<t color='#ff0000' size='3' align='center' valign='middle' font='PuristaBold'>%1</t><br/><br/><t size='1.5' align='center' valign='middle' font='EtelkaMonospacePro'>%2</t>", "Back In Action", "Let's try this again..."], "BLACK", 0.2, false, true];
    
    // Create public var and send it to server to trigger event
	playerRespawned = [_unit, getPlayerUID _unit];
	publicVariableServer "playerRespawned";
	playerRespawned = nil;
    
    // If player was zeus - reassign modules
    if (_unit getVariable ["SAA_isZeus", false]) then {
        [[_unit, "assign"], Shadec_fnc_manageCurators] remoteExec ["call", 2];
    };
    
    [_unit] spawn {
        params ["_unit"];
        
        waitUntil {!isNull _unit};
        sleep 2;

        // Reapply player loadout (In other case some items are local to player and don't save correctly on server)
        [_unit] call Shadec_fnc_updateDeadRecord;
        [_unit] call Shadec_fnc_getRespawnInventory;
        titleFadeOut 1;

        // Reassign medic/engineer roles
        [[_unit, "Assign"], Shadec_fnc_rolesAssign] remoteExec ["spawn", 2];

        // Reenable fatigue (ace bug)
        _unit enableFatigue true;
        
        sleep 2;

        // Restore Radio Settings On Respawn
        call Shadec_fnc_loadPlayerRadioSettings;
    };
}];