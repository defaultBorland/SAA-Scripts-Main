//
params ["_group"];

[{
	params ["_group"];
	[[_group], {
		params ["_group"];
		private _newOwner = call Shadec_fnc_determineBestOwner;
		_group setGroupOwner _newOwner;
	}] remoteExec ["call", 2];
}, [_group], 1] call CBA_fnc_waitAndExecute;