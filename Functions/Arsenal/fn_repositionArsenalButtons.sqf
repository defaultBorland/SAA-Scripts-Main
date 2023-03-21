params ["_display"];

private _IDC_iconBackgroundHeadgear = 2007;
private _IDC_buttonHeadgear = 2008;
private _IDC_iconBackgroundUniform = 2009;
private _IDC_buttonUniform = 2010;
private _IDC_iconBackgroundVest = 2011;
private _IDC_buttonVest = 2012;
private _IDC_iconBackgroundBackpack = 2013;
private _IDC_buttonBackpack = 2014;
private _IDC_iconBackgroundGoggles = 2015;
private _IDC_buttonGoggles = 2016;
private _IDC_iconBackgroundMap = 2021;
private _IDC_buttonMap = 2022;
private _IDC_iconBackgroundRadio = 2025;
private _IDC_buttonRadio = 2026;
private _IDC_iconBackgroundFace = 2032;
private _IDC_buttonFace = 2033;
private _IDC_iconBackgroundInsigna = 2036;
private _IDC_buttonInsignia = 2037;

private _pixelScale = 0.25;
private _GRID_H = (pixelH * pixelGridNoUIScale * _pixelScale);

{
	_x params ["_back", "_button"];
	(_display displayCtrl _back) ctrlSetPositionY (_forEachIndex * 10 * _GRID_H);
	(_display displayCtrl _button) ctrlSetPositionY (_forEachIndex * 10 * _GRID_H);

	(_display displayCtrl _back) ctrlCommit 0;
	(_display displayCtrl _button) ctrlCommit 0;
} forEach [
	[_IDC_iconBackgroundHeadgear, _IDC_buttonHeadgear],
	[_IDC_iconBackgroundUniform, _IDC_buttonUniform],
	[_IDC_iconBackgroundVest, _IDC_buttonVest],
	[_IDC_iconBackgroundBackpack, _IDC_buttonBackpack],
	[_IDC_iconBackgroundGoggles, _IDC_buttonGoggles],
	[_IDC_iconBackgroundMap, _IDC_buttonMap],
	[_IDC_iconBackgroundRadio, _IDC_buttonRadio],
	[_IDC_iconBackgroundFace, _IDC_buttonFace],
	[_IDC_iconBackgroundInsigna, _IDC_buttonInsignia]
];