//
params ["_arrays", "_uid"];
_arrays params ["_weapons", "_magazines", "_items"]; 

private _player = [_uid] call Shadec_fnc_getPlayer;
private _firstClass = _player getVariable ["SAA_PrimaryClass", "Rifleman"];
private _secondClass = _player getVariable ["SAA_SecondaryClass", "None"];

private _availiableEquipment = missionNamespace getVariable [
	format["SAA_availiableItems_%1_%2", _firstClass, _secondClass], 
	[_firstClass, _secondClass] call Shadec_fnc_composeAvailiableItems
];

private _weaponsAllowed = _weapons select {[_x # 0, _availiableEquipment] call Shadec_fnc_isItemAllowed};
private _magazinesAllowed = _magazines select {[_x # 0, _availiableEquipment] call Shadec_fnc_isItemAllowed};
private _itemsAllowed = _items select {[_x # 0, _availiableEquipment] call Shadec_fnc_isItemAllowed};

private _weaponsRemoved = (_weapons - _weaponsAllowed);
private _magazinesRemoved = (_magazines - _magazinesAllowed);
private _itemsRemoved = (_items - _itemsAllowed);

private _allRemoved = _weaponsRemoved + _magazinesRemoved + _itemsRemoved;

if !(_allRemoved isEqualTo []) then {
	[_uid, name _player, _allRemoved] call Shadec_db_server_fnc_saveRemovedRestrictedItems;
	
	// Aggregate removed items to one array
	_allRemoved append (missionNamespace getVariable [format["removedItems_%1", _uid], []]);
	missionNamespace setVariable [format["removedItems_%1", _uid], _allRemoved];

	private _id = owner _player;

	removedItems = _allRemoved;
	_id publicVariableClient "removedItems";
	removedItems = nil;
	// diag_log format ["REMOVED ITEMS %1: %2", _uid, _allRemoved];
};

// return
[_weaponsAllowed, _magazinesAllowed, _itemsAllowed];