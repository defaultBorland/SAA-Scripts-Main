params ["_name", "_position", "_radius"];

[missionNamespace, "Draw3D", {
	_thisArgs params ["_name", "_position", "_radius"];

	private _fortifyLocationsInfo = missionNamespace getVariable ["SAA_fortify_locations", []];
	private _fortifyLocationsNames = _fortifyLocationsInfo apply {_x # 0};

	// If zone were removed
	if !(_name in _fortifyLocationsNames) exitWith {
		removeMissionEventHandler [_thisType, _thisID];
	};

	private _visibleAreas = player getVariable ["SAA_fortify_visibleLocations", []];

	// If visualization were disabled
	if !(_name in _visibleAreas) exitWith {
		removeMissionEventHandler [_thisType, _thisID];
	};

	private _center = if (_position isEqualType objNull) then {
		ASLToAGL getPosASLVisual _position
	} else {
		ASLToAGL _position
	}; 

	private _count = 6 max floor (2 * pi * _radius ^ 0.65 / 2);
	private _factor = 360 / _count;

	private _color = [1,0.373,0.122,1];

	drawIcon3D ["", _color, _center, 0.5, 0.5, 0, _name];

	for "_i" from 0 to (_count - 1) do {
		private _phi = _i * _factor;
		private _posVector = [_radius * cos _phi, _radius * sin _phi, 0];

		drawIcon3D ["\a3\ui_f\data\map\markers\military\dot_ca.paa", _color, _center vectorAdd _posVector, 0.5, 0.5, 0];
	};
}, [_name, _position, _radius]] call CBA_fnc_addBISEventHandler;