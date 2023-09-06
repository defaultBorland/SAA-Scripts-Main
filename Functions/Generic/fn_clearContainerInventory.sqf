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
* [_vehicle, true, true, true, false] call Shadec_fnc_clearContainerInventory
*
*/

params [["_vehicle", objNull], ["_clearWeapons", true], ["_clearMagazines", true], ["_clearItems", true], ["_clearBackpacks", true]];

if (_vehicle isEqualTo objNull) exitWith {
	["fnc_clearContainerInventory | Error: Object doesn't exists.", "Info"] call Shadec_fnc_createLogServer;
};

if (_vehicle isKindOf "CAManBase") exitWith { // If object is kind of Man
	["fnc_clearContainerInventory | Error: Trying to clear inventory of a man.", "Info"] call Shadec_fnc_createLogServer;
}; 

if (_clearWeapons) then {
	clearWeaponCargoGlobal _vehicle;
};

if (_clearMagazines) then {
	clearMagazineCargoGlobal _vehicle;
};

if (_clearItems) then {
	clearItemCargoGlobal _vehicle;
};

if (_clearBackpacks) then {
	clearBackpackCargoGlobal _vehicle;
};