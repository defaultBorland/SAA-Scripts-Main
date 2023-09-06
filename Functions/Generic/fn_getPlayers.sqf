//
params [["_side", sideUnknown]];

private _players = (allPlayers - entities "HeadlessClient_F") select {!(_x getVariable ["SAA_isZeus", false])};
if (_side isNotEqualTo sideUnknown && {_side in [west, east, independent, civilian]}) then {
	_players = _players select {side group _x isEqualTo _side};
};

//return
_players