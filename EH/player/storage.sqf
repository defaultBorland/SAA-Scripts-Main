// Private Storage Handlers 

// Restrict player access to other storages
_EH_StorageOpened = player addEventHandler ["InventoryOpened", {
	params ["_unit", "_container"];

    // If not storage - exit
    if !(_container getVariable ["SAA_isPersonalStorage", false]) exitWith {};

    // Close inventory if player is not owner 
    if !((_container getVariable ["SAA_storageOwner", "00000000000000000"]) isEqualTo (getPlayerUID player)) then {
        cutText [localize "STR_SAA_STORAGE_ACCESS_STRANGER", "PLAIN", 2];
        closeDialog 602; true
    };

    // Check if player was storage-restricted
    if (player getVariable ["SAA_storageRestricted", false]) then {
        cutText [localize "STR_SAA_STORAGE_ACCESS_RESTRICTED", "PLAIN", 2];
        closeDialog 602; true
    };
}];

// Detach attachments from weapons if it Replaced in Inventory
// Save Storage and Inventory on exit
_EH_StorageClosed = player addEventHandler ["InventoryClosed", {
	params ["_unit", "_container"];

    // Save inventory
    [player, getPlayerUID player] spawn Shadec_fnc_saveInventory;

    // If not storage - exit
    if !(_container getVariable ["SAA_isPersonalStorage", false]) exitWith {};

    // Check if player is owner 
    if ((_container getVariable ["SAA_storageOwner", "00000000000000000"]) isEqualTo (getPlayerUID player)) then {
        _container setPos [0,0,0];

        [[_container], {
			(_this # 0) lockInventory false;
		}] remoteExec ["call", -2, format["SAA_isStorageLocked_%1", _container getVariable "SAA_storageOwner"]];

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
    };
}];

// Detaching attachments from weapons and unloading equipments content
// when putting in storage
_EH_StoragePut = player addEventHandler ["Put", {
    params ["_unit", "_container", "_item"];

    // If not storage - exit
    if !(_container getVariable ["SAA_isPersonalStorage", false]) exitWith {};

    // Check if player is owner
    if ((_container getVariable ["SAA_storageOwner", "00000000000000000"]) isEqualTo (getPlayerUID player)) then {
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

    // If not storage - exit
    if !(_container getVariable ["SAA_isPersonalStorage", false]) exitWith {};

    // Check if player is owner
    if ((_container getVariable ["SAA_storageOwner", "00000000000000000"]) isEqualTo (getPlayerUID player)) then {
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