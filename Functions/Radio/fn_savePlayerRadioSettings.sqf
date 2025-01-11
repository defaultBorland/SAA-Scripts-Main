// Only local exec allowed
if (!hasInterface) exitWith {diag_log format["%1 | Local only function", __FILE_NAME__]; false};

if (call TFAR_fnc_haveSWRadio) then {
	private _swRadioSettings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
	profileNamespace setVariable ["SAA_lastRadioSwSettings", _swRadioSettings];
} else {
	profileNamespace setVariable ["SAA_lastRadioSwSettings", []];
};

if (call TFAR_fnc_haveLRRadio) then {
	private _lrRadioSettings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
	profileNamespace setVariable ["SAA_lastRadioLrSettings", _lrRadioSettings];
} else {
	profileNamespace setVariable ["SAA_lastRadioLrSettings", []];
};