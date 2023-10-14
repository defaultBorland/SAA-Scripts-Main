params ["_firstClass", "_secondClass"];

private _array = ["getAvailiableItems", [_firstClass, _secondClass]] call Shadec_fnc_call_db;
_array = _array apply {toLower (_x # 0)};
private _hashmap = _array createHashMapFromArray [];

missionNamespace setVariable [format["SAA_availiableItems_%1_%2", _firstClass, _secondClass], _hashmap];

//return
_hashmap