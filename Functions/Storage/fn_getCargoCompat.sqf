// Array kind of [["A","B"], [2,5]] of provided item type to [["A",2], ["B",2]] 
params ["_type","_getCargoArrays"];

if (isNil {_getCargoArrays}) exitWith {[]};
if (_getCargoArrays isEqualTo []) exitWith {[]};
if (_getCargoArrays isEqualTo [[],[]]) exitWith {[]};

_editedList = [];

switch (toLower _type) do {
	case "magazines": {
		_uniqueList = [] + (_getCargoArrays arrayIntersect _getCargoArrays);

		for "_i" from 0 to (count _uniqueList) - 1 do {
			_editedList pushBack [(_uniqueList select _i select 0),({_x isEqualTo (_uniqueList select _i)} count _getCargoArrays), (_uniqueList select _i select 1)];
		};
	};
	case "weapons";
	case "items";
	default {
		_itemsList = _getCargoArrays # 0;
		_countsList = _getCargoArrays # 1;

		{_editedList pushBack [_x, (_countsList # _forEachIndex)]} forEach _itemsList;
	};
};

//diag_log format ["GCC:%1", _editedList];

//return
_editedList