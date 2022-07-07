/*
* Display message on debug extension log on server.
*
* Arguments:
* 0: Message <STRING>
* 1: Color or Purpose <STRING> (OPTIONAL)
* 	"Red", "Green", "Blue" or "Warning", "Info", "Debug"
*
* Return Value:
* None
*
* Example:
* ["Message"] call Shadec_fnc_createLogServer
*
*/

params ["_message", "_color"];

if !(isNil {_color}) then {
	_color = switch (toLower _color) do {
		case "warning";
		case "red": {"#1001"};
		
		case "info";
		case "green": {"#0101"};

		case "debug";
		case "blue": {"#0011"};
		default {"#1111"};
	};
} else {
	_color = "#1111";
};

[[_message, _color], {
	"debug_console" callExtension ((_this # 0) + (_this # 1))
}] remoteExec ["call", 2];