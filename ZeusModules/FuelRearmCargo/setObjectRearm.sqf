[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_FUEL_CARGO_REARM", localize "STR_SAA_ZEUS_MODULES_REARM_SET_OBJECT_REARM_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	if (isNull _objectUnderCursor) exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_NO_OBJECT_SELECTED"] call bis_fnc_showCuratorFeedbackMessage;
	};

    if (_objectUnderCursor isKindOf "Man") exitWith {
		[objNull, localize "STR_SAA_ZEUS_MESSAGES_ERROR_MUST_NOT_BE_A_MAN"] call bis_fnc_showCuratorFeedbackMessage;
	};

    private _isSupply = [_objectUnderCursor] call ace_rearm_fnc_isSource;
	private _currentSupply = [1200, [_objectUnderCursor] call ace_rearm_fnc_getSupplyCount] select _isSupply;

	[localize "STR_SAA_ZEUS_MODULES_REARM_SET_OBJECT_REARM_DIALOG_HEADER",
		[
			["SLIDER", [localize "STR_SAA_ZEUS_MODULES_REARM_SET_OBJECT_REARM_DIALOG_SIZE_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_REARM_SET_OBJECT_REARM_DIALOG_SPACE_TOOLTIP"],
				[
					-1, 10000, _currentSupply, 0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_newSupply"];
			_args params ["_objectUnderCursor", "_currentSupply", "_isSupply"];

            if (_newSupply isEqualTo -1) exitWith {
                [[_objectUnderCursor], {
                    params["_objectUnderCursor"];
                    [_objectUnderCursor] call ace_rearm_fnc_disable;
                    [_objectUnderCursor, 0] call ace_rearm_fnc_setSupplyCount;
                }] remoteExec ["call", 2];
                [localize "STR_SAA_GENERAL_SUCCESS", localize "STR_SAA_ZEUS_MODULES_REARM_SET_OBJECT_REARM_DISABLE_ZEUSMESSAGE_SUCCESS", 3] call BIS_fnc_curatorHint;
            };

            [[_objectUnderCursor, _newSupply, _isSupply], {
                params["_objectUnderCursor", "_newSupply", "_isSupply"];

                // Enable rearm
                [_objectUnderCursor, false] call ace_rearm_fnc_disable;

                // Set supply
                if (_isSupply) then {
                    [_objectUnderCursor, _newSupply] call ace_rearm_fnc_setSupplyCount;
                } else {
                    [_objectUnderCursor, _newSupply] call ace_rearm_fnc_makeSource;
                };
            }] remoteExec ["call", 2];

            [localize "STR_SAA_GENERAL_SUCCESS", 
            [
                localize "STR_SAA_ZEUS_MODULES_REARM_SET_OBJECT_REARM_ZEUSMESSAGE_SUCCESS",
                localize "STR_SAA_ZEUS_MODULES_REARM_SET_OBJECT_REARM_SUPPLIES_ZEUSMESSAGE_SUCCESS"
            ] select _isSupply, 3] call BIS_fnc_curatorHint;
		},
		{},
		[_objectUnderCursor, _currentSupply, _isSupply]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;