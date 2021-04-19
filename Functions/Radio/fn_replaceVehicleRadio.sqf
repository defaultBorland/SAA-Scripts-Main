//
params ["_vehicle", "_side", "_showNotification"];

_vehicle setVariable ["tf_side", _side, true];

if (_showNotification) then {
	[[_vehicle],
	{
		params ["_vehicle"];
		hint parseText format ["<t align='center'>%1</t><t align='center'><img size='4' image='%2'/></t><br/><br/><t align='center' shadow='1' shadowColor='#000000'>%3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>", localize "SAA_ZEUS_MODULES_RADIO_REPLACEVEHICLERADIO_ZEUSMESSAGE_SUCCESS", getText(configfile >> "CfgVehicles" >> typeOf _vehicle >> "picture"), getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName")];
	}] remoteExec ["call", -2];
};