//
params ["_unit"];
private _side = side _unit;
private _text = "";

private _sidesColors = [[west, "#004D99"], [east, "#800000"], [independent, "#008000"], [civilian, "#660080"]];
private _color = (_sidesColors select {(_x # 0) isEqualTo _side}) # 0 # 1;
private _sidePicturePaths = ["\A3\UI_F\data\Map\Markers\NATO\b_unknown", "\A3\UI_F\data\Map\Markers\NATO\o_unknown", "\A3\UI_F\data\Map\Markers\NATO\n_unknown", "\A3\UI_F\data\Map\Markers\NATO\b_unknown"];
private _picture = (_sidePicturePaths select {(_x # 0) isEqualTo _side}) # 0 # 1;

if (count (side call BIS_fnc_getRespawnPositions) < 1) then {
	_text = localize "SAA_SHOWTICKETS_NORESPAWNPOINTAVAILIABLE";
	
	[[_picture, _color, _text], {
		params ["_sidePicturePath", "_color", "_text"];
		hint parseText format ["<t align='center'><img size='4' color='%1' image='%2'/></t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>", _sidePicturePath, _color, _text];
	}] remoteExec ["call", -2];
} else {
	private _tickets = [_side, 0] call BIS_fnc_respawnTickets;
	if (_tickets isEqualTo -1) then {_tickets = localize "SAA_SHOWTICKETS_UNLIMITED"};
	_text = format["%1: %2", localize "SAA_SHOWTICKETS_TICKETSLEFT", _tickets];

	[[_picture, _color, _text], {
		params ["_sidePicturePath", "_color", "_text"];
		hint parseText format ["<t align='center'><img size='4' color='%1' image='%2'/></t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>", _sidePicturePath, _color, _text];
	}] remoteExec ["call", -2];
};