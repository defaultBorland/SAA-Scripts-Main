// Local exec only
if (!hasInterface) exitWith {diag_log "fnc_renderMarker | Client only local function"};

params ["_position", "_marker", "_side"];

// Player is Zeus - show all respawn markers
if (player getVariable ["SAA_isZeus", false]) exitWith {
	_marker setMarkerAlphaLocal 1;
	_marker setMarkerPosLocal _position;
};

// GPS is disabled
// Maybe just exit to leave marker as is (no signal but last data saved?)
if (missionNamespace getVariable ["SAA_isGPSDisabled", false]) exitWith {
	_marker setMarkerAlphaLocal 0;
};

// Player of another side
if ((side group player) isNotEqualTo _side) exitWith {
	_marker setMarkerAlphaLocal 0;
};

// Player does not have any navigation device and alive
if (alive player && !([player] call Shadec_fnc_hasNavigationItem)) exitWith {
	_marker setMarkerAlphaLocal 0;
};

// All checks passed
_marker setMarkerAlphaLocal 1;
_marker setMarkerPosLocal _position;

true