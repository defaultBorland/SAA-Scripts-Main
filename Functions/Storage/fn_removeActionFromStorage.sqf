// LOCAL USE ONLY
if (!hasInterface) exitWith {diag_log format["%1 | Local only function", __FILE_NAME__]; false};

params ["_storageProxy"];

removeAllActions _storageProxy;
[_storageProxy, 0, ["ACE_MainActions", "openStorage"]] call ace_interact_menu_fnc_removeActionFromObject;
closeDialog 602;