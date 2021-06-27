// KeyDown profile inventory saving EH (ESC)

waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["keyDown", {
    params ["_ctrl", "_key", "_shift", "_ctrlKey", "_alt"];

  if (_key == 1) then {
		[player, getPlayerUID player, name player] spawn Shadec_fnc_saveInventory;
  };	
}];


// Mission Ended profile inventory saving EH
_EH_EndedSaveProfile = addMissionEventHandler ["Ended", {
  params ["_endType"];
    // Saving Inventory to local profile to show in ShopMission
    profileNamespace setVariable ["SAA_Project_Inventory", getUnitLoadout player];
}];