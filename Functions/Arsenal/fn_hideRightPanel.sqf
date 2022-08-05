params ["_display"];

private _IDC_iconBackgroundOptic = 21;
private _IDC_buttonOptic = 22;
private _IDC_iconBackgroundItemAcc = 23;
private _IDC_buttonItemAcc = 24;
private _IDC_iconBackgroundMuzzle = 25;
private _IDC_buttonMuzzle = 26;
private _IDC_iconBackgroundBipod = 27;
private _IDC_buttonBipod = 28;
private _IDC_iconBackgroundCurrentMag = 3001;
private _IDC_buttonCurrentMag = 3002;
private _IDC_iconBackgroundCurrentMag2 = 3003;
private _IDC_buttonCurrentMag2 = 3004;
private _IDC_iconBackgroundMag = 29;
private _IDC_buttonMag = 30;
private _IDC_iconBackgroundMagALL = 31;
private _IDC_buttonMagALL = 32;
private _IDC_iconBackgroundThrow = 33;
private _IDC_buttonThrow = 34;
private _IDC_iconBackgroundPut = 35;
private _IDC_buttonPut = 36;
private _IDC_iconBackgroundMisc = 37;
private _IDC_buttonMisc = 38;
private _IDC_buttonRemoveAllSelected = 39;
private _IDC_buttonRemoveAll = 40;

//private _IDC_tabRight = ;
private _IDC_arrowMinus = 101;
private _IDC_arrowPlus = 102;

// private _RIGHT_PANEL_ACC_IDCS = [
// 	_IDC_buttonOptic, 
// 	_IDC_buttonItemAcc, 
// 	_IDC_buttonMuzzle, 
// 	_IDC_buttonBipod
// ];

// private = _RIGHT_PANEL_ACC_BACKGROUND_IDCS = [
// 	_IDC_iconBackgroundOptic, 
// 	_IDC_iconBackgroundItemAcc, 
// 	_IDC_iconBackgroundMuzzle, 
// 	_IDC_iconBackgroundBipod
// ];

// private _RIGHT_PANEL_ITEMS_IDCS = [
// 	_IDC_buttonMag, 
// 	_IDC_buttonMagALL, 
// 	_IDC_buttonThrow, 
// 	_IDC_buttonPut, 
// 	_IDC_buttonMisc
// ];

// private _RIGHT_PANEL_ITEMS_BACKGROUND_IDCS = [
// 	_IDC_iconBackgroundMag, 
// 	_IDC_iconBackgroundMagALL, 
// 	_IDC_iconBackgroundThrow, 
// 	_IDC_iconBackgroundPut, 
// 	_IDC_iconBackgroundMisc
// ];

// private _ARROWS_IDCS = [
// 	_IDC_arrowMinus,
// 	_IDC_arrowPlus
// ];

private _IDC_blockRightFrame = 5;
private _IDC_blockRighttBackground = 6;
private _IDC_loadIndicator = 7;
private _IDC_loadIndicatorBar = 701;
private _IDC_rightTabContent = 14;
private _IDC_rightTabContentListnBox = 15;
private _IDC_sortRightTab = 17;
private _IDC_rightSearchbar = 19;
private _IDC_rightSearchbarButton = 42;

{
	(_display displayCtrl _x) ctrlShow false;
	(_display displayCtrl _x) ctrlCommit 0;
} forEach [
	_IDC_blockRightFrame,
    _IDC_blockRighttBackground,
    _IDC_loadIndicator,
    _IDC_rightTabContent,
    _IDC_rightTabContentListnBox,
    _IDC_sortRightTab,
    _IDC_iconBackgroundOptic, 
	_IDC_iconBackgroundItemAcc, 
	_IDC_iconBackgroundMuzzle, 
	_IDC_iconBackgroundBipod,
    _IDC_buttonOptic, 
	_IDC_buttonItemAcc, 
	_IDC_buttonMuzzle, 
	_IDC_buttonBipod,
    _IDC_buttonMag, 
	_IDC_buttonMagALL, 
	_IDC_buttonThrow, 
	_IDC_buttonPut, 
	_IDC_buttonMisc,
    _IDC_iconBackgroundMag, 
	_IDC_iconBackgroundMagALL, 
	_IDC_iconBackgroundThrow, 
	_IDC_iconBackgroundPut, 
	_IDC_iconBackgroundMisc,
    _IDC_buttonRemoveAll,
    _IDC_rightSearchbar,
    _IDC_rightSearchbarButton,
    _IDC_buttonCurrentMag,
    _IDC_buttonCurrentMag2,
    _IDC_iconBackgroundCurrentMag,
    _IDC_iconBackgroundCurrentMag2,
	_IDC_arrowMinus,
	_IDC_arrowPlus
];