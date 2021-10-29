//
params ["_vehicle", "_side", "_showNotification"];

[[_vehicle, _side], {(_this # 0) setVariable ["tf_side", toLower str (_this # 1), false]}] remoteExec ["call"];

if (_showNotification) then {
	private _sidesColors = [[west, "#004D99"], [east, "#800000"], [independent, "#008000"], [civilian, "#660080"]];
	private _color = (_sidesColors select {(_x # 0) isEqualTo _side}) # 0 # 1;

	[[_vehicle, _color],
	{
		params ["_vehicle", "_color"];
		hint parseText format ["<t align='center'>%1</t><t align='center'><img size='4' color='%4' image='%2'/></t><br/><br/><t align='center' shadow='1' shadowColor='#000000'>%3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>", localize "STR_SAA_ZEUS_MODULES_RADIO_REPLACE_VEHICLE_RADIO_ZEUSMESSAGE_SUCCESS", getText(configfile >> "CfgVehicles" >> typeOf _vehicle >> "picture"), getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName"), _color];
	}] remoteExec ["call", -2];
};