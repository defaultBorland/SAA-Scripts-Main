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