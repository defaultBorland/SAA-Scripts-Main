// On Player Connected Handler

//Player connected handler
_EH_PlayerConnected = addMissionEventHandler ["PlayerConnected", {
	params["_id", "_uid", "_name", "_jip", "_owner"];
    _pcid = _this select 0;
    _uid = _this select 1;
    _pname = _this select 2;
}];