// Server-side exec only
if (!isDedicated) exitWith {diag_log "fnc_headlessInfo | Server only function"};

params [["_includeServer", true], ["_includeOthers", false]];

private _hcs = allPlayers select {typeOf _x isEqualTo "HeadlessClient_F"};
private _owners = (_hcs apply {owner _x}) + [2];
_hcs = [_hcs, [], {name _x}, "ASCEND"] call BIS_fnc_sortBy; 
{   
	private _hcOwner = owner _x;   
	private _unitCount = {owner _x isEqualTo _hcOwner} count allUnits;   
	private _fps = _x getVariable ["SAA_HC_FPS", 0];   
	_hcs set [_forEachIndex, [  
			name _x,  
			_unitCount,  
			round _fps  
		]  
	];   
} forEach _hcs;

if (_includeServer) then {
	_hcs pushBack [
		"SERVER",
		{owner _x isEqualTo 2} count allUnits,  
		round diag_fps
	];
};

if (_includeOthers) then {

	private _allOwners = (allPlayers - entities "HeadlessClient_F") apply {owner _x};
	private _unitsOnOwners = 0;
	{	
		private _owner = _x;
		private _unitsOnOwner = {owner _x isEqualTo _owner} count allUnits;
		if (_unitsOnOwner > 1) then {_unitsOnOwners = _unitsOnOwners + _unitsOnOwner - 1};
	} forEach _allOwners;

	_hcs pushBack [
		"OTHERS",
		_unitsOnOwners,  
		""
	];
};

//return
_hcs