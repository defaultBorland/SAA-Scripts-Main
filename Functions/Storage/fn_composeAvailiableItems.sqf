params ["_firstClass", "_secondClass"];

private _array = [_firstClass, _secondClass] call Shadec_db_server_fnc_getAvailiableItems;
_array = _array apply {toLower (_x # 0)};
private _hashmap = _array createHashMapFromArray [];

missionNamespace setVariable [format["SAA_availiableItems_%1_%2", _firstClass, _secondClass], _hashmap];

//return
_hashmap