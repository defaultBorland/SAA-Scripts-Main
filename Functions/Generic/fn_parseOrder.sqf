//
params["_orders"];

private _finalArray = [[], [], []];
{
	_x = _x # 0;
	private _currentArray = _x;
	{	
		switch (([_x] call BIS_fnc_itemType) # 0) do {
			case "Weapon": {(_finalArray # 0) pushBack [_x, _currentArray # 1 # _forEachIndex]};
			case "Magazine": {(_finalArray # 1) pushBack [_x, _currentArray # 1 # _forEachIndex]};
			case "Item": {(_finalArray # 2) pushBack [_x, _currentArray # 1 # _forEachIndex]};
		};
	} forEach (_x # 0);
} forEach _orders;

//return
_finalArray