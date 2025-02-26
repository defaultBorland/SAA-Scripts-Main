//
params ["_listNBox", "_row"];

private _cols = (lnbSize _listNBox) # 1;
for "_col" from 0 to _cols do {
	_listNBox lnbSetText [[_row, _col], ""];
	_listNBox lnbSetData [[_row, _col], ""];
	_listNBox lnbSetPicture [[_row, _col], ""];
	_listNBox lnbSetTooltip [[_row, _col], ""];
};

//return
true