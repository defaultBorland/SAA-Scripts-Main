params ["_object", "_showInfo"];

if (_object getVariable ["SAA_isStorageProxy", false]) exitWith {diag_log format ["fnc_assignStorage | Error: Passed object is already Storage Proxy"]};

_storages = missionNamespace getVariable ["storagesProxys", []]; 
_storages pushBack _object;
missionNamespace setVariable ["storagesProxys", _storages, true];

[_object] call Shadec_fnc_initStorage;

private _players = [] call Shadec_fnc_getPlayers;
{
	[[_object], {
		[_this # 0] call Shadec_fnc_addActionToStorage;
	}] remoteExec ["spawn", _x];
} forEach _players;

if (_showInfo) then {
	[[_object],
	{
		params ["_storageProxy"];
		hint parseText format ["<t align='center'>%1</t><t align='center'><img size='4' image='%2'/></t><br/><br/><t align='center' shadow='1' shadowColor='#000000'>%3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%4: %5</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%6: %7</t>", localize "STR_SAA_ZEUS_MODULES_STORAGE_ASSIGN_STORAGE_ZEUSMESSAGE_SUCCESS", getText(configfile >> "CfgVehicles" >> typeOf _storageProxy >> "picture"), getText (configFile >> "CfgVehicles" >> typeOf _storageProxy >> "displayName"), localize "STR_SAA_GENERAL_DIRECTION", floor (player getDir _storageProxy), localize "STR_SAA_GENERAL_DISTANCE", round (player distance _storageProxy)];

		systemChat format ["> Server: %1.", localize "STR_SAA_ZEUS_MODULES_STORAGE_ASSIGN_STORAGE_ZEUSMESSAGE_SUCCESS"];
	}] remoteExec ["call", -2];
};