// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

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