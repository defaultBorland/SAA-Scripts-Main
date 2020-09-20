// On Player Killed Event Handler

// Vars with texts to be randomly displayed on death screen
textKIA = "You were Killed In Action | KIA";
textsArray = [
	"''It's not bad to die, after all.''", 
	"''Professional soldiers are predictable. The world is full of dangerous amateurs.''", 
	"''People die every time. That's just part of life around here.''", 
	"''I ain't afraid to die anymore. I'd done it already.''", 
	"''We're gonna die. That's a thought. Everybody dies.''", 
	"''We’re at war. And in war, people die.''", 
	"''We all die eventually. The real tragedy is forgetting to live.''", 
	"''Death is not to be feared, but it shouldn’t be pursued. There’s a difference.''", 
	"''It doesn’t matter how you die, you come back. We all come back.''", 
	"''All of us have to get out of life somehow one day — that's certain — but few of us have the chance of making such a triumphant exit.''",
	"''You lost your job when you died.''"
];
	

// Player Killed Event Hanlder
_EH_PlayerKilled = player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffect"];

	// Exit if unit wasn't a player 
	if !(isPlayer _unit) exitWith {};
	
	// Creating variable to reLoadout person from serverside after respawn
    missionNamespace setVariable [format["%1_INVENTORY", getPlayerUID player], getUnitLoadout _unit, true];
	
	// Fill player display with black screen with text
	titleText [format["<t color='#ff0000' size='3' align='center' valign='middle' font='PuristaBold'>%1</t><br/><br/><t size='1.5' align='center' valign='middle' font='EtelkaMonospacePro'>%2</t>", textKIA, selectRandom textsArray], "BLACK", 2, false, true];
    [_unit] spawn {sleep 5; titleFadeOut 3; (_this # 0) linkItem "itemMap"};

	// Change respawn time adjusting it to specific value
	setPlayerRespawnTime (missionNamespace getVariable ["respawnTime", getNumber (missionConfigFile >> "respawnDelay")]);

	// If unit has Long Range Radio - Save Freqs to Load it after Respawn
    if (call TFAR_fnc_haveLRRadio) then {_unit setVariable ["radioLrSettings", (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings]};

	// Remove player weapons and items to escape of creating duplucates and friendly-looting
	[_unit] spawn {
		private _unit = _this # 0;

		sleep 5;

		removeAllItems _unit; 
		removeAllWeapons _unit; 
		removeAllAssignedItems _unit;

		_droppedGear = nearestObjects [_unit, ["WeaponHolder", "WeaponHolderSimulated", "GroundWeaponHolder"], 7];
		{deleteVehicle _x} forEach _droppedGear;
	};

	// Create public var and send it to server to trigger event
	playerKilled = [player, getPlayerUID player];
	publicVariableServer "playerKilled";
	playerKilled = nil;
}];