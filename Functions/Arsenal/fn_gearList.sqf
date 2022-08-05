fnc_formatAssigned = {
	private _assignedItems = assignedItems player;
	private _valuableAssignedItems = [];

	{
		private _type = _x call BIS_fnc_itemType;
		if ((_type # 1) in ["Compass", "Watch", "GPS", "UAVTerminal", "NVGoggles"]) then {_valuableAssignedItems pushBack _x};
	} forEach _assignedItems;

	_valuableAssignedItems
};

fnc_getAllGear = {
	private _uniformContainer = uniformContainer player;
	private _vestContainer = vestContainer player;
	private _backpackContainer = backpackContainer player;

	private _uniformMass = loadAbs _uniformContainer;
	private _vestMass = loadAbs _vestContainer;
	private _backpackMass = loadAbs _backpackContainer;

	private _uniformMaxLoad = maxLoad _uniformContainer;
	private _vestMaxLoad = maxLoad _vestContainer;
	private _backpackMaxLoad = maxLoad _backpackContainer;

	private _allGear = [
		[uniform player, vest player, backpack player],
		call fnc_formatWeapons,
		["uniform"] call fnc_formatCargo,
		["vest"] call fnc_formatCargo,
		["backpack"] call fnc_formatCargo,
		call fnc_formatAssigned,
		binocular player,
		[_uniformMass, _vestMass, _backpackMass],
		[_uniformMaxLoad, _vestMaxLoad, _backpackMaxLoad]
	];
	
	_allGear
};

fnc_formatWeapons = {
	private _weapons = [
		[primaryWeapon player, primaryWeaponItems player, primaryWeaponMagazine player],
		[secondaryWeapon player, secondaryWeaponItems player, secondaryWeaponMagazine player],
		[handgunWeapon player, handgunItems player, handgunMagazine player]
	];

	_weapons
};

fnc_formatCargo = {
	params ["_containerType"];
	private _cargo = [];
	private ["_weapons", "_magazines", "_items"];
	private _container = objNull;
	
	switch (toLower _containerType) do {
		case "uniform": {
			_container = uniformContainer player;
		};
		case "vest": {
			_container = vestContainer player;
		};
		case "backpack": {
			_container = backpackContainer player;
		};
	};

	_weapons = weaponsItemsCargo _container;
	_magazines = magazinesAmmoCargo _container;
	_items = itemCargo _container; _items sort true;
	_cargo = [_weapons, _magazines, _items];

	_cargo
};

fnc_getUnitContainer = {
	params ["_outfitType"];

	private _container = switch (toLower _outfitType) do {
		case "uniform": {uniformContainer player};
		case "vest": {vestContainer player};
		case "backpack": {backpackContainer player};
	};

	_container
};

fnc_restoreOutfitWithInventory = {
	params ["_outfit", "_outfitType", "_inventory"];

	private _container = objNull;
	switch (toLower _outfitType) do {
		case "uniform": {
			removeUniform player;
			player forceAddUniform _outfit;
			_container = uniformContainer player;
		};
		case "vest": {
			removeVest player;
			player addVest _outfit;
			_container = vestContainer player;
		};
		case "backpack": {
			removeBackpack player;
			player addBackpack _outfit;
			_container = backpackContainer player;
		};
	};

	[_outfitType, _inventory] call fnc_fillUnitContainer;
};

fnc_fillUnitContainer = {
	params ["_outfitType", "_inventory"];

	_inventory params ["_weapons", "_magazines", "_items"];
	private _container = [_outfitType] call fnc_getUnitContainer;

	[_container, true, true, true, false] call Shadec_fnc_clearContainerInventory;

	{_container addWeaponWithAttachmentsCargoGlobal [_x, 1]} forEach _weapons;
	{_container addMagazineAmmoCargo [_x # 0, 1, _x # 1]} forEach _magazines;
	{_container addItemCargoGlobal [_x, 1]} forEach _items;
};

params ["_action"];

switch (toLower _action) do {
	case "save": {
		player setVariable ["SAA_arsenal_gearList", call fnc_getAllGear];
	};
	case "load": {
		private _oldGear =  player getVariable ["SAA_arsenal_gearList", []];
		if (_oldGear isEqualTo []) exitWith {diag_log format ["fnc_gearList | Error: Empty array on load action"]};

		_oldGear params [
			"_oldOutfit",
			"_oldWeapons",
			"_oldUniformCargo",
			"_oldVestCargo",
			"_oldBackpackCargo",
			"_oldAssignedItems",
			"_oldBinocular",
			"_oldOutfitInventoriesMasses",
			"_oldOutfitMaxLoads"
		];

		private _newGear = call fnc_getAllGear;

		_newGear params [
			"_newOutfit",
			"_newWeapons",
			"_newUniformCargo",
			"_newVestCargo",
			"_newBackpackCargo",
			"_newAssignedItems",
			"_newBinocular",
			"_newOutfitInventoriesMasses",
			"_newOutfitMaxLoads"
		];

		private _changes = [];
		for "_i" from 1 to (count _newGear - 3) do {
			if ((_oldGear # _i) isNotEqualTo (_newGear # _i)) then {_changes pushBack _i};
		};

		if (_changes isEqualTo []) exitWith {true};
		private _texts = [];
		while {count _changes > 0} do {
			diag_log format ["fnc_gearList | _changes: %1", _changes];
			switch (_changes deleteAt 0) do {
				case 1: { // Weapons
					player removeWeapon (primaryWeapon player);
					player removeWeapon (secondaryWeapon player);
					player removeWeapon (handgunWeapon player);

					_oldWeapons params ["_primary", "_secondary", "_handgun"];
					
					_primary params ["_primaryWeapon", "_primaryAttachments", "_primaryMagazines"];
					player addWeapon _primaryWeapon; 
					{player addPrimaryWeaponItem _x} forEach _primaryAttachments;
					{player addPrimaryWeaponItem _x} forEach _primaryMagazines;

					_secondary params ["_secondaryWeapon", "_secondaryAttachments", "_secondaryMagazines"];
					player addWeapon _secondaryWeapon; 
					{player addSecondaryWeaponItem _x} forEach _secondaryAttachments;
					{player addSecondaryWeaponItem _x} forEach _secondaryMagazines;

					_handgun params ["_handgunWeapon", "_handgunAttachments", "_handgunMagazines"];
					player addWeapon _handgunWeapon;
					{player addHandgunItem _x} forEach _handgunAttachments;
					{player addHandgunItem _x} forEach _handgunMagazines;
				};
				case 2: { // Uniform Content
					_newOutfit params ["_newUniform", "_newVest", "_newBackpack"];
					_oldOutfitInventoriesMasses params ["_uniformInventoryMass", "_vestInventoryMass", "_backpackInventoryMass"];
					_newOutfitMaxLoads params ["_uniformMaxLoad", "_vestMaxLoad", "_backpackMaxLoad"];

					if (_newUniform isNotEqualTo "" && {_uniformMaxLoad >= _uniformInventoryMass}) then {
						["uniform", _oldUniformCargo] call fnc_fillUnitContainer;
					} else {
						_oldOutfit params ["_oldUniform", "_oldVest", "_oldBackpack"];
						[_oldUniform, "uniform", _oldUniformCargo] call fnc_restoreOutfitWithInventory;
						_texts pushBack localize "STR_SAA_ARSENAL_RESTORED_UNIFORM";
					};
				};
				case 3: { // Vest Content
					_newOutfit params ["_newUniform", "_newVest", "_newBackpack"];
					_oldOutfitInventoriesMasses params ["_uniformInventoryMass", "_vestInventoryMass", "_backpackInventoryMass"];
					_newOutfitMaxLoads params ["_uniformMaxLoad", "_vestMaxLoad", "_backpackMaxLoad"];

					if (_newVest isNotEqualTo "" && {_vestMaxLoad >= _vestInventoryMass}) then {
						["vest", _oldVestCargo] call fnc_fillUnitContainer;
					} else {
						_oldOutfit params ["_oldUniform", "_oldVest", "_oldBackpack"];
						[_oldVest, "vest", _oldVestCargo] call fnc_restoreOutfitWithInventory;
						_texts pushBack localize "STR_SAA_ARSENAL_RESTORED_VEST";
					};
				};
				case 4: { // Backpack content
					_newOutfit params ["_newUniform", "_newVest", "_newBackpack"];
					_oldOutfitInventoriesMasses params ["_uniformInventoryMass", "_vestInventoryMass", "_backpackInventoryMass"];
					_newOutfitMaxLoads params ["_uniformMaxLoad", "_vestMaxLoad", "_backpackMaxLoad"];

					if (_newBackpack isNotEqualTo "" && {_backpackMaxLoad >= _backpackInventoryMass}) then {
						["backpack", _oldBackpackCargo] call fnc_fillUnitContainer;
					} else {
						_oldOutfit params ["_oldUniform", "_oldVest", "_oldBackpack"];
						[_oldBackpack, "backpack", _oldBackpackCargo] call fnc_restoreOutfitWithInventory;
						_texts pushBack localize "STR_SAA_ARSENAL_RESTORED_BACKPACK";
					};
				};
				case 5: { // Assigned Items
					{
						player unlinkItem _x;
					} forEach _newAssignedItems;

					{
						player linkItem _x;
					} forEach _oldAssignedItems;
				};
				case 6: { // Binocular
					player removeWeapon _newBinocular;
					player addWeapon _oldBinocular;
				};
			};
		};

		if !(_texts isEqualTo []) then {
			private _hint = parseText format ["<br /><br />%1", localize "STR_SAA_ARSENAL_RESTORED_HINT"];
			private _txt = composeText [_texts deleteAt (count _texts - 1), _hint];
			_texts pushBack _txt;

			[{(localize "STR_SAA_ARSENAL_RESTORED_HEADER") hintC _this}, _texts, 0.5] call CBA_fnc_waitAndExecute;
		};
	};
};