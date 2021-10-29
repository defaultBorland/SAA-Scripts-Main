params ["_side", "_value", "_showToAll"];

// Change respawn tickets value
[_side, round _value] call BIS_fnc_respawnTickets;

private _targets = [_side, -2] select _showToAll;

// Message + hint for everyone
[[_side, _value], {
	params ["_side", "_value"];
	systemChat format ["> Server: [%1] %2 %3 %4. %5: %6.", toUpper localize format["SAA_GENERAL_%1", _this # 0], localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_ZEUSMESSAGE_SUCCESS", toLower localize "STR_SAA_GENERAL_BY", round _value, localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_MESSAGE_UPDATEDVALUE", [_side, 0] call BIS_fnc_respawnTickets];
	[[player, _side], Shadec_fnc_showTickets] remoteExec ["call", 2];
}] remoteExec ["call", _targets];

//return
true