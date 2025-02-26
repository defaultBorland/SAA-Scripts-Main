addMissionEventHandler ["GroupCreated", {
	params ["_group"];

	[{
		params ["_group"];
		count units _group > 0
		
	}, {
		params ["_group"];

		if ({!isPlayer _x} count (units _group) < 1) then {
			//[format["Registering EHs to group with players: %1", _group], "Info"] call Shadec_fnc_createLogServer;
			[{
				({_x getVariable ["LoadoutLoaded", false]} count units _this) > 0
			}, {
				//[format["Group %1: Player is loaded.", _this], "Info"] call Shadec_fnc_createLogServer;
				["SAA_TM_RefreshPanel", ["UnitJoined"] + [_this, objNull]] call CBA_fnc_globalEvent;
			}, _group, 180, {
				if (_this isEqualTo grpNull) exitWith {};
				if ((count units _this) < 1) exitWith {};
				if ({_x getVariable ["SAA_isZeus", false]} count (units _this) > 0) exitWith {};
				if ({typeOf _x isEqualTo "HeadlessClient_F"} count (units _this) > 0) exitWith {};
				
				[format["Group %1 (%3): Not all players loaded within 180 secs...", _this, (units _this) apply {name _x} joinString ", "], "Warning"] call Shadec_fnc_createLogServer;
			}] call CBA_fnc_waitUntilAndExecute;
		};

		_group addEventHandler ["UnitJoined", {
			params ["_group", "_newUnit"];
			["SAA_TM_RefreshPanel", [_thisEvent] + _this] call CBA_fnc_globalEvent;
		}];

		_group addEventHandler ["UnitLeft", {
			params ["_group", "_oldUnit"];
			["SAA_TM_RefreshPanel", [_thisEvent] + _this] call CBA_fnc_globalEvent;
		}];

		_group addEventHandler ["GroupIdChanged", {
			params ["_group", "_newGroupId"];
			["SAA_TM_RefreshPanel", [_thisEvent] + _this] call CBA_fnc_globalEvent;
		}];

		_group addEventHandler ["LeaderChanged", {
			params ["_group", "_newLeader"];
			["SAA_TM_RefreshPanel", [_thisEvent] + _this] call CBA_fnc_globalEvent;
		}];
	}, [_group], 60, {
		//params ["_group"];
		//[format["Group %1 does'n contain any unit longer than 60 sec...", _group], "Warning"] call Shadec_fnc_createLogServer;
	}] call CBA_fnc_waitUntilAndExecute;
}];


// Commanding Stats
addMissionEventHandler ["GroupCreated", {
	params ["_group"];

	[{
		params ["_group"];
		count units _group > 0
		
	}, {
		params ["_group"];

		if ({isPlayer _x} count (units _group) > 0) then {
			if ({typeOf _x isEqualTo "HeadlessClient_F"} count (units _group) > 0) exitWith {};

			_group addEventHandler ["UnitJoined", {
				params ["_group", "_newUnit"];

				// Стало 4 игрока - появился полноценный отряд
				if ({isPlayer _x} count (units _group) isEqualTo 4) then {
					// Проверяем, что лидер - игрок
					if (isPlayer leader _group) then {
						// Отправляем запрос на регистрацию начала командования по groupId
						[groupId _group, getPlayerUID leader _group] call Shadec_db_server_fnc_commandingStart;
					};
				};
			}];

			_group addEventHandler ["UnitLeft", {
				params ["_group", "_oldUnit"];
				
				// Стало 3 игрока - отряд больше не является полноценным
				if ({isPlayer _x} count (units _group) isEqualTo 3) then {
					// Проверяем, что лидер - игрок
					if (isPlayer leader _group) then {
						// Отправляем запрос на окончание командования по groupId
						[groupId _group, nil, "Not Enough Members"] call Shadec_db_server_fnc_commandingEnd;
					};
				};
			}];

			_group addEventHandler ["LeaderChanged", {
				params ["_group", "_newLeader"];

				// В полноценном отряде сменился командир
				if ({isPlayer _x} count (units _group) >= 4) then {
					// Проверяем, что лидер - игрок
					if (isPlayer leader _group) then {
						// Отправляем запрос на окончание командования по groupId
						[groupId _group, nil, "New Leader"] call Shadec_db_server_fnc_commandingEnd;
						// Отправляем запрос на начало командования по groupId
						[groupId _group, getPlayerUID leader _group] call Shadec_db_server_fnc_commandingStart;
					};
				};
			}];

			_group addEventHandler ["GroupIdChanged", {
				params ["_group", "_newGroupId"];
				
				// В полноценном отряде сменилось название
				if ({isPlayer _x} count (units _group) >= 4) then {
					// Проверяем, что лидер - игрок
					if (isPlayer leader _group) then {
						private _leaderUid = getPlayerUID leader _group;
						// Отправляем запрос на окончание командования по leader_uid
						[grpNull, _leaderUid, "New Group Name"] call Shadec_db_server_fnc_commandingEnd;
						// Отправляем запрос на начало командования по groupId
						[_newGroupId, _leaderUid] call Shadec_db_server_fnc_commandingStart;
					};
				};
			}];
		};
	}, [_group], 60, {
		//params ["_group"];
		//[format["Group %1 does'n contain any unit longer than 60 sec...", _group], "Warning"] call Shadec_fnc_createLogServer;
	}] call CBA_fnc_waitUntilAndExecute;

}];

// Register EH to handle mission ended
private _EH_MissionEnded_Commanding_ID = ["SAA_MissionEnded", {
	// Для всех полноценных групп записать время окончания командования
	private _groups = allGroups select {
		private _curGroup = _x;
		{isPlayer _x} count (units _curGroup) >= 4;
	};

	{
		// Отправляем запрос на окончание командования по groupId
		[groupId _x, nil, "Mission End"] call Shadec_db_server_fnc_commandingEnd;
	} forEach _groups;
}, []] call CBA_fnc_addEventHandlerArgs;