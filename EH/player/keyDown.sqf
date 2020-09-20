// KeyDown EHs

waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["keyDown", {
    params ["_ctrl", "_key", "_shift", "_ctrlKey", "_alt"];

    if (_key == 1) then {
		[player, getPlayerUID player, name player] spawn Shadec_fnc_saveInventory;
    };	
}];