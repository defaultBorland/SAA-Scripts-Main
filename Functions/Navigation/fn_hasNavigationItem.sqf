//
params ["_unit"];

private _hasNavigationItem = [_unit, "ItemGPS"] call BIS_fnc_hasItem
	|| {[_unit, "ACE_microDAGR"] call BIS_fnc_hasItem}
	|| {[_unit, "I_UavTerminal"] call BIS_fnc_hasItem}
	|| {[_unit, "C_UavTerminal"] call BIS_fnc_hasItem}
	|| {[_unit, "O_UavTerminal"] call BIS_fnc_hasItem}
	|| {[_unit, "B_UavTerminal"] call BIS_fnc_hasItem};

// return
_hasNavigationItem