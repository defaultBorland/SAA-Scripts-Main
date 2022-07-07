//
fnc_typeSwitcher = {
	params["_type"];

	_convertedClass = switch (_type) do {
		case "Автомобиль";
		case "Car": {"Car"};

		case "КШМ";
		case "CV": {"CV"};

		case "БТР";
		case "APC": {"APC"};

		case "БМП";
		case "IFV": {"IFV"};

		case "Танк";
		case "Tank": {"Tank"};

		case "Вертолёт";
		case "Helicopter": {"Helicopter"};

		case "Судно";
		case "Vessel": {"Vessel"};

		default {"Other"};
	};

	//return
	_convertedClass
};

private _vehicles = missionNamespace getVariable ["SAA_garageVehicles", []];
if (_vehicles isEqualTo []) exitWith {
	hint format ["%1", localize "STR_SAA_SHOW_GARAGE_VEHICLES_ERROR_NO_VEHICLES"];
};

_vehicles = _vehicles apply {[_x # 0, _x # 1, (_x # 2) call fnc_typeSwitcher]};

//
private _vehiclesTypes = _vehicles apply {_x # 2};
_vehiclesTypes = _vehiclesTypes arrayIntersect _vehiclesTypes;

//
private _textArrays = [];
{	
	private _type = _x;
	private _vehiclesOfType = _vehicles select {(_x # 2) isEqualTo _type};
	_vehiclesOfType = _vehiclesOfType apply {[_x # 1, [_x # 0, true] call BIS_fnc_crewCount]};
	_type = localize ("STR_SAA_VEHICLES_" + toUpper _type);
	_textArrays pushBack ([_type, _vehiclesOfType]);

} forEach _vehiclesTypes;

_structuredText = format ["<t size='1.8' color='#ff0000' align='center' font='PuristaSemibold'>%1</t><br/>", localize "STR_SAA_SHOW_GARAGE_VEHICLES_ACTION_NAME"];
{
	_currentTypeHeader = _x # 0;
	_currentTypeArray = _x # 1;
	_structuredText = _structuredText + format["<t size='1.5' align='center'> %1 </t><br/>", _currentTypeHeader];
	{
		_structuredText = _structuredText + format["<t size='1.0' align='center'>%1 (%2)</t><br/>", _x # 0, _x # 1];
	} forEach _currentTypeArray;
} forEach _textArrays;

[parseText _structuredText] remoteExec ["hintSilent", remoteExecutedOwner];