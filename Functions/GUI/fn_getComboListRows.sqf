// Get list of items from ComboBox / ListBox / ListNBox;
params ["_ctrl"];

private _values = [];
if (ctrlType _ctrl isEqualTo 102) then {
	private _rows = (lnbSize _ctrl) # 0;
	private _cols = (lnbSize _ctrl) # 1;
	for "_index" from 0 to _rows - 1 do {
		private _rowText = [];
		for "_column" from 0 to _cols do {
			_rowText pushBack (_ctrl lnbText [_index, _column]);
		};
		_values pushBack _rowText;
	};
} else {
	for "_index" from 0 to (lbSize _ctrl) - 1 do {
		private _curText = _ctrl lbText _index;
		_values pushBack _curText;
	};
};

//return
_values