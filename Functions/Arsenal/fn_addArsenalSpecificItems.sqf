//
params ["_box", "_uniform"];

[{ // Condition
	missionNamespace getVariable format["loadoutLoaded_%1", getPlayerUID player]
}, { // Statement
	_this params ["_box", "_uniform"];

	if ((_box isEqualTo objNull) || (!alive _box)) exitWith {diag_log format ["fnc_addArsenalSpecificItems | Error: _box not alive or nil"]};
	
	//private _rank = player getVariable ["SAA_Rank", "PV1"];
	private _firstClass = player getVariable ["SAA_PrimaryClass", "Rifleman"];
	private _secondClass = player getVariable ["SAA_SecondaryClass", "None"];
	
	_arsenalItems = [];
	switch (_firstClass) do {
		case "AT": {_arsenalItems = _uniform # 0};
		case "Machinegunner": {_arsenalItems = _uniform # 1};
		case "Sniper": {_arsenalItems = _uniform # 2};
		default {};
	};
	[_box, _arsenalItems, false] call ACE_arsenal_fnc_addVirtualItems;	
}, _this, 60, {
	diag_log format ["fnc_addArsenalSpecificItems | Timeout reached"];
}] call CBA_fnc_waitUntilAndExecute;