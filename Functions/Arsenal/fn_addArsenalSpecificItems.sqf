//
params ["_box", "_camo"];

[{ // Condition
	missionNamespace getVariable format["loadoutLoaded_%1", getPlayerUID player]
}, { // Statement
	_this params ["_box", "_camo"];

	if ((_box isEqualTo objNull) || (!alive _box)) exitWith {diag_log format ["fnc_addArsenalSpecificItems | Error: _box not alive or nil"]};
	
	//private _rank = player getVariable ["SAA_Rank", "PV1"];
	private _firstClass = player getVariable ["SAA_PrimaryClass", "None"];
	if (_firstClass isEqualTo "None") exitWith {diag_log format ["fnc_addArsenalSpecificItems | Error: _firstClass is nil"]};
	
	[[_box, _camo, _firstClass], {
		params ["_box", "_camo", "_class"];

		private _specificUniform = ["getUniform", [_camo, _class]] call Shadec_fnc_call_db;
		_specificUniform = _specificUniform apply {_x # 0};

		[[_box, _specificUniform], {
			params ["_box", "_specificUniform"];
			[_box, _specificUniform, false] call ACE_arsenal_fnc_addVirtualItems;
		}] remoteExec ["call", remoteExecutedOwner];

	}] remoteExec ["call", 2];

}, _this, 60, {
	diag_log format ["fnc_addArsenalSpecificItems | Timeout reached"];
}] call CBA_fnc_waitUntilAndExecute;