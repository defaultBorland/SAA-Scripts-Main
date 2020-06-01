// Function to Ace Arsenal Handler
//  

fnc_FormatCargo = {
	params ["_containerType"];
	_containerType = _this # 0;
	_cargo = [];
	switch (_containerType) do {
		case "Uniform": {
			_weapons = ["Weapons", getWeaponCargo uniformContainer player] call Shadec_fnc_getCargoCompat;
			_magazines = ["Magazines", magazinesAmmoCargo uniformContainer player] call Shadec_fnc_getCargoCompat;
			_items = ["Items", getItemCargo uniformContainer player] call Shadec_fnc_getCargoCompat;
			_cargo = [_weapons,_magazines,_items];
		};
		case "Vest": {
			_weapons = ["Weapons", getWeaponCargo vestContainer player] call Shadec_fnc_getCargoCompat;
			_magazines = ["Magazines", magazinesAmmoCargo vestContainer player] call Shadec_fnc_getCargoCompat;
			_items = ["Items", getItemCargo vestContainer player] call Shadec_fnc_getCargoCompat;
			_cargo = [_weapons,_magazines,_items];
		};
		case "Backpack": {
			_weapons = ["Weapons", getWeaponCargo backpackContainer player] call Shadec_fnc_getCargoCompat;
			_magazines = ["Magazines", magazinesAmmoCargo backpackContainer player] call Shadec_fnc_getCargoCompat;
			_items = ["Items", getItemCargo backpackContainer player] call Shadec_fnc_getCargoCompat;
			_cargo = [_weapons,_magazines,_items];
		};
		default {diag_log format ["Invalid containerType param"]};
	};
	_cargo
};

fnc_FormatWeapon = {
	params ["_weaponType"];
	_weaponType = _this # 0;
	_weaponArray = [];
	switch (_weaponType) do {
		case "Primary": {
			_weaponArray = [primaryWeapon player, primaryWeaponItems player, primaryWeaponMagazine player];
		};
		case "Secondary": {
			_weaponArray = [secondaryWeapon player, secondaryWeaponItems player, secondaryWeaponMagazine player];
		};
		case "Handgun": {
			_weaponArray = [handgunWeapon player, handgunItems player, handgunMagazine player];
		};
		default {diag_log format ["Invalid weaponType param"]};
 	};
	_weaponArray
};

// Rewrite?
fnc_FormatAssigned = {
	params ["_assignedArray"];
	private ["_map", "_compass", "_watch", "_radio", "_gps", "_nvg", "_bino"];
	_map = ""; _compass = ""; _watch = ""; _radio = ""; _gps = ""; _nvg = ""; _bino = "";
	if (_assignedArray isEqualTo []) exitWith {[_map, _compass, _watch, _radio, _gps, _nvg]};
	{
		_type = _x call BIS_fnc_itemType;
		switch (_type # 1) do {
			case "Map": {_map = _x};
			case "Compass": {_compass = _x};
			case "Watch": {_watch = _x};
			case "Radio": {_radio = _x};
			case "GPS": {_gps = _x};
			case "NVGoggles": {_nvg = _x};
			case "Binocular": {_bino = _x};
			default {};
		};
	} forEach _assignedArray;

	//return
	[_map, _compass, _watch, _radio, _gps, _nvg]
};

