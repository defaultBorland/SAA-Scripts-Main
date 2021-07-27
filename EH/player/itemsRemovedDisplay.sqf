//
"removedItems" addPublicVariableEventHandler {
	diag_log format ["removed_EH params: %1", _this];
	private _removedItemsArray = _this # 1;	
	diag_log format["REMOVEDITEMS_EH | _removedItemsArray: %1", _removedItemsArray];

	// Display removed restricted items from player storage
	if !(_removedItemsArray isEqualTo []) then {
		player addAction [localize "SAA_ACTION_REMOVEDITEMSLIST", {
			(_this # 3) params ["_itemsRemoved"];
			createDialog "Dialog_RemovedItemsList";
			((findDisplay 100) displayCtrl 102) ctrlSetText localize "SAA_DESCRIPTION_REMOVEDITEMSLIST_HEADER";
			((findDisplay 100) displayCtrl 103) ctrlSetText localize "SAA_DESCRIPTION_REMOVEDITEMSLIST_DESC";
			((findDisplay 100) displayCtrl 104) ctrlSetText localize "SAA_DESCRIPTION_REMOVEDITEMSLIST_HINT";
			((findDisplay 100) displayCtrl 106) ctrlSetText localize "SAA_GENERAL_HIDE";

			_ctrl = (findDisplay 100) displayCtrl 101; diag_log format["REMOVEDITEMS_ACTION | _itemsRemoved: %1", _itemsRemoved];
			[_itemsRemoved, _ctrl] call Shadec_fnc_removedItemsListDisplay;
		}, [_removedItemsArray]];
	};
};