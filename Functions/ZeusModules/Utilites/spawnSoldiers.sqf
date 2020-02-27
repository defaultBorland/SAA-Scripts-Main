//

["[SAA] Utilites", "Spawn Soldiers",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	private _types = ["Bandits Full (8)", "Bandits Half (4)", "COPS (4)"];

	private _dialogResult =
	[
		"Choose type",
		[
			["Types:", _types, 0]
		]
	] call Ares_fnc_showChooseDialog;

	// If the dialog was closed.
	if (_dialogResult isEqualTo []) exitWith{};

	// Get the selected data
	_dialogResult params ["_comboBoxResult"];

	switch (_comboBoxResult) do {
		case 0: {
			_grp = createGroup west;
			_ap = _grp createUnit [ "B_Survivor_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhs_weap_m70b1n","","","",["rhssaf_30Rnd_762x39mm_M67",30],[],""],[],[],["LOP_U_AFR_Civ_01",[["ACE_fieldDressing",2],["ACE_tourniquet",1]]],["rhssaf_vest_md99_woodland_rifleman",[["rhs_30Rnd_762x39mm",3,30]]],[],"H_Bandanna_surfer_blk","rhs_googles_clear",[],["","","","","",""]];
			_ap = _grp createUnit [ "B_Survivor_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhs_weap_scorpion","","","",["rhsgref_20rnd_765x17_vz61",20],[],""],[],[],["U_I_C_Soldier_Bandit_5_F",[["ACE_fieldDressing",2],["ACE_tourniquet",1]]],["rhssaf_vest_md99_woodland",[["rhsgref_20rnd_765x17_vz61",4,20]]],[],"","UK3CB_G_Face_Wrap_01",[],["","","","","",""]];
			_ap = _grp createUnit [ "B_Survivor_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhs_weap_m92","","","",["rhssaf_30Rnd_762x39mm_M67",30],[],""],[],[],["U_I_C_Soldier_Bandit_3_F",[["ACE_fieldDressing",2],["ACE_tourniquet",1]]],["rhssaf_vest_md99_woodland_rifleman",[["rhs_30Rnd_762x39mm_polymer",4,30]]],[],"","",[],["","","","","",""]];
			_ap = _grp createUnit [ "B_Survivor_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["CUP_arifle_AK47_Early","","","",["CUP_30Rnd_762x39_AK47_M",30],[],""],[],[],["LOP_U_AFR_Civ_06",[["ACE_fieldDressing",2],["ACE_tourniquet",1]]],["rhssaf_vest_md99_woodland_rifleman",[["rhs_30Rnd_762x39mm_polymer",4,30]]],[],"","",[],["","","","","",""]];
			_ap = _grp createUnit [ "B_Survivor_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhs_weap_m21s","","","",["rhsgref_30rnd_556x45_m21",30],[],""],[],[],["LOP_U_AFR_Civ_02",[["ACE_fieldDressing",2],["ACE_tourniquet",1]]],["rhssaf_vest_md99_woodland_rifleman_radio",[["rhsgref_30rnd_556x45_m21",4,30]]],[],"","G_Aviator",[],["","","tf_rf7800str","","",""]];
			_ap = _grp createUnit [ "B_Survivor_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhs_weap_l1a1_wood","rhsgref_acc_falMuzzle_l1a1","","",["rhs_mag_20Rnd_762x51_m80_fnfal",20],[],""],[],[],["U_C_Poor_1",[["ACE_fieldDressing",2],["ACE_tourniquet",1]]],["rhssaf_vest_md99_woodland_rifleman",[["rhs_mag_20Rnd_762x51_m61_fnfal",4,20]]],[],"","VSM_Facemask_OD_glasses",[],["","","","","",""]];
			_ap = _grp createUnit [ "B_Survivor_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhs_weap_savz58v_ris","","","",["rhs_30Rnd_762x39mm_Savz58",30],[],""],[],[],["U_I_C_Soldier_Bandit_2_F",[["ACE_fieldDressing",2],["ACE_tourniquet",1]]],["rhssaf_vest_md99_woodland",[["rhs_30Rnd_762x39mm_Savz58",4,30]]],[],"","G_Spectacles_Tinted",[],["","","","","",""]];
			_ap = _grp createUnit [ "B_Survivor_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["CUP_smg_bizon","","","",["CUP_64Rnd_9x19_Bizon_M",64],[],""],[],[],["U_C_Mechanic_01_F",[["ACE_fieldDressing",2],["ACE_tourniquet",1]]],["rhssaf_vest_md99_woodland",[["CUP_64Rnd_9x19_Bizon_M",2,64]]],[],"","G_Sport_Blackred",[],["","","","","",""]];
		};
		case 1: {
			_grp = createGroup west;
			_ap = _grp createUnit [ "B_Survivor_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["CUP_arifle_AK47_Early","","","",["CUP_30Rnd_762x39_AK47_M",30],[],""],[],[],["LOP_U_AFR_Civ_06",[["ACE_fieldDressing",2],["ACE_tourniquet",1]]],["rhssaf_vest_md99_woodland_rifleman",[["rhs_30Rnd_762x39mm_polymer",4,30]]],[],"","",[],["","","","","",""]];
			_ap = _grp createUnit [ "B_Survivor_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhs_weap_m70b1n","","","",["rhssaf_30Rnd_762x39mm_M67",30],[],""],[],[],["LOP_U_AFR_Civ_01",[["ACE_fieldDressing",2],["ACE_tourniquet",1]]],["rhssaf_vest_md99_woodland_rifleman",[["rhs_30Rnd_762x39mm",3,30]]],[],"H_Bandanna_surfer_blk","rhs_googles_clear",[],["","","","","",""]];
			_ap = _grp createUnit [ "B_Survivor_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhs_weap_savz58v_ris","","","",["rhs_30Rnd_762x39mm_Savz58",30],[],""],[],[],["U_I_C_Soldier_Bandit_2_F",[["ACE_fieldDressing",2],["ACE_tourniquet",1]]],["rhssaf_vest_md99_woodland",[["rhs_30Rnd_762x39mm_Savz58",4,30]]],[],"","G_Spectacles_Tinted",[],["","","","","",""]];
			_ap = _grp createUnit [ "B_Survivor_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhs_weap_l1a1_wood","rhsgref_acc_falMuzzle_l1a1","","",["rhs_mag_20Rnd_762x51_m80_fnfal",20],[],""],[],[],["U_C_Poor_1",[["ACE_fieldDressing",2],["ACE_tourniquet",1]]],["rhssaf_vest_md99_woodland_rifleman",[["rhs_mag_20Rnd_762x51_m61_fnfal",4,20]]],[],"","VSM_Facemask_OD_glasses",[],["","","","","",""]];
			};
		case 2: {
			_grp = createGroup west;
			_ap = _grp createUnit [ "B_GEN_Soldier_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhs_weap_hk416d10","","","",["rhs_mag_30Rnd_556x45_M855_PMAG",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["LOP_U_UVF_Fatigue_BL",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_quikclot",5],["ACE_bloodIV_250",1],["ACE_EarPlugs",1],["ACE_epinephrine",1],["ACE_morphine",1],["ACE_tourniquet",2],["ACE_Cellphone",1],["ACE_CableTie",6],["UK3CB_BAF_SmokeShell",1,1]]],["UK3CB_ANP_B_V_TacVest_BLK",[["rhsusf_mag_17Rnd_9x19_JHP",3,17],["rhs_mag_30Rnd_556x45_M855_PMAG",4,30]]],[],"UK3CB_TKP_I_H_Beret","rhs_googles_black",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc148jem","ItemCompass","Itemwatch",""]];
			_ap = _grp createUnit [ "B_GEN_Soldier_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhs_weap_M590_8RD","","","",["rhsusf_8Rnd_00Buck",8],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["LOP_U_UVF_Fatigue_BL",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_quikclot",5],["ACE_bloodIV_250",1],["ACE_EarPlugs",1],["ACE_epinephrine",1],["ACE_morphine",1],["ACE_tourniquet",2],["ACE_Cellphone",1],["ACE_CableTie",6],["UK3CB_BAF_SmokeShell",1,1]]],["UK3CB_ANP_B_V_TacVest_BLK",[["rhsusf_mag_17Rnd_9x19_JHP",3,17],["rhsusf_8Rnd_Slug",4,8],["rhsusf_8Rnd_00Buck",4,8]]],[],"UK3CB_TKP_I_H_Beret","rhs_googles_black",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc148jem","ItemCompass","Itemwatch",""]];
			_ap = _grp createUnit [ "B_GEN_Soldier_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhsusf_weap_MP7A2","","","",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["LOP_U_UVF_Fatigue_BL",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_quikclot",5],["ACE_bloodIV_250",1],["ACE_EarPlugs",1],["ACE_epinephrine",1],["ACE_morphine",1],["ACE_tourniquet",2],["ACE_Cellphone",1],["ACE_CableTie",6],["UK3CB_BAF_SmokeShell",1,1]]],["UK3CB_ANP_B_V_TacVest_BLK",[["rhsusf_mag_17Rnd_9x19_JHP",3,17],["rhsusf_mag_40Rnd_46x30_AP",4,40]]],[],"UK3CB_TKP_I_H_Beret","rhs_googles_black",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc148jem","ItemCompass","Itemwatch",""]];
			_ap = _grp createUnit [ "B_GEN_Soldier_F", _position, [], 0, "FORM"]; _ap setUnitLoadout [["rhs_weap_m16a4_carryhandle","","","",["rhs_mag_30Rnd_556x45_M855_PMAG",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["LOP_U_UVF_Fatigue_BL",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_quikclot",5],["ACE_bloodIV_250",1],["ACE_EarPlugs",1],["ACE_epinephrine",1],["ACE_morphine",1],["ACE_tourniquet",2],["ACE_Cellphone",1],["ACE_CableTie",6],["UK3CB_BAF_SmokeShell",1,1]]],["UK3CB_ANP_B_V_TacVest_BLK",[["rhsusf_mag_17Rnd_9x19_JHP",3,17],["rhs_mag_30Rnd_556x45_M855_PMAG",4,30]]],[],"UK3CB_TKP_I_H_Beret","rhs_googles_black",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc148jem","ItemCompass","Itemwatch",""]];
		};
	};
}] call Ares_fnc_RegisterCustomModule;