params ["_varName"];

switch (_varName) do {
	case "respawnEnabled": {
		[[(format["Current global respawn state: %1", ["Disabled", "Enabled"] select respawnEnabled]), "Plain Down", 2]] remoteExec ["cutText", remoteExecutedOwner];
	};
	case "respawnTickets": {
		[[(format["Respawn tickets remaining: %1", respawnTickets]), "Plain Down", 2]] remoteExec ["cutText", remoteExecutedOwner];
	};
	case "respawnTime": {
		[[(format["Current respawn time: %1", respawnTime]), "Plain Down", 2]] remoteExec ["cutText", remoteExecutedOwner];
	};
	default {
		[[(format["This variable doesn't described, sorry."]), "Plain Down", 2]] remoteExec ["cutText", remoteExecutedOwner];
	};
};

//return
true