params ["_target", "_destination", "_showNotification"];

private _targetsArray = [];
if (_target isEqualTo "AllDead") then {
	_targetsArray = allPlayers select {!alive _x};
} else {
	_targetsArray = allPlayers select {name _x isEqualTo _target};
};

private _positionsArray = [];
if (_destination isEqualTo "AtBody") then {
	_positionsArray = _targetsArray apply {_x modelToWorld [0,0,0.2]};
} else {
	if (_destination isEqualTo "PlayerChoice") then {
		_positionsArray = _targetsArray apply {"PlayerChoice"};
	} else {
		if (_destination isEqualType objNull) then {
			_positionsArray = _targetsArray apply {_destination};
		} else {
			_destination = _destination findEmptyPosition [0,20];
			_positionsArray = _targetsArray apply {_destination};
		};
		
	};
};

if (_showNotification) then {
	
	[format["> Server: %1: %2.", localize "STR_SAA_ZEUS_MODULES_RESPAWN_FORCED_RESPAWN_MODULENAME", (_targetsArray apply {name _x}) joinString ", "]] remoteExec ["systemChat"];
};

{
	[[_positionsArray # _forEachIndex], {
		params ["_position"];
		if (playerRespawnTime < 1) exitWith {};

		[_position] spawn {
			params ["_position"];

			player setVariable ["SAA_forcedRespawnPosition", _position];
			if !(_position isEqualType "someString") then {
				player addEventHandler ["Respawn", {
					params ["_unit", "_corpse"];
					[] spawn {
						sleep 1;
						[player getVariable "SAA_forcedRespawnPosition"] call Shadec_fnc_respawnTeleport;
					};
					player removeEventHandler ["Respawn", _thisEventHandler];
				}];
			};	

			setPlayerRespawnTime 0;
		};

		// setPlayerRespawnTime 0;

		// if !(_position isEqualType "someString") then {
		// 	[_position] call Shadec_fnc_respawnTeleport;
		// };

		
	}] remoteExec ["call", _x];
} forEach _targetsArray;

//return
true