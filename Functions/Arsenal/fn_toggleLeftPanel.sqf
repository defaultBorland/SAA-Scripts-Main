params ["_display", "_state"];

private _IDC_blockLeftFrame = 3;
private _IDC_blockLeftBackground = 4;
private _IDC_leftTabContent = 13;

private _IDC_sortLeftTab = 16;
private _IDC_sortLeftTabDirection = 161;
private _IDC_leftSearchbar = 18;
private _IDC_leftSearchbarButton = 41;

private _IDC_statsBox = 51;
private _IDC_statsPreviousPage = 52;
private _IDC_statsNextPage = 53;
private _IDC_statsCurrentPage = 54;
private _IDC_statsButton = 55;
private _IDC_statsButtonClose = 56;

{
	(_display displayCtrl _x) ctrlShow _state;
} forEach [
	_IDC_blockLeftFrame,
	_IDC_blockLeftBackground,
	_IDC_leftTabContent,
	_IDC_sortLeftTab,
	_IDC_sortLeftTabDirection,
	_IDC_leftSearchbar,
	_IDC_leftSearchbarButton,
	_IDC_statsBox,
	_IDC_statsButton,
	_IDC_statsPreviousPage,
	_IDC_statsCurrentPage,
	_IDC_statsNextPage
];