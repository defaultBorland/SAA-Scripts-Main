// On Player Killed Event Handler

/*

	Если это глупо, но работает - значит, это не глупо.
	Когда сомневаешься - опустоши магазин.
	Все важное всегда так просто.
	Все простое всегда так сложно.
	Короткий путь всегда заминирован.
	Не выгляди броско - это привлекает на тебя огонь противника.
	Когда ты обезопасил очередной район, не забудь об этом сообщить врагу.
	Любой приказ, который может быть неправильно понят, понимается неправильно.
	Любой план предстоящего боя разваливается в самом начале столкновения.
	Нет такой вещи, как совершенный план.
	При артиллерийском обстреле не выясняй, чей он - просто прячься.
	Если враг в пределах досягаемости, ты - тоже.
	Направление трассеров видно обеим сторонам.
	Мины - оружие равных возможностей.
	Та из вещей, которая нужна больше всего, всегда отсутствует.

*/

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

		[] spawn {
			// sleep 2;

			// Fill player display with black screen with text only in case if player was not rejoin being KIA
			titleText [format["<t color='#ff0000' size='3' align='center' valign='middle' font='PuristaBold'>%1</t><br/><br/><t size='1.5' align='center' valign='middle' font='EtelkaMonospacePro'>%2</t>", localize "STR_SAA_GENERAL_DIED", localize ("STR_SAA_DEATH_CITATE_" + str (round(random 10) + 1))], "BLACK", 2, false, true];

			for "_i" from 10 to 0 step -0.5 do {
				sleep 0.1;
				["SAA_PlayerDeath", _i / 10, true] call ace_common_fnc_setHearingCapability;
			};
			["SAA_PlayerDeath", 0, true] call ace_common_fnc_setHearingCapability;
		}; 	
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

		["SAA_PlayerDeath", 1, false] call ace_common_fnc_setHearingCapability;
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
			
			sleep 3;
			while {!([_unit, "ItemMap"] call BIS_fnc_hasItem)} do {
				sleep 1;
				_unit linkItem "ItemMap";
			};

			titleFadeOut 3;
		};
		
	}, [_unit], 5] call CBA_fnc_waitAndExecute;

	//
	_unit setVariable ["KIA_onExit", nil];
	_unit setVariable ["KIA_returnTicket", nil];

	// Create public var and send it to server to trigger event
	playerKilled = [player, getPlayerUID player];
	publicVariableServer "playerKilled";
	playerKilled = nil;
}];





//
// [{
// 	[true, 1] call ace_medical_feedback_fnc_effectUnconscious;
// }, [], 2] call CBA_fnc_waitAndExecute;

// //Fill player display with black screen with text only in case if player was not rejoin being KIA
// [{
// 	titleText [format["<t color='#ff0000' size='3' align='center' valign='middle' font='PuristaBold'>%1</t><br/><br/><t size='1.5' align='center' valign='middle' font='EtelkaMonospacePro'>%2</t>", textKIA, selectRandom textsArray], "BLACK FADED", 0, false, true];
// }, [], 4] call CBA_fnc_waitAndExecute;