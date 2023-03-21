// Sorts given array by provided column as ranks and provided column as names
params ["_array", "_ranksCol", ["_reversed", false]];

_array sort !_reversed; // Sorting by first element in each array, assuming that it is the name

private _ranksRanging = ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT","SPC","PV2","PV1"];

private _ranks = _array apply {_x # _ranksCol};
private _sortedRanks = _ranks arrayIntersect _ranksRanging; // ex: ["SMC", "MSG", "SGT", "PV2"];

private _newArray = [];
{
	private _curRank = _x;
	_newArray = _newArray + (_array select {_curRank in _x});
} forEach _sortedRanks;

if (_reversed) then {
	reverse _newArray;
};

//return
_newArray