/*

*/

params ["_player"];
_loadoutList = [primaryWeapon player] + primaryWeaponItems player + primaryWeaponMagazine player + [secondaryWeapon player] + secondaryWeaponItems player + secondaryWeaponMagazine player + [handgunWeapon player] + handgunItems player + handgunMagazine player + itemsWithMagazines player + assignedItems player;// + [uniform player] + [vest player] + [backpack player];
//_loadoutList sort true;
_loadoutList = _loadoutList - [""];
_loadoutList = _loadoutList - [objNull];
diag_log format ["fn_loadoutslistcreate:%1", _loadoutList];

_loadoutList = [_loadoutList] call Shadec_fnc_ItemsListShortener;

//Return
_loadoutList