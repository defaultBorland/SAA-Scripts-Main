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

		case "ПВО";
		case "AA": {"AA"};

		default {"Other"};
	};

	//return
	_convertedClass
};

private _vehiclesGarage = missionNamespace getVariable ["SAA_garageVehicles", []];
if (_vehiclesGarage isEqualTo []) exitWith {
	hint format ["%1", localize "STR_SAA_SHOW_GARAGE_VEHICLES_ERROR_NO_VEHICLES"];
};
private _vehiclesDeployed = (8 allObjects 1) select {_x getVariable ["SAA_isGarageVehicle", false]} apply {typeOf _x};

_vehiclesGarage = _vehiclesGarage apply {[_x # 0, _x # 1, (_x # 2) call fnc_typeSwitcher, false]};
{
	private _index = _vehiclesDeployed find (_x # 0);
	if (_index > -1) then {
		_x set [3, true];
		_vehiclesDeployed deleteAt _index;
	};
} forEach _vehiclesGarage;

//
private _vehiclesTypes = _vehiclesGarage apply {_x # 2};
_vehiclesTypes = _vehiclesTypes arrayIntersect _vehiclesTypes;

//
private _textArrays = [];
{	
	private _type = _x;
	private _vehiclesOfType = _vehiclesGarage select {(_x # 2) isEqualTo _type};
	_vehiclesOfType = _vehiclesOfType apply {[_x # 1, [_x # 0, true] call BIS_fnc_crewCount, _x # 3]};
	_type = localize ("STR_SAA_VEHICLES_" + toUpper _type);
	_textArrays pushBack ([_type, _vehiclesOfType]);

} forEach _vehiclesTypes;

_structuredText = format ["<t size='1.8' color='#ff0000' align='center' font='PuristaSemibold'>%1</t><br/>", localize "STR_SAA_SHOW_GARAGE_VEHICLES_ACTION_NAME"];
{
	_currentTypeHeader = _x # 0;
	_currentTypeArray = _x # 1;
	_structuredText = _structuredText + format["<t size='1.5' align='center'> %1 </t><br/>", _currentTypeHeader];
	{
		_structuredText = _structuredText + format["<t size='1.0' align='center' color='%3'>%1 (%2)</t><br/>", _x # 0, _x # 1, ["ffffff", "#ff0000"] select (_x # 2)];
	} forEach _currentTypeArray;
} forEach _textArrays;

[parseText _structuredText] remoteExec ["hintSilent", remoteExecutedOwner];