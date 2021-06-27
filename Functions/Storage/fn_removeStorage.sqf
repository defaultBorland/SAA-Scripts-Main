params ["_object", "_showInfo"];

_object setVariable ["SAA_isStorageProxy", nil, true];
_playersIDs = ["All", "ID"] call Shadec_fnc_usersIDs;
{
	[[_object], {
		[_this # 0] call Shadec_fnc_removeActionFromStorage;
	}] remoteExec ["call", _x];
} forEach _playersIDs;

_object enableSimulationGlobal true;
_object lock false;

_storages = missionNamespace getVariable ["storagesProxys", []]; _storages = _storages - [_object];
missionNamespace setVariable ["storagesProxys",_storages, true];

if (_showInfo) then {
	[[_object],
	{
		params ["_storageProxy"];
		hint parseText format ["<t align='center' color='#ff0000'>%1</t><t align='center'><img size='4' image='%2'/></t><br/><br/><t align='center' shadow='1' shadowColor='#000000'>%3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Direction: %4</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Distance: %5</t>", localize "SAA_ZEUS_MODULES_MAIN_ASSIGNSTORAGE_ZEUSMESSAGE_SUCCESS", getText(configfile >> "CfgVehicles" >> typeOf _storageProxy >> "picture"), getText (configFile >> "CfgVehicles" >> typeOf _storageProxy >> "displayName"), floor ([player, _storageProxy] call BIS_fnc_dirTo), round (player distance _storageProxy)];
	}] remoteExec ["call", -2];
};

["> Server: Storage was removed."] remoteExec ["systemChat"];