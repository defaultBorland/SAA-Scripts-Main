//
params ["_display"];

private _IDC_buttonLoadouts = 1003;
private _IDC_buttonExport = 1004;
private _IDC_buttonImport = 1005;

{
	(_display displayCtrl _x) ctrlEnable false;
	(_display displayCtrl _x) ctrlShow false;
} forEach [
	_IDC_buttonLoadouts,
	_IDC_buttonExport,
	_IDC_buttonImport
];

