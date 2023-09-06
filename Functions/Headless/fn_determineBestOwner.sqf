//
//params ["_group"];

private _headlessClients = allPlayers select {typeOf _x isEqualTo "HeadlessClient_F"};
if (count _headlessClients < 1) exitWith {2};

private _bestHC = [objNull, 2, 9999, 0];
{
	private _hc = _x;
	private _hcId = owner _x;
	private _localUnitsCount = {owner _x isEqualTo _hcId} count allUnits;
	private _fps = _hc getVariable ["SAA_HC_FPS", 0];

	if (
		_localUnitsCount <= (_bestHC # 2) 
		// && {_fps >= (_bestHC # 3) - 2}
	) then {
		_bestHC = [_x, _hcId, _localUnitsCount, _fps];
	};
} forEach _headlessClients;


// return owner ID
_bestHC # 1