//
_insertChildren = {
    params ["_target", "_player", "_actionParams"];

	// Compose list of players
	_players = ["OnlySquadMembers", _player] call Shadec_fnc_getPlayersNames;

    // Add children to this action
    private _actions = [];
    {
        private _childStatement = {
			params ["_target", "_player", "_actionParams"];
			_actionParams params ["_commander", "_slave"];

			[[_slave, _commander], {systemChat format ["> Server: %1 %2 %3.", name (_this # 0), localize "SAA_FORCEREMOVEFROMSQUAD_CHATINFO", name (_this # 1)]}] remoteExec ["call", -2];
			[_slave] joinSilent grpNull;
			
		};
        private _action = [format ["joinPlayer:%1", _x # 1], _x # 1, "", _childStatement, {true}, {}, [_player, _x # 0]] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
    } forEach (_players);

    _actions
};

//
_action = ["forceJoinToSquad", localize "SAA_FORCEREMOVEFROMSQUAD_ACTIONNAME", "img\SAA_logo_256.paa",
	{
		params ["_target", "_player", "_actionParams"];
		[["All", "Groups", true], Shadec_fnc_playersList] remoteExec ["call", 2];
	},	// Statement
	{(player isEqualTo (leader group player)) and {(player getVariable ["SAA_Rank", "PV1"]) in ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT","SPC"]}},	// Condition
	_insertChildren,
	[],
	"",
	4,
	[false, false, false, true, false], 
	{}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_TeamManagement"], _action] call ace_interact_menu_fnc_addActionToObject;