//
params ["_quality"];

diag_log format ["QUALITY IS: %1", _quality];

player setVariable ["tf_receivingDistanceMultiplicator", 26-(_quality*25)];
player setVariable ["tf_sendingDistanceMultiplicator", _quality];

//
true