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
		hint parseText format ["<t align='center'>%1</t><t align='center'><img size='4' image='%2'/></t><br/><br/><t align='center' shadow='1' shadowColor='#000000'>%3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%4: %5</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%6: %7</t>", localize "STR_SAA_ZEUS_MODULES_STORAGE_REMOVE_STORAGE_ZEUSMESSAGE_SUCCESS", getText(configfile >> "CfgVehicles" >> typeOf _storageProxy >> "picture"), getText (configFile >> "CfgVehicles" >> typeOf _storageProxy >> "displayName"), localize "STR_SAA_GENERAL_DIRECTION", floor (player getDir _storageProxy), localize "STR_SAA_GENERAL_DISTANCE", round (player distance _storageProxy)];

		systemChat format ["> Server: %1.", localize "STR_SAA_ZEUS_MODULES_STORAGE_REMOVE_STORAGE_ZEUSMESSAGE_SUCCESS"];
	}] remoteExec ["call", -2];
};