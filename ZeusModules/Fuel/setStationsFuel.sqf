[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_FUEL", localize "STR_SAA_ZEUS_MODULES_FUEL_SET_STATIONS_FUEL_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	private _mapSize = worldSize;

	[localize "STR_SAA_ZEUS_MODULES_FUEL_SET_STATIONS_FUEL_DIALOG_HEADER",
		[
			["SLIDER", [localize "STR_SAA_ZEUS_MODULES_FUEL_SET_STATIONS_FUEL_DIALOG_VOLUME_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_FUEL_SET_STATIONS_FUEL_DIALOG_VOLUME_TOOLTIP"],
				[
					0, 10000, 10000, 0
				]
			],
			["SLIDER:RADIUS", [localize "STR_SAA_ZEUS_MODULES_FUEL_SET_STATIONS_FUEL_DIALOG_RADIUS_DISPLAYNAME", localize "STR_SAA_ZEUS_MODULES_FUEL_SET_STATIONS_FUEL_RADIUS_TOOLTIP"],
				[
					1, _mapSize, 30, 0, ASLToAGL _position, [1,0,0,1]
				]
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_fuel", "_radius"];
			_args params ["_position", "_mapSize"];

			if (_radius isEqualTo _mapSize) then {
				_position = [worldSize / 2, worldsize / 2];
				_radius = sqrt 2 / 2 * worldSize;
			} else {
				_position = _position select [0, 2];
			};
			
			[[_position, _radius, _fuel], Shadec_fnc_setStationsFuel] remoteExec ["spawn", 2];
		},
		{},
		[_position, _mapSize]
	] call zen_dialog_fnc_create;
}, "img\Actions\SAA_Logo.paa"] call zen_custom_modules_fnc_register;


// CHECK
// nearestTerrainObjects [player, ["FUELSTATION"], 200];
