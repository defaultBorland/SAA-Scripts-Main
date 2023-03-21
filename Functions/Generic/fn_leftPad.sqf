params ["_string", "_length", ["_symbol", "0"]];

_string = str _string;

if (count _symbol > 1) then {_symbol = _symbol select [0, 1]};

while {(count _string) < _length} do {
	_string = _symbol + _string;
};

_string