//
params ["_box"];

[_box, true] call ace_arsenal_fnc_removeBox;
_box setVariable ["SAA_isArsenal", false, true];

private _jipID = _box getVariable ["SAA_arsenalJIP", ""];
remoteExec ["", _jipID];

//return
true