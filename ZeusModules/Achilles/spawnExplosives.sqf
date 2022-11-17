
Achilles_fnc_higherConfigHierarchyLevel = {
	private _input_config = _this;
	private _hierarchy = configHierarchy _input_config;
	_hierarchy select ((count _hierarchy) - 2)
};

Achilles_fnc_ClassNamesWhichInheritsFromCfgClass = {
	private _parent_cfg_class = _this;
	private _condition = format["configName _x isKindOf ""%1""",configName _parent_cfg_class];
	private _higherHierarchyLevel = _parent_cfg_class call Achilles_fnc_higherConfigHierarchyLevel;
	((_condition configClasses _higherHierarchyLevel) apply {configName _x}) - [configName _parent_cfg_class]
};

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_ACHILLES", "spawnExplosive",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	
	private _explosive_types = (configfile >> "CfgVehicles" >> "ModuleMine_F") call Achilles_fnc_ClassNamesWhichInheritsFromCfgClass;
	_explosive_types = _explosive_types - ["ModuleExplosive_F"];

	["Spawn Explosive",
		[
			["COMBO", [localize "STR_SAA_GENERAL_TYPE", localize ""],
				[
					_explosive_types,
					_explosive_types apply {getText (configfile >> "CfgVehicles" >> _x >> "displayName")},
					0
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_explosive_type"];
			_args params ["_position", "_selectedObject"];

			private _mine = _explosive_type createVehicle _position;
			_mine setDir (random 360);
			_mine setPos _position;
			// [[_mine], true] call Ares_fnc_AddUnitsToCurator;
			
			[localize "STR_SAA_GENERAL_SUCCESS", localize "", 3] call BIS_fnc_curatorHint;
		},
		{},
		[_position, _objectUnderCursor]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;


