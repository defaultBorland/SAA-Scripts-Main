"Extdb3" callExtension "9:RESET";
PROTOCOL = ceil random 9999;
DataBase = "dbsaa";
CustomIni = "custom.ini";
sleep 1;
"Extdb3" callExtension format ["9:ADD_DATABASE:%1", DataBase];
"Extdb3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM:%2:%3", DataBase, PROTOCOL, CustomIni];
diag_log format ["DB | PROTOCOL:%1", PROTOCOL];


"Extdb3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%1:SQL:SQL", DataBase];
diag_log format ["DB | SQL PROTOCOL ADDED"];