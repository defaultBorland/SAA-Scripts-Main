


// Private Storage Handlers 

// Restrict player access to other storages
_EH_StorageOpened = player addEventHandler ["InventoryOpened", {
	params ["_unit", "_container"];
    if !((_container getVariable "storageName") isEqualTo format["%1_%2", "pStorage", getPlayerUID player]) then {
        hint format ["That's storage not belongs to You"];
        closeDialog 602; true;
    };
}];

// Detach attachments from weapons if it Replaced in Inventory
// Save Storage and Inventory on exit
_EH_StorageClosed = player addEventHandler ["InventoryClosed", {
	params ["_unit", "_container"];
    _unit = _this select 0;
    _container = _this select 1;

    if ((_container getVariable "storageName") isEqualTo format["%1_%2", "pStorage", getPlayerUID player]) then {
        _container setPos [0,0,0];
        _take = _container getVariable ["Take", false];
        if (_take) then {
            private _weapons = [];
            _weapons append weaponCargo _container;

            {
                [_container, _x, 1, true] call CBA_fnc_removeWeaponCargo;
                [_container, [_x] call BIS_fnc_baseWeapon, 1, true] call CBA_fnc_addWeaponCargo;
                _itemBaseAccs = [[_x] call BIS_fnc_baseWeapon] call CBA_fnc_weaponComponents;
                _itemBaseAccs deleteAt 0;
                {[_container, _x] call CBA_fnc_removeItemCargo} forEach _itemBaseAccs;
            } forEach _weapons;

            _container setVariable ["Take", false];
        };
        [getPlayerUID player] spawn Shadec_fnc_saveStorage;
        [player, getPlayerUID player, name player] spawn Shadec_fnc_saveInventory;
    };
}];

// Detaching attachments from weapons and unloading equipments content
// when putting in storage
_EH_StoragePut = player addEventHandler ["Put", {
    params ["_unit", "_container", "_item"];
    _container = _this select 1;
    _item = _this select 2;

    if ((_container getVariable "storageName") isEqualTo format["%1_%2", "pStorage", getPlayerUID player]) then {
        if ([_item] call BIS_fnc_itemType select 0 isEqualTo "Weapon") then {
            [_container, _item, 1, true] call CBA_fnc_removeWeaponCargo;
            [_container, [_item] call BIS_fnc_baseWeapon, 1, true] call CBA_fnc_addWeaponCargo;
            _itemBaseAccs = [[_item] call BIS_fnc_baseWeapon] call CBA_fnc_weaponComponents;
            _itemBaseAccs deleteAt 0;
            {[_container, _x] call CBA_fnc_removeItemCargo} forEach _itemBaseAccs;
        } else {
            switch ([_item] call BIS_fnc_itemType select 1) do {
                case "Radio";
                case "Uniform";
                case "Vest": {
                    [_container, _item, 1, true] call CBA_fnc_removeItemCargo;
                };
                case "Backpack": {
                    [_container, _item, 1, true] call CBA_fnc_removeBackpackCargo;
                };
            };
        };
    };
}];

// Flag if weapon/equipment in inventory were replaced from storage
_EH_StorageTake = player addEventHandler ["Take", {
    params ["_unit", "_container", "_item"];
    _container = _this select 1;
    _item = _this select 2;
    if ((_container getVariable "storageName") isEqualTo format["%1_%2", "pStorage", getPlayerUID player]) then {
        if ([_item] call BIS_fnc_itemType select 0 isEqualTo "Weapon") then {
            _container setVariable ["Take", true];
        } else {
            {
                switch ([_x select 0] call BIS_fnc_itemType select 1) do {
                    case "Uniform";
                    case "Vest": {
                        [_container, _x select 0, 1, true] call CBA_fnc_removeItemCargo;
                    };
                    case "Backpack": {
                        [_container, _x select 0, 1, true] call CBA_fnc_removeBackpackCargo;
                    };
                };
            } forEach everyContainer _container;
        };
    };
}];