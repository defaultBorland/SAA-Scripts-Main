//
params ["_group", ["_class", "None"]];

fnc_findPlayer = {
	params ["_noGroupPlayers", "_classNeeded", "_classesToAvoid"];

	private _index = _noGroupPlayers findIf {
		_x params ["_player", "_class1", "_class2"];
		
		_class1 isEqualTo _classNeeded && !(_class2 in _classesToAvoid)
		|| {_class2 isEqualTo _classNeeded && !(_class1 in _classesToAvoid)}
	};

	if (_index > -1) exitWith {_index};
	_index = _noGroupPlayers findIf {
		_x params ["_player", "_class1", "_class2"];
		
		_classNeeded in [_class1, _class2]
	};

	_index
};

private _fitPlayer = objNull;

private _players = [side player] call Shadec_fnc_getPlayers;
private _noGroupPlayers = _players select {count units group _x isEqualTo 1};
private _groupPlayers = _players select {group _x isEqualTo group player};

_noGroupPlayers = _noGroupPlayers apply {[
	_x,
	_x getVariable ["SAA_PrimaryClass", "Rifleman"],
	_x getVariable ["SAA_SecondaryClass", "None"]
]};

if (_class isNotEqualTo "None") then {

	private _index = _noGroupPlayers findIf {_class in [_x # 1, _x # 2]};
	if (_index > -1) then {
		_fitPlayer = _noGroupPlayers # _index;
	};

} else {
	
	private _groupClasses = (_groupPlayers apply {[
		_x getVariable ["SAA_PrimaryClass", "Rifleman"],
		_x getVariable ["SAA_SecondaryClass", "None"]
	]}) - ["None"];
	flatten _groupClasses;

	private _noGroupClasses = (_noGroupPlayers apply {[_x # 1, _x # 2]}) - ["None"];
	flatten _noGroupClasses;
	_noGroupClasses = _noGroupClasses arrayIntersect ["Medic", "AT", "Engineer", "Machinegunner", "Grenadier", "Marksman", "Rifleman"];
	_noGroupClasses = _noGroupClasses apply {
		private _class = _x;
		[
			[1, 2] select (_class isEqualTo "Medic"), // Minimal count in group needed
			{_x isEqualTo _class} count _groupClasses,
			_class
		]
	};
	
	{
		_x params ["_minNum", "_curNumInGroup", "_class"];

		if (_minNum < _curNumInGroup) then {
			private _index = [_noGroupClasses, _class, _noGroupClasses select [0, _forEachIndex]] call fnc_findPlayer;
			if (_index > -1) then {
				_fitPlayer = _noGroupPlayers # _index;
				break;
			};
		}

	} forEach _noGroupClasses;

};

_fitPlayer