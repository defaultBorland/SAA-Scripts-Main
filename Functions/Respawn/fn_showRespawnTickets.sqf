params["_target"];

if (_target isEqualTo "Zeus") then {
	[format["[Private] Respawn tickets remaining: %1", respawnTickets]] remoteExec ["systemChat", remoteExecutedOwner];
	[[(format["Respawn tickets remaining: %1", respawnTickets]), "Plain", 2]] remoteExec ["cutText", remoteExecutedOwner];
} else {[format["Respawn tickets remaining: %1", respawnTickets]] remoteExec ["systemChat"]};

//return
respawnTickets