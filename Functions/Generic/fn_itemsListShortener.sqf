params ["_itemsList"];

_itemsList = _this select 0;
_uniqueList = [] + (_itemsList arrayIntersect _itemsList);
_itemsListShort = [];

for "_i" from 0 to (count _uniqueList) - 1 do {
	_itemsListShort pushBack [(_uniqueList select _i),({_x isEqualTo (_uniqueList select _i)} count _itemsList)];
};

//return
_itemsListShort