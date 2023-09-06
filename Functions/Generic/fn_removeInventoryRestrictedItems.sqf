// Remove restricted items from _unit inventory
params ["_unit"];

{
	while {[_unit, _x] call BIS_fnc_hasItem} do {
		_unit removeItems _x;
		diag_log format ["fnc_removeInventoryRestrictedItems | %1 has %2 in their inventory. Removing...", name _unit, _x];
	};
} forEach ["MineDetector", "H_HelmetO_ViperSP_ghex_F", "H_HelmetO_ViperSP_hex_F"];

// Remove UAV terminals from non-engineer _unit inventory
if ((_unit getVariable ["SAA_PrimaryClass", "Rifleman"]) isNotEqualTo "Engineer") then {
	{
		while {[_unit, _x] call BIS_fnc_hasItem} do {
			_unit removeItems _x;
			diag_log format ["fnc_removeInventoryRestrictedItems | %1 has %2 in their inventory. Removing...", name _unit, _x];
		};
	} forEach ["I_UavTerminal","C_UavTerminal","O_UavTerminal","B_UavTerminal"];
};
