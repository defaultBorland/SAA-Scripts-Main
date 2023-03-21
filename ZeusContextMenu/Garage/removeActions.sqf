//
private _actions = player getVariable ["SAA_ZEN_ContextActions_Garage", []];
{ [_x] call zen_context_menu_fnc_removeAction } forEach _actions;
player setVariable ["SAA_ZEN_ContextActions_Garage", []];