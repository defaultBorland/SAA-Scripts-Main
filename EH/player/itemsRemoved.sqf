//
"removedItems" addPublicVariableEventHandler {
	diag_log format ["removed_EH params: %1", _this];
	private _removedItemsArray = _this # 1;	
	diag_log format["REMOVEDITEMS_EH | _removedItemsArray: %1", _removedItemsArray];

	//
	if !(_removedItemsArray isEqualTo []) then {
		if !(isNil {player getVariable "itemsRemoved_actionID"}) then { // If another itemsRemoved already exists - overwrite
			player removeAction (player getVariable "itemsRemoved_actionID");
		};
		player setVariable ["itemsRemoved_actionID", // addAction will return actionId which will be the value
			player addAction [localize "SAA_REMOVEDITEMSLIST_ACTION", {
				(_this # 3) params ["_removedItemsArray"];

				createDialog "dialog_ListNBox";
				_display = (findDisplay 1000);
				(_display displayCtrl 1002) ctrlSetText localize "SAA_REMOVEDITEMSLIST_HEADER"; // Set header text
				[_display displayCtrl 1010, _removedItemsArray] call Shadec_fnc_fillListNBox; // Populate listbox
				
				private _buttonHelp = _display displayCtrl 1080;
				_buttonHelp ctrlSetText localize "SAA_GENERAL_HELP";
				_buttonHelp ctrlAddEventHandler ["ButtonDown",	{
					params ["_ctrl"];

					createDialog "Helper";
					((findDisplay 1100) displayCtrl 1110) ctrlSetText (localize "SAA_REMOVEDITEMSLIST_HELP_1" + endl + endl + localize "SAA_REMOVEDITEMSLIST_HELP_2" + endl + endl + localize "SAA_REMOVEDITEMSLIST_HELP_3");
					((findDisplay 1100) displayCtrl 1190) buttonSetAction "closeDialog 0";
				}];
				
				private _buttonClose = _display displayCtrl 1090;
				_buttonClose ctrlSetText localize "SAA_GENERAL_CLOSE";
				_buttonClose ctrlAddEventHandler ["ButtonDown",	{
					params ["_ctrl"];
					closeDialog 0;
					player removeAction (player getVariable "itemsRemoved_actionID");

					player setVariable ["itemsRemoved_actionID", nil];
					missionNamespace setVariable [format["removedItems_%1", getPlayerUID player], [], true];
				}];
			}, [_removedItemsArray]]
		]
	};
};