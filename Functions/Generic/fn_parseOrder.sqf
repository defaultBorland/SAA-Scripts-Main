//
params["_orders"];

// diag_log format ["fnc_parseOrders| _orders: %1", _orders];

private _finalArray = [[], [], []];
{
	private _order = _x;
	{	
		_x params ["_classname", "_count"];

		diag_log format ["fnc_parseOrders| _x: %1", _x];

		switch ((_classname call BIS_fnc_itemType) # 0) do {
			case "Weapon": {(_finalArray # 0) pushBack _x};
			case "Mine";
			case "Magazine": {(_finalArray # 1) pushBack _x};
			case "Item": {(_finalArray # 2) pushBack _x};
		};
	} forEach _order # 0; // For some reason db return each order in [] brackets
} forEach _orders;

//return
_finalArray