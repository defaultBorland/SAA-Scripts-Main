"Extdb3" callExtension "9:RESET";
PROTOCOL = ceil random 9999;
OurDataBase = "dbsaa";
OurCustomIni = "custom.ini";
sleep 1;
"Extdb3" callExtension format ["9:ADD_DATABASE:%1",OurDataBase];
"Extdb3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM:%2:%3",OurDataBase,PROTOCOL,OurCustomIni];
diag_log format ["PROTOCOL:%1", PROTOCOL];