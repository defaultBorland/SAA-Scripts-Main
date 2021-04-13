// Function to define and init SAA Zeus modules to players (ZEUSES)

[] execVM "ZeusModules\Respawn\addRemoveRespawnTickets.sqf";
// [] execVM "Functions\ZeusModules\Respawn\forceRespawn.sqf";
[] execVM "ZeusModules\Respawn\removeRespawnPoint.sqf";
// [] execVM "Functions\ZeusModules\Respawn\enableDisableRespawn.sqf";
// [] execVM "Functions\ZeusModules\Respawn\changeRespawnTime.sqf"; 
[] execVM "ZeusModules\Respawn\createRespawnPoint.sqf";
// [] execVM "Functions\ZeusModules\Respawn\playersRespawnInfo.sqf";
[] execVM "ZeusModules\Main\addShadecArsenal.sqf";
// [] execVM "Functions\ZeusModules\Respawn\moveRespawnMarker.sqf";
[] execVM "ZeusModules\Main\endMission.sqf";
[] execVM "ZeusModules\Main\assignStorage.sqf";
[] execVM "ZeusModules\Main\removeStorage.sqf";
[] execVM "ZeusModules\Main\playersList.sqf";
[] execVM "ZeusModules\Main\promoteToZeus.sqf";
// [] execVM "Functions\ZeusModules\Utilites\spawnSoldiers.sqf";
[] execVM "ZeusModules\Radio\addJammingVehicle.sqf";
[] execVM "ZeusModules\Radio\removeJammingVehicle.sqf";
[] execVM "ZeusModules\Radio\changeSignalQuality.sqf";
// [] execVM "Functions\ZeusModules\Utilites\clearVehicleInventory.sqf";
// [] execVM "Functions\ZeusModules\Utilites\healAllPlayers.sqf";