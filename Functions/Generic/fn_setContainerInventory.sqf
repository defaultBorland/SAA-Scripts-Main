//
params ["_container", "_inventory"];

_inventory params ["_weapons", "_magazines", "_items", "_backpacks"];

{_container addWeaponCargoGlobal _x} forEach _weapons;
{_container addMagazineAmmoCargo _x} forEach _magazines;
{_container addItemCargoGlobal _x} forEach _items;
{_container addBackpackCargoGlobal _x} forEach _backpacks;

// return
true