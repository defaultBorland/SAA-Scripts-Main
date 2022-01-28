//
params ["_target", "_isRestricted", "_showInfo"];

if (_target isEqualType []) then {
	{
		_x setVariable ["SAA_storageRestricted", _isRestricted , true];
	} forEach _target;
	_target = localize "STR_SAA_GENERAL_EACH" + " " + toLower localize "STR_SAA_GENERAL_PLAYER";
} else {
	_target setVariable ["SAA_storageRestricted", _isRestricted , true];
	_target = name _target;
};

if (_showInfo) then {
	[
		[_target, _isRestricted],
		{
			params ["_target", "_isRestricted"];
			systemChat format ["> Server: %1 %2", _target, [localize "STR_SAA_ZEUS_MODULES_STORAGE_RESTRICT_STORAGE_ACCESS_ZEUSMESSAGE_GRANTED", localize "STR_SAA_ZEUS_MODULES_STORAGE_RESTRICT_STORAGE_ACCESS_ZEUSMESSAGE_RESTRICTED"] select _isRestricted];
		}
	] remoteExec ["call", -2];
};