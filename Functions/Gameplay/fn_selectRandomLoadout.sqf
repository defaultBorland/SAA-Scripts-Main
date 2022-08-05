//
params [""];

private _loadout_L22 = [["UK3CB_BAF_L22","","","rhsusf_acc_T1_low",["rhs_mag_30Rnd_556x45_M855_Stanag",30],[],""],[],["rhsusf_weap_m1911a1","","","",["rhsusf_mag_7x45acp_MHP",7],[],""],["VSM_Multicam_od_shirt_Camo_SS",[["ACE_EarPlugs",1],["ACE_fieldDressing",10],["ACE_epinephrine",2],["ACE_quikclot",7],["ACE_packingBandage",7],["ACE_morphine",1],["ACE_tourniquet",4],["ACE_splint",4],["ACE_bloodIV_500",1],["ACE_elasticBandage",5]]],["VSM_CarrierRig_Operator_Multicam",[["rhsusf_mag_7x45acp_MHP",3,7],["rhs_mag_30Rnd_556x45_M855_Stanag",10,30],["rhs_mag_an_m8hc",1,1]]],["VSM_Multicam_Backpack_Compact",[]],"VSM_OPS_2_multicam","VSM_Balaclava2_tan_Peltor_glasses",["rhsusf_bino_m24","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152_1","ItemCompass","ItemWatch",""]];

private _loadout_M70B1N = [["rhs_weap_m70b1n","","","rhs_acc_pkas",["rhs_30Rnd_762x39mm",30],[],""],[],["rhs_weap_tt33","","","",["rhs_mag_762x25_8",8],[],""],["VSM_Multicam_casual_Camo",[["ACE_EarPlugs",1],["ACE_fieldDressing",10],["ACE_epinephrine",2],["ACE_quikclot",7],["ACE_packingBandage",7],["ACE_morphine",1],["ACE_tourniquet",4],["ACE_splint",4],["ACE_bloodIV_500",1],["ACE_elasticBandage",5]]],["VSM_CarrierRig_Breacher_Multicam",[["rhs_mag_an_m8hc",1,1],["rhs_30Rnd_762x39mm",10,30],["rhs_mag_762x25_8",3,8]]],["VSM_Multicam_Backpack_Compact",[]],"VSM_Mich2000_Multicam","VSM_Shemagh_OD",["rhsusf_bino_m24","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152_1","ItemCompass","ItemWatch",""]];

private _loadout_M16A4 = [["rhs_weap_m16a4","rhsusf_acc_SFMB556","","CUP_optic_MicroT1",["rhs_mag_30Rnd_556x45_M855_Stanag",30],[],""],[],["rhsusf_weap_m1911a1","","","",["rhsusf_mag_7x45acp_MHP",7],[],""],["VSM_Multicam_Crye_SS_od_shirt_Camo",[["ACE_EarPlugs",1],["ACE_fieldDressing",10],["ACE_epinephrine",2],["ACE_quikclot",7],["ACE_packingBandage",7],["ACE_morphine",1],["ACE_tourniquet",4],["ACE_splint",4],["ACE_bloodIV_500",1],["ACE_elasticBandage",5]]],["VSM_FAPC_Operator_Multicam",[["rhs_mag_30Rnd_556x45_M855_Stanag",11,30],["rhsusf_mag_7x45acp_MHP",4,7],["rhs_mag_an_m8hc",1,1]]],["VSM_Multicam_Backpack_Compact",[]],"VSM_OPS_multicam","VSM_Balaclava_tan_Goggles",["rhsusf_bino_m24","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152_1","ItemCompass","ItemWatch",""]];

private _loadout_AKS74U = [["CUP_arifle_AKS74U","","","rhs_acc_pkas",["rhs_30Rnd_545x39_7N10_AK",30],[],""],[],["rhs_weap_makarov_pm","","","",["rhs_mag_9x18_8_57N181S",8],[],""],["VSM_Multicam_od_shirt_Camo",[["ACE_EarPlugs",1],["ACE_fieldDressing",10],["ACE_epinephrine",2],["ACE_quikclot",7],["ACE_packingBandage",7],["ACE_morphine",1],["ACE_tourniquet",4],["ACE_splint",4],["ACE_bloodIV_500",1],["ACE_elasticBandage",5]]],["VSM_RAV_Breacher_Multicam",[["rhs_mag_an_m8hc",1,1],["rhs_30Rnd_545x39_7N10_AK",10,30],["rhs_mag_9x18_8_57N181S",3,8]]],["VSM_Multicam_Backpack_Compact",[]],"VSM_Mich2000_Multicam","rhsusf_oakley_goggles_blk",["rhsusf_bino_m24","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152_1","ItemCompass","ItemWatch",""]];

private _loadout = selectRandom [_loadout_L22, _loadout_M70B1N, _loadout_M16A4, _loadout_AKS74U];

//return
_loadout