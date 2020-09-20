// KeyDown EHs

(findDisplay 49) displayAddEventHandler ["keyDown", {
    params ["_ctrl", "_key", "_shift", "_ctrlKey", "_alt"];

    if (_key == 1) then { // ESC KEY
    	hint "ESC KEY WAS PRESSED!";
    };
}];