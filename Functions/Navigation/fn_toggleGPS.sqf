// Local exec only
if (!hasInterface) exitWith {diag_log "fnc_setGPSWorkability | Client only local function"};

disableSerialization;

// Toggle GPS
params["_state"];
[{
	params ["_state"];
	private _display = uiNamespace getVariable ["RscCustomInfoMiniMap", displayNull];
	if (isNull _display) exitWith {};
	private _map = 	(_display displayCtrl 13301 controlsGroupCtrl 101);
	private _bg = _display displayCtrl 15110;
	private _time = _display displayCtrl 199;
	private _azim = _display displayCtrl 198;
	private _grid = _display displayCtrl 197;
 	_map ctrlShow _state;
	//_time ctrlShow _state;
	//_azim ctrlShow _state;
	_grid ctrlShow _state;
	_bg ctrlSetText (["img\background_ca_noSignal.paa", "A3\Ui_f\data\IGUI\RscCustomInfo\background_ca.paa"] select _state);

	private _mapDisplay = findDisplay 12;
	private _gpsCoords = _mapDisplay displayCtrl 913592;
	_gpsCoords ctrlShow _state;
}, {
	params ["_state"];
	!isNull (uiNamespace getVariable ["RscCustomInfoMiniMap", displayNull])
	|| (!(missionNamespace getVariable ["SAA_isGPSDisabled", false])) isNotEqualTo _state
},[_state], -1] call CBA_fnc_waitUntilAndExecute;