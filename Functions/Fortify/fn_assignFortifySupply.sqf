//
params ["_object", "_side", "_budget", "_toolsNumber"];

_object addItemCargoGlobal ["ACE_Fortify", _toolsNumber];

_side = [_side] call ace_fortify_fnc_parseSide;
private _jipID = [[_object, _side, _budget], {
	params ["_object", "_side", "_budget"];

	private _action = ["SAA_fotify_supply", localize "STR_SAA_TAKE_FORTIFY_SUPPLY_ACTION_NAME", "",
		{	// Statement
			params ["_target", "_player", "_actionParams"];
			_actionParams params ["_side", "_budget"];
			
			_target setVariable ["SAA_fortify_supplyTaken", true, true];
			[_side, _budget, true] call ace_fortify_fnc_updateBudget;

			private _jipID = _target getVariable ["SAA_fortify_suplyJIP", ""];
			remoteExec ["", _jipID];
		},	
		{	// Condition
			params ["_target", "_player", "_actionParams"];
			_actionParams params ["_side", "_budget"];

			(side _player) isEqualTo _side &&
			{!(_target getVariable ["SAA_fortify_supplyTaken", false])}
		},
		{},
		[_side, _budget] // args
	] call ace_interact_menu_fnc_createAction;
	[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

}] remoteExec ["call", -2, true];

_object setVariable ["SAA_fortify_suply", true, true];
_object setVariable ["SAA_fortify_suplyJIP", _jipID, true];
_object addEventHandler ["Deleted", {
	params ["_object"];

	private _jipID = _object getVariable ["SAA_fortify_suplyJIP", ""];
	remoteExec ["", _jipID];
}];