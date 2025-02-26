// - OnlyTeamLeaders, OnlyWithoutSquad, OnlySquadMembers, All
params ["_type", "_player"];

private _players = [side group _player] call Shadec_fnc_getPlayers;

switch (toLower(_type)) do {
	case "onlyteamleaders": {
		_players = _players select {_x isEqualTo (leader group _x)}; // Only group leaders
		_players = _players select {(_x getVariable ["SAA_Rank", "PV1"]) in ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT"]}; // Only players with rank above than SPC
		_players = _players - [_player]; // Remove caller
		_players = _players apply {[_x, format ["%1 (%2)", name _x, count units group _x]]}; // Format to Name (group count)
	};
	case "onlywithoutsquad": {
		_players = _players select {_x isEqualTo (leader group _x)}; // Only group leaders (Each solo player is squad leader)
		_players = _players select {(count units group _x) isEqualTo 1}; // Only players which squad counts isEqualTo 1 (SOLO)
		_players = _players - [_player]; // Remove caller
		_players = _players apply {[_x, format ["%1", name _x]]}; // Format to Name 
	};
	case "onlysquadmembers": {
		_players = _players select {(leader group _x) isEqualTo _player};
		_players = _players - [_player];
		_players = _players apply {[_x, format ["%1", name _x]]}; // Format to Name 
	};
	case "all";
	default {
		_players = _players - [_player];
		_players = _players apply {[_x, format ["%1", name _x]]}; // Format to Name 
	};
};

//return
_players