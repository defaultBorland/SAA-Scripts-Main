//

params ["_action"]; // "Activate", "Check";

if (!hasInterface) exitwith {diag_log "HASn't interface"};
waituntil {!isnull player};

switch (_action) do {
	case "Check": {
		private _status = missionNamespace getVariable "JamStatus";
		if (isNil "_status") exitWith {diag_log "No jamming at the moment."};
		if (_status isEqualTo false) exitWith {diag_log "No jamming at the moment."};
		//
		[["Activate"], Shadec_fnc_objectJamming] remoteExec ["spawn", player]
	};
	case "Activate": {		

		//Define the variables along with their default values.
		_jammers = missionNamespace getVariable "JammersObjects";
		_jammersParams = missionNamespace getVariable "JammersParams";
		_jamStatus = missionNamespace getVariable "JamStatus";
		_rad = 1;
		_strength = 49; // Minus one so that radio interference never goes below 1 near the edge of the radius (which is the default for TFAR).
		_debug = false;

		//compare distances between jammers and player to find nearest jammer and set it as _jammer
		_jammerDist = {
			_jammer = objNull;
			_closestDist = 1000000;
			{
				if (_x distance player < _closestdist) then {
					_jammer = _x;
					_closestDist = _x distance player;
				};
			} foreach _jammers;
			_jammer;
		};
		_jammer = call _jammerDist;

		// While the Jamming Vehicle is not destroyed, loop every 5 seconds
		while {_jamStatus} do
		{	
			_index = _jammers find _jammer;
			if (_index < 0) exitWith {diag_log "JAM ERROR: OBJ NOT FOUND"};

			_rad = _jammersParams # _index # 0;
			_strength = (_jammersParams # _index # 1) - 1;

			// Set variables
			_dist = player distance _jammer;
			_distPercent = _dist / _rad;
			_interference = 1;
			_sendInterference = 1;

			if (_dist < _rad) then {
				_interference = _strength - (_distPercent * _strength) + 1; // Calculate the recieving interference, which has to be above 1 to have any effect.
				_sendInterference = 1/_interference; //Calculate the sending interference, which needs to be below 1 to have any effect.
			};
			// Set the TF receiving and sending distance multipliers
			player setVariable ["tf_receivingDistanceMultiplicator", _interference];
			player setVariable ["tf_sendingDistanceMultiplicator", _sendInterference];
			
			// Debug chat and marker.
			if (_debug) then {
				deletemarkerLocal "CIS_DebugMarker";
				deletemarkerLocal "CIS_DebugMarker2";
				//Area marker
				_debugMarker = createmarkerLocal ["CIS_DebugMarker", position _jammer];
				_debugMarker setMarkerShapeLocal "ELLIPSE";
				_debugMarker setMarkerSizeLocal [_rad, _rad];
				
				//Position Marker
				_debugMarker2 = createmarkerLocal ["CIS_DebugMarker2", position _jammer];
				_debugMarker2 setMarkerShapeLocal "ICON";
				_debugMarker2 setMarkerTypeLocal "mil_dot";
				_debugMarker2 setMarkerTextLocal format ["%1", _jammer];
				
				systemChat format ["Distance: %1, Percent: %2, Interference: %3, Send Interference: %4", _dist,  100 * _distPercent, _interference, _sendInterference];
				systemChat format ["Active Jammer: %1, Jammers: %2",_jammer, _jammers];
				//copyToClipboard (str(Format ["Distance: %1, Percent: %2, Interference: %3", _dist,  100 * _distPercent, _interference]));

			};
			// Sleep 5 seconds before running again
			sleep 5.0;
			
			_jammers = missionNamespace getVariable "JammersObjects";
			_jammersParams = missionNamespace getVariable "JammersParams";

			{
				if !(alive _x) then {
					[["Remove", _x], Shadec_fnc_assignJammer] remoteExec ["call", 2];
					_jammers = _jammers - [_x];
					
					if (_jammers isEqualTo []) then {
						missionNamespace setVariable ["JamStatus", false, true];
					};

				};
			} foreach _jammers;
			

			_jamStatus = missionNamespace getVariable "JamStatus";
			_jammer = call _jammerDist;
		};

		//Set TFR settings back to normal before exiting the script
		player setVariable ["tf_receivingDistanceMultiplicator", 1];
		player setVariable ["tf_sendingDistanceMultiplicator", 1];

	};
};