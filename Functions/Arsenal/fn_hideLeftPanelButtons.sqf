params ["_display"];

private _IDC_iconBackgroundPrimaryWeapon = 2001;
private _IDC_buttonPrimaryWeapon = 2002;
private _IDC_iconBackgroundHandgun = 2003;
private _IDC_buttonHandgun = 2004;
private _IDC_iconBackgroundSecondaryWeapon = 2005;
private _IDC_buttonSecondaryWeapon = 2006;
private _IDC_iconBackgroundNVG = 2017;
private _IDC_buttonNVG = 2018;
private _IDC_iconBackgroundBinoculars = 2019;
private _IDC_buttonBinoculars = 2020;
private _IDC_iconBackgroundGPS = 2023;
private _IDC_buttonGPS = 2024;
private _IDC_iconBackgroundCompass = 2028;
private _IDC_buttonCompass = 2029;
private _IDC_iconBackgroundWatch = 2030;
private _IDC_buttonWatch = 2031;
private _IDC_iconBackgroundVoice = 2034;
private _IDC_buttonVoice = 2035;

{
	(_display displayCtrl _x) ctrlEnable false;
	(_display displayCtrl _x) ctrlShow false;
	(_display displayCtrl _x) ctrlCommit 0;
} forEach [
	_IDC_buttonPrimaryWeapon,
	_IDC_buttonHandgun,
	_IDC_buttonSecondaryWeapon,
	_IDC_buttonNVG,
	_IDC_buttonBinoculars,
	_IDC_buttonGPS,
	_IDC_buttonCompass,
	_IDC_buttonWatch,
	_IDC_buttonVoice
];

{
	(_display displayCtrl _x) ctrlShow false;
	(_display displayCtrl _x) ctrlCommit 0;
} forEach [
	_IDC_iconBackgroundPrimaryWeapon,
	_IDC_iconBackgroundHandgun,
	_IDC_iconBackgroundSecondaryWeapon,
	_IDC_iconBackgroundNVG,
	_IDC_iconBackgroundBinoculars,
	_IDC_iconBackgroundGPS,
	_IDC_iconBackgroundCompass,
	_IDC_iconBackgroundWatch,
	_IDC_iconBackgroundVoice
];