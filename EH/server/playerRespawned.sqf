// On Player Respawned Handler

//Player respawn event handler
"playerRespawned" addPublicVariableEventHandler {
	_unit = _this select 1 select 0;
	_pcid = owner _unit;
	_uid = _this select 1 select 1;
};