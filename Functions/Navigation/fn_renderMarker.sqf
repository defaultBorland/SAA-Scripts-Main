// Local exec only
if (!hasInterface) exitWith {diag_log format["%1 | Local only function", __FILE_NAME__]; false};

params ["_position", "_marker", "_side"];

// Player is Zeus - show all respawn markers
if (player getVariable ["SAA_isZeus", false]) exitWith {
	_marker setMarkerAlphaLocal 1;
	_marker setMarkerPosLocal _position;
};

// Player not alive
// if (!alive player) exitWith {
// 	_marker setMarkerAlphaLocal 0;
// };

// GPS is disabled
// Maybe just exit to leave marker as is (no signal but last data saved?)
if (missionNamespace getVariable ["SAA_isGPSDisabled", false]) exitWith {
	_marker setMarkerAlphaLocal 0;
};

// Player of another side
if ((side group player) isNotEqualTo _side) exitWith {
	_marker setMarkerAlphaLocal 0;
};

// Player on foot and doesn't have any navigation device
if (
	(vehicle player) isEqualTo player
	&& {!([player] call Shadec_fnc_hasNavigationItem)}
) exitWith {
	_marker setMarkerAlphaLocal 0;
};

// Player in vehicle that does not have any navigation device such as player
if (
	(vehicle player) isNotEqualTo player
	&& {!([player] call Shadec_fnc_hasNavigationItem)}
	&& {getNumber(configFile >> "CfgVehicles" >> typeOf (vehicle player) >> "enableGPS") isEqualTo 0}
) exitWith {
	_marker setMarkerAlphaLocal 0;
};

// All checks passed
_marker setMarkerAlphaLocal 1;
_marker setMarkerPosLocal _position;

true