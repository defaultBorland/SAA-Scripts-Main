params ["_string", ["_length", 1], ["_symbol", "0"]];

if !(_string isEqualType "STRING") then {
	_string = str _string;
};
//if (_string isEqualTo "") exitWith {};

if (count _symbol > 1) then {_symbol = _symbol select [0, 1]};

while {(count _string) < _length} do {
	_string = _string + _symbol;
};

_string