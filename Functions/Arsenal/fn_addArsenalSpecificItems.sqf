//
params ["_box", "_uniform"];

diag_log format["fnc_addArsenalSpecificItems | Params: %1", _this];

[{missionNamespace getVariable format["loadoutLoaded_%1", getPlayerUID player]}, {
	_this params ["_box", "_uniform"];

	if ((_box isEqualTo objNull) || (!alive _box)) exitWith {diag_log format ["fnc_addArsenalSpecificItems | _box not alive or nil"]};
	missionNamespace getVariable [format["%1_DATA", getPlayerUID player], ["PVT", "Rifleman", "None"]] params ["_rank", "_firstClass", "_secondClass"];
	
	_arsenalItems = [];
	switch (_firstClass) do {
		case "ATSpec": {_arsenalItems = _uniform # 0};
		case "Machinegunner": {_arsenalItems = _uniform # 1};
		case "Sniper": {_arsenalItems = _uniform # 2};
		default {};
	};
	[_box, _arsenalItems, false] call ACE_arsenal_fnc_addVirtualItems;	
}, _this, 45, {
	diag_log format ["fnc_addArsenalSpecificItems | Timeout reached"];
}] call CBA_fnc_waitUntilAndExecute;