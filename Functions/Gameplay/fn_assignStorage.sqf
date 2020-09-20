params ["_object", "_additionalInfo"];

_objectStorage = missionNamespace getVariable "objectStorage";
if !(isNil {_objectStorage}) then {
	[_objectStorage] call Shadec_fnc_removeStorage;
};

[_object] call Shadec_fnc_initStorage;

_playersIDs = ["All", "All"] call Shadec_fnc_usersIDs;
{[[_x # 2], Shadec_fnc_loadStorage] remoteExec ["spawn", _x # 0]} forEach _playersIDs;

if (_additionalInfo isEqualTo 1) then {
	{hint parseText format ["<t align='center'>Storage was assigned</t><t align='center'><img size='4' image='%1'/></t><br/><br/><t align='center' shadow='1' shadowColor='#000000'>%2</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Direction: %3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Distance: %4</t>", getText(configfile >> "CfgVehicles" >> typeOf (missionNamespace getVariable "objectStorage") >> "picture"), getText (configFile >> "CfgVehicles" >> typeOf (missionNamespace getVariable "objectStorage") >> "displayName"), floor ([player, missionNamespace getVariable "objectStorage"] call BIS_fnc_dirTo), round (player distance (missionNamespace getVariable "objectStorage"))]} remoteExec ["call"];
};

["> Server: Storage was assigned."] remoteExec ["systemChat"];