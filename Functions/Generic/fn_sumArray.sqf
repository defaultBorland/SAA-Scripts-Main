//
params ["_array"];

private _sum = 0;
{
    _sum = _sum + _x;
} forEach _array;

//return
_sum