fnc_compareArrays = {
	params ["_array1", "_array2"];
	_array1w = [] + (_array1 # 0);
	_array1m = [] + (_array1 # 1);
	_array1i = [] + (_array1 # 2);

	_array2w = [] + (_array2 # 0);
	_array2m = [] + (_array2 # 1);
	_array2i = [] + (_array2 # 2);

	_arrayUw = _array1w arrayIntersect _array2w;
	_arrayUm = _array1m arrayIntersect _array2m;
	_arrayUi = _array1i arrayIntersect _array2i;

	_array1w = _array1w - _arrayUw;
	_array2w = _array2w - _arrayUw;

	if !(_array1w isEqualTo _array2w) exitWith {false};

	_array1m = _array1m - _arrayUm;
	_array2m = _array2m - _arrayUm;

	if !(_array1m isEqualTo _array2m) exitWith {false};

	_array1i = _array1i - _arrayUi;
	_array2i = _array2i - _arrayUi;

	if !(_array1i isEqualTo _array2i) exitWith {false};

	true;
};

params ["_action"];
switch (_action) do {
	case "save": {
		player setVariable ["arsenalLoadout",[
			["Uniform"] call fnc_FormatCargo,
			["Vest"] call fnc_FormatCargo,
			["Backpack"] call fnc_FormatCargo,
			["Primary"] call fnc_FormatWeapon,
			["Secondary"] call fnc_FormatWeapon,
			["Handgun"] call fnc_FormatWeapon,
			[assignedItems player] call fnc_FormatAssigned,
			binocular player,
			[uniform player, vest player, backpack player]
		]];
	};
	case "load": {
		_savedLoadout = player getVariable "arsenalLoadout";
		_savedUniformCargo = _savedLoadout # 0;		//diag_log format ["_savedUniformCargo: %1", _savedUniformCargo];
		_savedVestCargo = _savedLoadout # 1;		//diag_log format ["_savedVestCargo: %1", _savedVestCargo];
		_savedBackpackCargo = _savedLoadout # 2; 	//diag_log format ["_savedBackpackCargo: %1", _savedBackpackCargo];
		_savedPrimaryWeapon = _savedLoadout # 3; 	//diag_log format ["_savedPrimaryWeapon: %1", _savedPrimaryWeapon];
		_savedSecondaryWeapon = _savedLoadout # 4;	//diag_log format ["_savedSecondaryWeapon: %1", _savedSecondaryWeapon]; 
		_savedHandgunWeapon = _savedLoadout # 5;	//diag_log format ["_savedHandgunWeapon: %1", _savedHandgunWeapon]; 
		_savedAssigned = _savedLoadout # 6;			//diag_log format ["_savedAssigned: %1", _savedAssigned];
		_savedBino = _savedLoadout # 7;				//diag_log format ["_savedBino: %1", _savedBino];
		_savedForm = _savedLoadout # 8;				//diag_log format ["_savedForm: %1", _savedForm];
		player setVariable ["arsenalLoadout", nil];
		
		_newUniformCargo = ["Uniform"] call fnc_FormatCargo;			//diag_log format ["_newUniformCargo: %1", _newUniformCargo];
		_newVestCargo = ["Vest"] call fnc_FormatCargo;					//diag_log format ["_newVestCargo: %1", _newVestCargo];
		_newBackpackCargo = ["Backpack"] call fnc_FormatCargo;			//diag_log format ["_newBackpackCargo: %1", _newBackpackCargo];
		_newPrimaryWeapon = ["Primary"] call fnc_FormatWeapon;			//diag_log format ["_newPrimaryWeapon: %1", _newPrimaryWeapon];
		_newSecondaryWeapon = ["Secondary"] call fnc_FormatWeapon;		//diag_log format ["_newSecondaryWeapon: %1", _newSecondaryWeapon];
		_newHandgunWeapon = ["Handgun"] call fnc_FormatWeapon;			//diag_log format ["_newHandgunWeapon: %1", _newHandgunWeapon];
		_newAssigned = [assignedItems player] call fnc_FormatAssigned;	//diag_log format ["_newAssigned: %1", _newAssigned];
		_newBino = binocular player;									//diag_log format ["_newBino: %1", _newBino];

		_changesArray = [0,0,0,0,0,0,0,0];
		if !([_savedUniformCargo, _newUniformCargo] call fnc_compareArrays) then {_changesArray set [0,1]};
		if !([_savedVestCargo, _newVestCargo] call fnc_compareArrays) then {_changesArray set [1,1]};
		if !([_savedBackpackCargo, _newBackpackCargo] call fnc_compareArrays) then {_changesArray set [2,1]};
		if !(_savedPrimaryWeapon isEqualTo _newPrimaryWeapon) then {_changesArray set [3,1]};
		if !(_savedSecondaryWeapon isEqualTo _newSecondaryWeapon) then {_changesArray set [4,1]};
		if !(_savedHandgunWeapon isEqualTo _newHandgunWeapon) then {_changesArray set [5,1]};
		if !(_savedAssigned isEqualTo _newAssigned) then {_changesArray set [6,1]};
		if !(_savedBino isEqualTo _newBino) then {_changesArray set [7,1]};

		_text = ""; 
		_changes = _changesArray find 1;
		while {_changes > -1} do {
			switch (_changes) do {
				case 0: { //Uniform
					removeUniform player;
					player forceAddUniform (_savedForm # 0);
					{(uniformContainer player) addWeaponCargoGlobal _x} forEach (_savedUniformCargo # 0);
					{(uniformContainer player) addMagazineAmmoCargo _x} forEach (_savedUniformCargo # 1);
					{(uniformContainer player) addItemCargoGlobal _x} forEach (_savedUniformCargo # 2);
					_text = _text + "Содержимое униформы было изменено или не поместилось в новый вид обмундирования.\n"
				};
				case 1: { //Vest
					removeVest player;
					player addVest (_savedForm # 1);
					{(VestContainer player) addWeaponCargoGlobal _x} forEach (_savedVestCargo # 0);
					{(VestContainer player) addMagazineAmmoCargo _x} forEach (_savedVestCargo # 1);
					{(VestContainer player) addItemCargoGlobal _x} forEach (_savedVestCargo # 2);
					_text = _text + "Содержимое разгрузки было изменено или не поместилось в новый вид обмундирования.\n"
				};
				case 2: { //Backpack
					removeBackpack player;
					player addBackpack (_savedForm # 2);
					{(backpackContainer player) addWeaponCargoGlobal _x} forEach (_savedBackpackCargo # 0);
					{(backpackContainer player) addMagazineAmmoCargo _x} forEach (_savedBackpackCargo # 1);
					{(backpackContainer player) addItemCargoGlobal _x} forEach (_savedBackpackCargo # 2);
					_text = _text + "Содержимое рюкзака было изменено или не поместилось в новый вид обмундирования.\n"
				};
				case 3: { //Primary Weapon
					player removeWeapon (primaryWeapon player);
					player addWeapon _savedPrimaryWeapon # 0;
					{player addPrimaryWeaponItem _x} forEach _savedPrimaryWeapon # 1;
					_text = _text + "Основное оружие/Модули/Амуниция были изменены.\n"	
				};
				case 4: { //Secondary Weapon
					player removeWeapon (secondaryWeapon player);
					player addWeapon _savedSecondaryWeapon # 0;
					{player addSecondaryWeaponItem _x} forEach _savedSecondaryWeapon # 1;
					_text = _text + "Дополнительное оружие/Модули/Амуниция были изменены.\n"
				};
				case 5: { //Handgun weapon
					player removeWeapon (handgunWeapon player);
					player addWeapon _savedHandgunWeapon # 0;
					{player addHandgunItem _x} forEach _savedHandgunWeapon # 1;
					_text = _text + "Вторичное оружие/Модули/Амуниция были изменены.\n"
				};
				case 6: { //Assigned Items
					if ((_newAssigned # 3) != "") then {_savedAssigned set [3, _newAssigned # 3]};
					{
						if !((_savedAssigned # _forEachIndex) isEqualTo _x) then {
							player unlinkItem _x;
							player linkItem (_savedAssigned # _forEachIndex);
						}
					} forEach _newAssigned;
					//_text = _text + "Личные предметы были изменены.\n"
				};
				case 7: { //Binocular
					player removeWeapon _newBino;
					if (_savedBino != "") then {player addWeapon _savedBino};
					_text = _text + "Бинокль был изменен.\n"
				};
			};
			_changesArray set [_changes, 0];
			_changes = _changesArray find 1;
		};
		if (_text != "") then {
			_text = _text + "Указанные типы снаряжения были возвращены к изначальному состоянию.";
			hint format [_text];
		};
	};
	default {
		[format["Invalid action. Player: %1", player]] remoteExec ["diag_log",2];
	};
};