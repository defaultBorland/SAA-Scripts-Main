// KeyDown profile inventory saving EH (ESC)

waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["keyDown", {
    params ["_ctrl", "_key", "_shift", "_ctrlKey", "_alt"];

    if (_key == 1) then {
      [player, getPlayerUID player, name player] spawn Shadec_fnc_saveInventory;
    };

    // Saving Inventory to local profile to show in ShopMission
    profileNamespace setVariable ["SAA_Project_Inventory", getUnitLoadout player];
    profileNamespace setVariable ["SAA_Project_PrimaryClass", player getVariable ["SAA_PrimaryClass", "Rifleman"]];
    profileNamespace setVariable ["SAA_Project_SecondaryClass", player getVariable ["SAA_SecondaryClass", "None"]];
    profileNamespace setVariable ["SAA_Project_Rank", player getVariable ["SAA_Rank", "PV1"]];
}];