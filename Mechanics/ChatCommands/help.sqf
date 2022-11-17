// Help
["help", {

	if !((player getVariable ["SAA_Rank", "PV1"]) in ["CPT","1LT","2LT","CWO","WO1","SMC","MSG","SSG","SGT"]) exitWith {
		systemChat localize "STR_SAA_CHAT_COMMANDS_HELP_NO_AVAILABLE_COMMANDS";
	};

	systemChat localize "STR_SAA_CHAT_COMMANDS_HELP_AVAILABLE_COMMANDS";
	systemChat format [" #comrand <%1> - %2", toUpper localize "STR_SAA_GENERAL_NUMBER", toLower localize "STR_SAA_CHAT_COMMANDS_RANDOM_COMMANDERS_DESCRIPTION"];
}, "all"] call CBA_fnc_registerChatCommand;