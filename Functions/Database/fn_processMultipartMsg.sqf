// Server-side exec only
if (!isDedicated) exitWith {diag_log "fnc_processMultipartMsg | Server only function"};

params ["_msgId"];

private _return = "";

while {true} do {
	private _msg = "Extdb3" callExtension format ["5:%1", _msgId];
	if (_msg isEqualTo "") then { break };

	_return = _return + _msg;
};

_return = (parseSimpleArray _return) # 1;
// diag_log format["fnc_processMultipartMsg: %1 | %2", typeName _return, _return];

_return