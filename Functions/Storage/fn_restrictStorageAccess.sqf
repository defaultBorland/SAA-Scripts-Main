//
params ["_target", "_isRestricted", "_showInfo"];

if (_target isEqualType []) then {
	{
		_x setVariable ["SAA_storageRestricted", _isRestricted , true];
	} forEach _target;
} else {
	_target setVariable ["SAA_storageRestricted", _isRestricted , true];
};

if (_showInfo) then {
	[
		[_target, _isRestricted],
		{
			params ["_target", "_isRestricted"];
			systemChat format ["%1 %2", [name _target, localize "STR_SAA_GENERAL_EACH" + " " + toLower localize "STR_SAA_GENERAL_PLAYER"] select (_target isEqualType []), [localize "STR_SAA_ZEUS_MODULES_STORAGE_RESTRICT_STORAGE_ACCESS_ZEUSMESSAGE_GRANTED", localize "STR_SAA_ZEUS_MODULES_STORAGE_RESTRICT_STORAGE_ACCESS_ZEUSMESSAGE_RESTRICTED"] select _isRestricted];
		}
	] remoteExec ["call", -2];
};