// Server-side only
if (!isDedicated) exitWith {"fnc_markerTracking | Server only function"};

// fnc_deleteMarker = {
// 	params ["_marker"];

	
// };

_this spawn {
	params ["_target", "_marker", "_side", ["_deleteIfDead", true], ["_updateTime", 1], ["_precision", 0]];

	while {true} do {
		sleep _updateTime;

		// Marker has been deleted
		if (isNil{_marker}) then {
			break;
		};

		private _position = getMarkerPos _marker;

		// If _target is nil = marker is static
		// Keep rendering in case of new players joins, side changes, etc.
		if (!isNil{_target}) then {
			// Target can be object or group
			if (_target isEqualType objNull) then {
				// if target is an object
				if (_deleteIfDead && {!alive _target}) then {
					// [_marker] call fnc_deleteMarker;
					break;
				};
				_position = getPos _target;
			} else {
				// If target is a group
				if (_target isEqualTo grpNull) then { 
					// [_marker] call fnc_deleteMarker;
					break 
				};
				if ( _deleteIfDead && {{alive _x} count (units _target) < 1}) then { 
					// [_marker] call fnc_deleteMarker;
					break 
				};

				_position = getPos (leader _target);
			};
		};

		if (_precision > 0) then {
			_position = [[[_position, _precision]], [[[0,0,0], 1]]] call BIS_fnc_randomPos;
		};

		[[_position, _marker, _side], {_this call Shadec_fnc_renderMarker}] remoteExec ["call", -2];
		
	};

	private _trackedMarkers = missionNamespace getVariable ["SAA_Tracked_Markers", []];
	missionNamespace setVariable ["SAA_Tracked_Markers", _trackedMarkers - [_marker], true];
	deleteMarker _marker;
};