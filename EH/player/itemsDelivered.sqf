//
"deliveredItems" addPublicVariableEventHandler {
	//diag_log format ["delivered_EH params: %1", _this];
	private _deliveredItemsArray = _this # 1;	
	//diag_log format["DELIVEREDITEMS_EH | _deliveredItemsArray: %1", _deliveredItemsArray];

	//
	if !(_deliveredItemsArray isEqualTo []) then {
		if !(isNil {player getVariable "itemsDelivered_actionID"}) then { // If another itemsDelivered already exists - overwrite
			player removeAction (player getVariable "itemsDelivered_actionID");
		};
		player setVariable ["itemsDelivered_actionID", // addAction will return actionId which will be the value
			player addAction [localize "STR_SAA_DELIVEREDITEMSLIST_ACTION", {
				(_this # 3) params ["_deliveredItemsArray"];

				createDialog "dialog_ListNBox";
				_display = (findDisplay 1000);
				(_display displayCtrl 1002) ctrlSetText localize "STR_SAA_DELIVEREDITEMSLIST_HEADER"; // Set header text
				[_display displayCtrl 1010, _deliveredItemsArray] call Shadec_fnc_fillListNBox; // Populate listbox
				
				private _buttonHelp = _display displayCtrl 1080;
				_buttonHelp ctrlSetText localize "STR_SAA_GENERAL_HELP";
				_buttonHelp ctrlAddEventHandler ["ButtonDown",	{	
					params ["_ctrl"];

					createDialog "Helper";
					((findDisplay 1100) displayCtrl 1110) ctrlSetText (localize "STR_SAA_DELIVEREDITEMSLIST_HELP_1" + endl + endl + localize "STR_SAA_DELIVEREDITEMSLIST_HELP_2" + endl + endl + localize "STR_SAA_DELIVEREDITEMSLIST_HELP_3");
					((findDisplay 1100) displayCtrl 1190) buttonSetAction "closeDialog 0";
				}];

				private _buttonClose = _display displayCtrl 1090;
				_buttonClose ctrlSetText localize "STR_SAA_GENERAL_CLOSE";
				_buttonClose ctrlAddEventHandler ["ButtonDown",	{	
					params ["_ctrl"];
					closeDialog 0;
					player removeAction (player getVariable "itemsDelivered_actionID");

					player setVariable ["itemsDelivered_actionID", nil];
					missionNamespace setVariable [format["SAA_deliveredItems_%1", getPlayerUID player], [], true];
				}];
			}, [_deliveredItemsArray]]
		];
	};
};