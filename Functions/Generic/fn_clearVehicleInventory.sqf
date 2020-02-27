// Function to clear object cargo specified items

params ["_object", "_clearWeapons", "_clearMagazines", "_clearItems", "_clearBackpacks"];

if !(_object isEqualType objNull) exitWith {diag_log "ClearInvetnory_Type_Error"};

if (_clearWeapons isEqualTo 1) then {clearWeaponCargoGlobal _object};
if (_clearMagazines isEqualTo 1) then {clearMagazineCargoGlobal _object};
if (_clearItems isEqualTo 1) then {clearItemCargoGlobal _object};
if (_clearBackpacks isEqualTo 1) then {clearBackpackCargoGlobal _object};

//
true