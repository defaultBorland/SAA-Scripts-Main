// Server-side exec only
if (!isDedicated) exitWith {diag_log "fnc_addShadecArsenal | Server only function"};

params ["_box", "_uniformCamo", "_clearInventory", "_showInfo"];

[_box] call Shadec_fnc_removeShadecArsenal;

[_box, true] call ace_dragging_fnc_setDraggable;
[_box, true] call ace_dragging_fnc_setCarryable;

if (_clearInventory) then {
	clearWeaponCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearBackpackCargoGlobal _box;
};

private _camo = [_uniformCamo, "None"] select (_uniformCamo isEqualTo "All");
private _uniform = [_camo, "All"] call Shadec_db_server_fnc_getUniform;
_uniform = _uniform apply {_x # 0};
private _items = ["TFAR_anprc152", "ItemMap"];

[_box, _uniform + _items, true] call ace_arsenal_fnc_initBox;
private _jipID = [[_box, _camo], {_this call Shadec_fnc_addArsenalSpecificItems}] remoteExec ["spawn", -2, true];

_box setVariable ["SAA_isArsenal", true, true];
_box setVariable ["SAA_arsenalJIP", _jipID, true];

_box addEventHandler ["Deleted", {
	params ["_box"];

	private _jipID = _box getVariable ["SAA_arsenalJIP", ""];
	remoteExec ["", _jipID];
}];

if (_showInfo) then {
	[[_box, _uniformCamo], {
		_this params ["_arsenal", "_uniformCamo"];

		hint parseText format ["<t align='center'>%1</t><br/><t align='center' shadow='1' shadowColor='#000000'>%2</t><br/><t align='center'><t align='center' shadow='1' shadowColor='#000000'>%3: %4</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%5 from you: %6</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>%7: %8</t>", localize "STR_SAA_ZEUS_MODULES_ARSENAL_ADD_ARSENAL_ZEUSMESSAGE_SUCCESS", getText (configFile >> "CfgVehicles" >> typeOf _arsenal >> "displayName"), localize "STR_SAA_ZEUS_MODULES_ARSENAL_ADD_ARSENAL_DIALOG_UNIFORM_CAMO_DISPLAYNAME", localize ("STR_SAA_ZEUS_MODULES_ARSENAL_ADD_ARSENAL_UNIFORM_CAMO_" + toUpper _uniformCamo), localize "STR_SAA_GENERAL_DIRECTION", floor (player getDir _arsenal), localize "STR_SAA_GENERAL_DISTANCE", round (player distance _arsenal)];
		
		systemChat format ["> Server: %1.", localize "STR_SAA_ZEUS_MODULES_ARSENAL_ADD_ARSENAL_ZEUSMESSAGE_SUCCESS"];
	}] remoteExec ["call", -2];
};