//
params ["_quality"];

player setVariable ["tf_receivingDistanceMultiplicator", 26-(_quality*25)];
player setVariable ["tf_sendingDistanceMultiplicator", _quality];

//
true