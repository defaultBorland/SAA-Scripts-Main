params ["_itemsList"];
	_itemsList = _this # 0;
	_itemsList = _itemsList - [""];
	_weapons = [];
	_magazines = [];
	_items = [];

if !(count _itemsList > 0) exitWith {"-1"};
// diag_log format["_itemsList:%1", _itemsList];

// Sorting
{
	_type = [_x] call BIS_fnc_itemType;
	switch (_type # 0) do {
		case "Weapon": {
			_weapons pushBack _x;
		};
		case "Magazine": {
			_magazines pushBack _x;
		};
		default {
			_items pushBack _x;
		};
	}
} forEach _itemsList;

// diag_log format["_weapons:%1", _weapons];
// diag_log format["_magazines:%1", _magazines];
// diag_log format["_items:%1", _items];

_uniqW = [] + (_weapons arrayIntersect _weapons);
_uniqM = [] + (_magazines arrayIntersect _magazines);
_uniqI = [] + (_items arrayIntersect _items);

// diag_log format["_uniqW:%1", _uniqW];
// diag_log format["_uniqM:%1", _uniqM];
// diag_log format["_uniqI:%1", _uniqI];

_wEdited = [];
_mEdited = [];
_iEdited = [];

// GetCargo compat
for "_i" from 0 to (count _uniqW) - 1 do {
	_wEdited pushBack [(_uniqW # _i),({_x isEqualTo (_uniqW # _i)} count _weapons)];
};

for "_i" from 0 to (count _uniqM) - 1 do {
	_mEdited pushBack [(_uniqM # _i),({_x isEqualTo (_uniqM # _i)} count _magazines)];
};

for "_i" from 0 to (count _uniqI) - 1 do {
	_iEdited pushBack [(_uniqI # _i),({_x isEqualTo (_uniqI # _i)} count _items)];
};

// diag_log format["_wEdited:%1", _wEdited];
// diag_log format["_mEdited:%1", _mEdited];
// diag_log format["_iEdited:%1", _iEdited];


[_wEdited,_mEdited,_iEdited]