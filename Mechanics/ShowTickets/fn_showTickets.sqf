//
params ["_unit"];
private _side = side _unit;

private _sidesInfo = [[east, "#800000", "\A3\UI_F\data\Map\Markers\NATO\o_unknown"], [west, "#004D99", "\A3\UI_F\data\Map\Markers\NATO\b_unknown"], [independent, "#008000", "\A3\UI_F\data\Map\Markers\NATO\n_unknown"], [civilian, "#660080", "\A3\UI_F\data\Map\Markers\NATO\b_unknown"]];
private _info = _sidesInfo # ([_side] call BIS_fnc_sideID);
_info params ["_side", "_color", "_picture"];

if (count (_side call BIS_fnc_getRespawnPositions) < 1) then {
	[[_color, _picture], {
		params ["_color", "_sidePicturePath"];
		hint parseText format ["<t align='center'><img size='4' color='%1' image='%2'/></t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>", _color, _sidePicturePath, localize "SAA_SHOWTICKETS_NORESPAWNPOINTAVAILIABLE"];
	}] remoteExec ["call", remoteExecutedOwner];
} else {
	private _tickets = [_side, 0] call BIS_fnc_respawnTickets;
	
	[[_picture, _color, _tickets], {
		params ["_sidePicturePath", "_color", "_tickets"];
		private _hasTickets = false;
		if (_tickets > -1) then {_hasTickets = true}; 

		hint parseText format ["<t align='center'><img size='4' color='%1' image='%2'/></t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>", _color, _sidePicturePath, format["%1: %2", localize "SAA_SHOWTICKETS_TICKETSLEFT", [localize "SAA_SHOWTICKETS_UNLIMITED", _tickets] select _hasTickets]];
	}] remoteExec ["call", remoteExecutedOwner];
};