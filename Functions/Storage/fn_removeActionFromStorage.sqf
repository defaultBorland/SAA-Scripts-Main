// LOCAL USE ONLY
params ["_storageProxy"];
removeAllActions _storageProxy;
[_storageProxy, 0, ["ACE_MainActions", "openStorage"]] call ace_interact_menu_fnc_removeActionFromObject;
closeDialog 602;