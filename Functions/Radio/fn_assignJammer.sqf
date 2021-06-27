//

params ["_func", "_dataArray"];

if !(_func isEqualType "string") exitWith {diag_log "Wrong params in fn_assignJammer0"};

switch (_func) do {
	case "Add": {

		_dataArray params ["_distance", "_strenght","_jamObject"];
		if !(_distance isEqualType 0) exitWith {diag_log "Wrong params in fn_assignJammer2"};
		if !(_strenght isEqualType 0) exitWith {diag_log "Wrong params in fn_assignJammer3"};
		if !(_jamObject isEqualType objNull) exitWith {diag_log "Wrong params in fn_assignJammer4"};

		_status = missionNamespace getVariable "JamStatus";
		if (isNil "_status") then {_status = false};
		
		_jammers = [];
		_jammersParams = [];

		if (_status isEqualTo true) then {
			
			_jammers = missionNamespace getVariable "JammersObjects";
			if (isNil "_jammers") then {_jammers = []};

			_jammersParams = missionNamespace getVariable "JammersParams";
			if (isNil "_jammersParams") then {_jammersParams = []};

		};		

		_jammers pushBack _jamObject;
		missionNamespace setVariable ["JammersObjects", _jammers, true];

		_jammersParams pushBack [_distance, _strenght];
		missionNamespace setVariable ["JammersParams", _jammersParams, true];

		diag_log format ["_jammers: %1", _jammers];
		diag_log format ["_jammersParams: %1", _jammersParams];

		if (_status isEqualTo false) then {
			[["Activate"], Shadec_fnc_objectJamming] remoteExec ["spawn", 0];
			missionNamespace setVariable ["JamStatus", true, true];
		};
		
	};
	case "Remove": {
		
		private _jamObject = _dataArray # 0;
		if (isNil "_jamObject") exitWith {diag_log "Wrong params in fn_assignJammer"};
		
		_jammers = missionNamespace getVariable "JammersObjects";
		if (isNil "_jammers") exitWith {diag_log "No jammers"};
		_index =  _jammers find _jamObject;
		if (_index < 0) exitWith {diag_log "Can't find obj in JAMMERS"};

		_jammers = _jammers - [_jamObject];
		_jammersParams = missionNamespace getVariable "JammersParams";
		_jammersParams deleteAt _index;

		if (_jammers isEqualTo []) then {
			missionNamespace setVariable ["JamStatus", false, true];
			_jammersParams = [];
		};

		missionNamespace setVariable ["JammersObjects", _jammers, true];
		missionNamespace setVariable ["JammersParams", _jammersParams, true];

	};
	default {};
};

//
true