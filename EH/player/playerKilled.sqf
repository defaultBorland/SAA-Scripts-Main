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

	// Creating variable to reLoadout person from serverside after respawn if player wasnt KIA on rejoin
	if !(_unit getVariable ["KIA_onExit", false]) then {

		// Save radio settings to load after respawn
		// belongs to this block bc if player reconnect being KIA - no need to save LR options (they can be not loaded)
    	call Shadec_fnc_savePlayerRadioSettings;

    	[_unit] call Shadec_fnc_createDeadRecord;
		
		// Fill player display with black screen with text only in case if player was not rejoin being KIA
		titleText [format["<t color='#ff0000' size='3' align='center' valign='middle' font='PuristaBold'>%1</t><br/><br/><t size='1.5' align='center' valign='middle' font='EtelkaMonospacePro'>%2</t>", textKIA, selectRandom textsArray], "BLACK", 2, false, true];
		
	} else {
		if (_unit getVariable ["KIA_returnTicket", false]) then {[side group player, 1] call BIS_fnc_respawnTickets};
		[{[_this] call Shadec_fnc_showUserInfo;}, player, 5] call CBA_fnc_waitAndExecute;
	};

	// Disable "Back to map" button
	[{
		(!isNull ((findDisplay 60492) displayCtrl 88811))
		&& !alive player
	}, {
		private _ctrl = (findDisplay 60492) displayCtrl 88811;
		_ctrl ctrlEnable false;
	}, nil, playerRespawnTime, {}] call CBA_fnc_waitUntilAndExecute;

	// Remove player weapons and items to escape of creating duplucates and friendly-looting
	[{
		params ["_unit"];

		removeAllItems _unit; 
		removeAllWeapons _unit; 
		removeAllAssignedItems _unit;

		_droppedGear = nearestObjects [_unit, ["WeaponHolder", "WeaponHolderSimulated", "GroundWeaponHolder"], 7];
		{deleteVehicle _x} forEach _droppedGear;

		//
		[_unit] spawn {
			params ["_unit"];
			
			sleep 5;
			while {!([_unit, "ItemMap"] call BIS_fnc_hasItem)} do {
				sleep 1;
				_unit linkItem "ItemMap";
			};
		};

		titleFadeOut 3;
	}, [_unit], 5] call CBA_fnc_waitAndExecute;

	//
	_unit setVariable ["KIA_onExit", nil];
	_unit setVariable ["KIA_returnTicket", nil];

	// Create public var and send it to server to trigger event
	playerKilled = [player, getPlayerUID player];
	publicVariableServer "playerKilled";
	playerKilled = nil;
}];