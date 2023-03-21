// Author: killzone_kid

params ["_string"];

if (!(_string isEqualType "") || _string isEqualTo "") exitWith {false};
{
	if (_x isNotEqualTo "0" && parseNumber _x isEqualTo 0) exitWith {true};
} count (_string splitString "") isEqualTo 0