
_zeuses = [
	""
];

missionNamespace setVariable ["ZeusArray", _zeuses, true];

CuratorLogicGroup = creategroup sideLogic;  
Zeus0 = CuratorLogicGroup createunit ["ModuleCurator_F", [0, 0, 0],[],0.5,"NONE"];
Zeus0 setvariable ["text", "Zeus_0"];    
Zeus0 setvariable ["Addons", 3, true];
Zeus0 setvariable ["owner", "objNull"];  
Zeus0 setvariable ["vehicleinit","_this setvariable ['Addons',3,true]; _this setvariable ['owner','objnull'];"];
unassignCurator Zeus0;
objnull assignCurator Zeus0;

missionNamespace setVariable ["Zeus_0_curator", Zeus0];

Zeus1 = CuratorLogicGroup createunit ["ModuleCurator_F", [0, 0, 0],[],0.5,"NONE"];
Zeus1 setvariable ["text", "Zeus_1"];    
Zeus1 setvariable ["Addons", 3, true];
Zeus1 setvariable ["owner", "objNull"];  
Zeus1 setvariable ["vehicleinit","_this setvariable ['Addons',3,true]; _this setvariable ['owner','objnull'];"];
unassignCurator Zeus1;
objnull assignCurator Zeus1;

missionNamespace setVariable ["Zeus_1_curator", Zeus1];

Zeus2 = CuratorLogicGroup createunit ["ModuleCurator_F", [0, 0, 0],[],0.5,"NONE"];
Zeus2 setvariable ["text", "Zeus_2"];    
Zeus2 setvariable ["Addons", 3, true];
Zeus2 setvariable ["owner", "objNull"];  
Zeus2 setvariable ["vehicleinit","_this setvariable ['Addons',3,true]; _this setvariable ['owner','objnull'];"];
unassignCurator Zeus2;
objnull assignCurator Zeus2;

missionNamespace setVariable ["Zeus_2_curator", Zeus2];

zeusSlots = [Zeus0, Zeus1, Zeus2];