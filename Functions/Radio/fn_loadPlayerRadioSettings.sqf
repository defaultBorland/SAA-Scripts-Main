//

// Only local exec allowed
if (isDedicated) exitWith {};

private _swSavedData = profileNamespace getVariable ["SAA_lastRadioSwSettings", []];
private _lrSavedData = profileNamespace getVariable ["SAA_lastRadioLrSettings", []];

if (call TFAR_fnc_haveSWRadio) then {
	if (_swSavedData isEqualTo []) exitWith {};
	[call TFAR_fnc_activeSwRadio, _swSavedData] call TFAR_fnc_setSwSettings;
};

if (call TFAR_fnc_haveLRRadio) then {
	if (_lrSavedData isEqualTo []) exitWith {};
	[call TFAR_fnc_activeLrRadio, _lrSavedData] call TFAR_fnc_setLrSettings;
};