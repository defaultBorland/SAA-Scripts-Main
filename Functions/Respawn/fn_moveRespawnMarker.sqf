params ["_markerVar", "_position", "_notification"];

[] call Shadec_fnc_removeFob;

_markerVar setMarkerPos _position;

if (_notification isEqualTo 1) then {[[format["Marker %1 was moved.", _markerVar], "Plain", 2]] remoteExec ["cutText"]}
else {cutText [format["Marker %1 was moved.", _markerVar], "Plain", 2]};