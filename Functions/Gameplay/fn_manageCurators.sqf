fnc_FreeCurator = {
	private _slot = -1;

	{
		if ((getAssignedCuratorUnit _x) isEqualTo objNull) exitWith {_slot = _forEachIndex};
	} forEach zeusSlots;

	_slot
};

fnc_getPlayerCuratorSlot = {
	params ["_unit"];
	private _slot = -1;

	{
		if ((getAssignedCuratorUnit _x) isEqualTo _unit) exitWith {_slot = _forEachIndex};
	} forEach zeusSlots;

	_slot
};

fnc_Assign = {
	params ["_unit"];
	if (_unit in (allCurators apply {getAssignedCuratorUnit _x})) then {
		[_unit] call fnc_Unassign;
	};

	private _slot = call fnc_FreeCurator;

	if (_slot isEqualTo -1) then {
		call fnc_Create;
		_slot = (count zeusSlots) - 1;
	};

	unassignCurator (zeusSlots # _slot);
	_unit assignCurator (zeusSlots # _slot);
	{[] execVM "EH\player\zeus.sqf"} remoteExec ["call", _unit];
	//[["You are Zeus now", "Plain", 1]] remoteExec ["cutText", owner _unit];
};

fnc_Unassign = {
	params ["_unit"];
	private _slot = [_unit] call fnc_getPlayerCuratorSlot;

	if (_slot isEqualTo -1) exitWith {
		[["This player doesn't occupy zeusSlot!", "Plain", 1]] remoteExec ["cutText", owner _unit];
	};
	 
	unassignCurator (zeusSlots # _slot);
	//[["You are no longer Zeus!", "Plain", 1]] remoteExec ["cutText", owner _unit];
};

fnc_getFreeSlots = {
	private _slots = 0;

	{
		if ((getAssignedCuratorUnit _x) isEqualTo objNull) then {_slots = _slots + 1};
	} forEach zeusSlots;

	_slots
};

fnc_Create = {
	_zeus = CuratorLogicGroup createunit ["ModuleCurator_F", [0, 0, 0],[],0.5,"NONE"];
	_zeus setvariable ["text", "Zeus_0"];    
	_zeus setvariable ["Addons", 3, true];
	_zeus setvariable ["owner", "objNull"];  
	_zeus setvariable ["vehicleinit","_this setvariable ['Addons',3,true]; _this setvariable ['owner','objnull'];"];
	unassignCurator _zeus;
	objnull assignCurator _zeus;
	missionNamespace setVariable ["curatorTemp", _zeus];
	zeusSlots pushBack _zeus;
	_zeus
};

params ["_unit", "_action"];

if !(_unit isEqualType objNull) exitWith {diag_log "BAD 1 PARAMETR IN ZEUS"};
if !(_action isEqualType "STRING") exitWith {diag_log "BAD 2 PARAMETR IN ZEUS"};
switch (_action) do {
	case "assign": {
		[_unit] call fnc_Assign;
	};
	case "unassign": {
		[_unit] call fnc_Unassign;
	};
	case "create": {
		_zeus = call fnc_Create;
	};
	case "getFreeSlots": {
		_slots = call fnc_getFreeSlots;
	};
	case "flush": {
		zeusSlots apply {if (getAssignedCuratorUnit _x) then {_x = objNull}};
		zeusSlots = zeusSlots - [objNull];
	};
	default {};
};