/*
* Clears all items from vehicle inventory of the selected categories.
*
* Arguments:
* 0: Vehicle <OBJECT>
* 1: Clear Weapons <BOOL>
* 2: Clear Magazines <BOOL>
* 3: Clear Items <BOOL>
* 4: Clear Backpacks <BOOL>
*
* Return Value:
* None
*
* Example:
* [_vehicle, true, true, true, false] call Shadec_fnc_clearVehicleInventory
*
*/

params ["_vehicle", "_clearWeapons", "_clearMagazines", "_clearItems", "_clearBackpacks"];

if (_vehicle isKindOf "CAManBase") exitWith { // If object is kind of Man
	["fnc_clearVehicleInventory | Error: Trying to clear inventory of a man.", "Info"] call Shadec_fnc_createLogServer;
}; 

if (!(isNil "_clearWeapons") && {_clearWeapons}) then {
	clearWeaponCargoGlobal _vehicle;
};

if (!(isNil "_clearMagazines") && {_clearMagazines}) then {
	clearMagazineCargoGlobal _vehicle;
};

if (!(isNil "_clearItems") && {_clearItems}) then {
	clearItemCargoGlobal _vehicle;
};

if (!(isNil "_clearBackpacks") && {_clearBackpacks}) then {
	clearBackpackCargoGlobal _vehicle;
};