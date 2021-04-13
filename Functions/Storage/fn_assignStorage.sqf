params ["_object", "_showInfo"];

if (_object getVariable ["SAA_isStorageProxy", false]) exitWith {diag_log format ["fnc_assignStorage | Error: Passed object is already Storage Proxy"]};

_storages = missionNamespace getVariable ["storagesProxys", []]; _storages pushBack _object;
missionNamespace setVariable ["storagesProxys", _storages, true];

[_object] call Shadec_fnc_initStorage;

_playersIDs = ["All", "ID"] call Shadec_fnc_usersIDs;
{
	[[_object], {
		[_this # 0] call Shadec_fnc_addActionToStorage;
	}] remoteExec ["spawn", _x];
} forEach _playersIDs;

if (_showInfo) then {
	[[_object],
	{
		params ["_storageProxy"];
		hint parseText format ["<t align='center'>%1</t><t align='center'><img size='4' image='%2'/></t><br/><br/><t align='center' shadow='1' shadowColor='#000000'>%3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Direction: %4</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Distance: %5</t>", localize "SAA_ZEUS_MODULES_MAIN_ASSIGNSTORAGE_ZEUSMESSAGE_SUCCESS", getText(configfile >> "CfgVehicles" >> typeOf _storageProxy >> "picture"), getText (configFile >> "CfgVehicles" >> typeOf _storageProxy >> "displayName"), floor ([player, _storageProxy] call BIS_fnc_dirTo), round (player distance _storageProxy)];
	}] remoteExec ["call", -2];
};

["> Server: Storage was assigned."] remoteExec ["systemChat"];