// ONLY FOR HEADLESSES
// LOCAL EXEC

player setPos [0, 0, 0];

// FPS Monitoring
[] spawn {
	while {true} do {
		private _fps = diag_fps;
		player setVariable ["SAA_HC_FPS", _fps, true];
		sleep 3;
	};
};