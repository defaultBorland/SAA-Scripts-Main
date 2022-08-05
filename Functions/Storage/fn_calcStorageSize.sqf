//
params ["_rank", "_primaryClass", "_secondaryClass"];

private _storageSize = 1000;

private _ranks = ["PV1", "PV2", "SPC", "SGT", "SSG", "MSG", "SMC", "WO1", "CWO", "2LT", "1LT", "CPT"];
private _ranksStartBonus = 250;
private _classes = ["Rifleman", "Machinegunner", "Grenadier", "Engineer", "AT", "Medic", "Marksman", "Sniper"];
private _classesBonus = [0, 600, 600, 600, 1200, 450, 390, 600];

if (_rank in _ranks) then {
	private _index = _ranks find _rank;
	if (_index > 0) then {
		
		private _rankBonus = _ranksStartBonus;
		_storageSize = _storageSize + _ranksStartBonus;

		for "_i" from 2 to _index do {
			_rankBonus = _rankBonus * 0.9;
			_storageSize = _storageSize + _rankBonus;
		};

		_storageSize = floor(_storageSize);
	};
};

if (_primaryClass in _classes) then {
	private _index = _classes find _primaryClass;
	if (_index > 0) then {
		_storageSize = _storageSize + (_classesBonus # _index);
	};
};

if (_secondaryClass in _classes) then {
	if !(_rank in _ranks) exitWith {};
	private _index = _classes find _secondaryClass;
	if (_index > 0) then {
		_storageSize = _storageSize + floor((_classesBonus # _index) / 3);
	};
};


//return
_storageSize