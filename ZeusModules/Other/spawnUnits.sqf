//

[localize "STR_SAA_ZEUS_MODULES_CATEGORIES_OTHER", localize "STR_SAA_ZEUS_MODULES_SPAWN_UNITS_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	[localize "STR_SAA_ZEUS_MODULES_SPAWN_UNITS_MODULENAME",
		[
			["COMBO", [localize "STR_SAA_ZEUS_MODULES_SPAWN_UNITS_DIALOG_TYPE", localize ""],
				[
					["_pmcs", "_guerrillas", "_soldiers"],
					[
						["PMC", "Advanced Arms"], 
						["GUER", "Guerrillas"], 
						["SOL", "Soldiers"]
					],
					0
				]
			],
			["SLIDER", [localize "STR_SAA_ZEUS_MODULES_SPAWN_UNITS_DIALOG_NUMBER", localize "STR_SAA_ZEUS_MODULES_SPAWN_UNITS_DIALOG_NUMBER_TOOLTIP"],
				[
					1, 24, 1, 0
				]
			],
			["SIDES", [localize "STR_SAA_ZEUS_MODULES_RESPAWN_CHANGE_TICKETS_AMOUNT_DIALOG_SIDE_DISPLAYNAME", localize ""],
				west
			],
			["CHECKBOX", [localize "STR_SAA_CLASSES_RIFLEMAN", localize ""],
				true
			],
			["CHECKBOX", [localize "STR_SAA_CLASSES_GRENADIER", localize ""],
				true
			],
			["CHECKBOX", [localize "STR_SAA_CLASSES_MACHINEGUNNER", localize ""],
				true
			],
			["CHECKBOX", [localize "STR_SAA_CLASSES_MEDIC", localize ""],
				true
			],
			["CHECKBOX", [localize "STR_SAA_CLASSES_MARKSMAN", localize ""],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_type", "_number", "_side", "_isRiflemanAllowed", "_isGrenadierAllowed", "_isMachinegunnerAllowed", "_isMedicAllowed", "_isSniperAllowed"];
			_args params ["_position"];

			if !(_isRiflemanAllowed or _isGrenadierAllowed or _isMachinegunnerAllowed or _isMedicAllowed or _isSniperAllowed) exitWith {};

			private _soldiers = [
				[
					"Rifleman",
					[["rhs_weap_savz58p","rhsgref_acc_zendl","","",["rhs_30Rnd_762x39mm_Savz58",30],[],""],[],[],["UK3CB_B_U_CombatUniform_Shortsleeve_02_WDL",[["ACE_fieldDressing",1],["ACE_packingBandage",1]]],["rhssaf_vest_md98_woodland",[["rhs_30Rnd_762x39mm_Savz58",3,30],["rhs_grenade_sthgr24_heerfrag_mag",1,1]]],[],"UK3CB_TKA_B_H_WDL","",[],["ItemMap","","","","",""]],
					8
				],
				[
					"Grenadier",
					[["rhs_weap_m79","","","",["rhs_mag_M441_HE",1],[],""],[],["rhs_weap_type94_new","","","",["rhs_mag_6x8mm_mhp",6],[],""],["UK3CB_ADM_B_U_CombatUniform_Shortsleeve_01_WDL_ALT",[["ACE_fieldDressing",1],["ACE_packingBandage",1]]],["rhssaf_vest_md99_woodland",[["rhs_mag_M441_HE",6,1],["rhs_grenade_m1939e_f_mag",1,1],["rhs_mag_nspd",1,1],["rhs_mag_9x19_7n31_17",2,17]]],[],"rhs_beret_milp","",[],["ItemMap","","","","",""]],
					1
				],
				[
					"Machinegunner",
					[["CUP_lmg_UK59","","","",["CUP_50Rnd_UK59_762x54R_Tracer",50],[],""],[],[],["UK3CB_B_U_CombatUniform_Shortsleeve_02_WDL",[["ACE_fieldDressing",1],["ACE_packingBandage",1]]],["UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest",[["CUP_50Rnd_UK59_762x54R_Tracer",2,50],["rhs_grenade_m1939e_f_mag",1,1]]],[],"UK3CB_ANA_B_H_6b27m_WDL","",[],["ItemMap","","","","",""]],
					4
				],
				[
					"Medic",
					[["CUP_Famas_F1","","","",["CUP_25Rnd_556x45_Famas",25],[],""],[],[],["UK3CB_ADM_B_U_CombatUniform_Shortsleeve_01_WDL_ALT",[["ACE_fieldDressing",1],["ACE_packingBandage",1]]],["UK3CB_CW_US_B_LATE_V_PASGT_Medic_Vest",[["ACE_fieldDressing",8],["ACE_bloodIV_250",1],["ACE_Can_Franta",2],["ACE_Banana",2],["ACE_tourniquet",2],["ACE_splint",1],["ACE_packingBandage",2],["CUP_25Rnd_556x45_Famas",4,25],["rhs_mag_rdg2_white",2,1]]],[],"UK3CB_CW_US_B_LATE_H_PASGT_02_WDL","",[],["ItemMap","","","","",""]],
					2
				],
				[
					"Marksman",
					[["UK3CB_Enfield_Rail","","","optic_KHS_old",["UK3CB_Enfield_10rnd_Mag",10],[],""],[],[],["UK3CB_ADM_B_U_CombatUniform_Shortsleeve_01_WDL_ALT",[["ACE_fieldDressing",1],["ACE_packingBandage",1]]],["UK3CB_TKA_I_V_6Sh92_TKA_Brush",[["UK3CB_Enfield_10rnd_Mag",4,10],["rhs_grenade_m1939e_f_mag",1,1],["rhs_mag_nspd",2,1]]],[],"rhssaf_bandana_md2camo","",[],["ItemMap","","","","",""]],
					1
				]
			];

			private _guerrillas = [
				[
					"Rifleman",
					[["rhs_weap_savz58p","rhsgref_acc_zendl","","",["rhs_30Rnd_762x39mm_Savz58",30],[],""],[],[],["LOP_U_BH_Fatigue_M81_FWDL",[["ACE_fieldDressing",1],["ACE_packingBandage",1]]],["UK3CB_BAF_V_PLCE_Webbing_Plate_DPMW",[["rhs_30Rnd_762x39mm_Savz58",2,30],["rhs_grenade_m1939e_f_mag",1,1]]],[],"H_Shemag_olive","",[],["ItemMap","","","","",""]],
					8
				],
				[
					"Grenadier",
					[["rhs_weap_m79","","","",["rhs_mag_M441_HE",1],[],""],[],["rhs_weap_savz61_folded","","","",["rhsgref_20rnd_765x17_vz61",20],[],""],["LOP_U_BH_Fatigue_M81_FWDL",[["ACE_fieldDressing",1],["ACE_packingBandage",1]]],["V_HarnessOGL_ghex_F",[["ACE_fieldDressing",2],["rhs_mag_M441_HE",6,1],["rhsgref_20rnd_765x17_vz61",2,20]]],[],"","G_Balaclava_oli",[],["ItemMap","","","","",""]],
					1
				],
				[
					"Machinegunner",
					[["CUP_lmg_UK59","","","",["CUP_50Rnd_UK59_762x54R_Tracer",50],[],""],[],[],["LOP_U_BH_Fatigue_FWDL_M81",[["ACE_fieldDressing",1],["ACE_packingBandage",1]]],["UK3CB_TKA_I_V_vydra_3m_TKA_Brush",[["CUP_50Rnd_UK59_762x54R_Tracer",2,50],["rhs_grenade_m1939e_f_mag",1,1]]],[],"","G_Bandanna_oli",[],["ItemMap","","","","",""]],
					1
				],
				[
					"Medic",
					[["rhs_weap_savz58p","rhsgref_acc_zendl","","",["rhs_30Rnd_762x39mm_Savz58",30],[],""],[],[],["LOP_U_BH_Fatigue_M81_FWDL",[["ACE_fieldDressing",1],["ACE_packingBandage",1]]],["UK3CB_TKA_I_V_6Sh92_Oli",[["ACE_fieldDressing",6],["ACE_bloodIV_250",1],["ACE_Can_Franta",1],["ACE_Can_Spirit",1],["ACE_morphine",1],["ACE_tourniquet",1],["rhs_30Rnd_762x39mm_Savz58",2,30]]],[],"VSM_BackwardsHat_Peltor_OD","",[],["ItemMap","","","","",""]],
					2
				],
				[
					"Marksman",
					[["UK3CB_Enfield_Rail","","","optic_KHS_old",["UK3CB_Enfield_10rnd_Mag",10],[],""],[],[],["LOP_U_BH_Fatigue_M81_FWDL",[["ACE_fieldDressing",1],["ACE_packingBandage",1]]],["V_BandollierB_oli",[["UK3CB_Enfield_10rnd_Mag",4,10],["rhs_grenade_m1939e_f_mag",1,1],["rhs_mag_nspn_green",1,1]]],[],"","",[],["ItemMap","","","","",""]],
					1
				]
			];

			private _pmcs = [
				[
					"Rifleman",
					[["CUP_arifle_Mk16_CQC_FG_black","","CUP_acc_ANPEQ_15_Flashlight_Black_L","CUP_optic_CompM4",["CUP_30Rnd_556x45_PMAG_QP",30],[],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],["U_O_R_Gorka_01_black_F",[["ACE_EarPlugs",1],["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_bloodIV_500",1],["ACE_CableTie",3],["ACE_epinephrine",2],["ACE_morphine",2],["ACE_packingBandage",5],["ACE_tourniquet",4],["ACE_Flashlight_XL50",1],["ACE_IR_Strobe_Item",2]]],["VSM_LBT1961_Black",[["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["CUP_30Rnd_556x45_PMAG_QP",5,30]]],["B_RadioBag_01_black_F",[["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",2,1],["ACE_CTS9",1,1]]],"UK3CB_ANP_B_H_6b27m_BLK","VSM_Balaclava2_black_Goggles",[],["ItemMap","","TFAR_anprc152","ItemCompass","ItemWatch","NVGoggles_OPFOR"]],
					8
				],
				[
					"Grenadier",
					[["CUP_arifle_Mk16_CQC_EGLM_black","","CUP_acc_ANPEQ_15_Flashlight_Black_L","optic_Yorris",["CUP_30Rnd_556x45_PMAG_QP",30],["rhs_mag_M441_HE",1],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],["U_O_R_Gorka_01_black_F",[["ACE_EarPlugs",1],["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_bloodIV_500",1],["ACE_CableTie",3],["ACE_epinephrine",2],["ACE_morphine",2],["ACE_packingBandage",5],["ACE_tourniquet",4],["ACE_Flashlight_XL50",1],["ACE_IR_Strobe_Item",2]]],["VSM_LBT1961_Black",[["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["CUP_30Rnd_556x45_PMAG_QP",4,30]]],["B_Messenger_Black_F",[["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",2,1],["ACE_CTS9",1,1],["rhs_mag_M441_HE",5,1],["rhs_mag_m662_red",1,1],["rhs_mag_m661_green",1,1],["ACE_40mm_Flare_white",4,1]]],"UK3CB_ANP_B_H_6b27m_BLK","VSM_Balaclava2_black_Goggles",[],["ItemMap","","TFAR_anprc152","ItemCompass","ItemWatch","NVGoggles_OPFOR"]],
					4
				],
				[
					"Machinegunner",
					[["CUP_arifle_Mk16_CQC_FG_black","","CUP_acc_ANPEQ_15_Flashlight_Black_L","CUP_optic_CompM4",["CUP_30Rnd_556x45_PMAG_QP",30],[],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],["U_O_R_Gorka_01_black_F",[["ACE_EarPlugs",1],["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_bloodIV_500",1],["ACE_CableTie",3],["ACE_epinephrine",2],["ACE_morphine",2],["ACE_packingBandage",5],["ACE_tourniquet",4],["ACE_Flashlight_XL50",1],["ACE_IR_Strobe_Item",2]]],["VSM_LBT1961_Black",[["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["CUP_30Rnd_556x45_PMAG_QP",5,30]]],["B_RadioBag_01_black_F",[["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",2,1],["ACE_CTS9",1,1]]],"UK3CB_ANP_B_H_6b27m_BLK","VSM_Balaclava2_black_Goggles",[],["ItemMap","","TFAR_anprc152","ItemCompass","ItemWatch","NVGoggles_OPFOR"]],
					4
				],
				[
					"Medic",
					[["SMA_AUG_A3_F","","CUP_acc_ANPEQ_15_Flashlight_Black_L","SMA_ELCAN_SPECTER_ARDRDS",["SMA_30Rnd_556x45_M855A1",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["U_O_R_Gorka_01_black_F",[["ACE_bloodIV_500",1],["ACE_epinephrine",2],["ACE_morphine",2],["ACE_tourniquet",4],["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_packingBandage",5],["ACE_MapTools",1],["ACE_IR_Strobe_Item",2],["ACE_Flashlight_XL50",1],["ACE_CableTie",4]]],["UK3CB_ANP_B_V_QRF_BLK",[]],["B_ViperHarness_blk_F",[["ACE_elasticBandage",20],["ACE_packingBandage",15],["ACE_tourniquet",10],["ACE_morphine",6],["ACE_quikclot",9],["ACE_epinephrine",4],["ACE_adenosine",2],["ACE_salineIV",2],["ACE_salineIV_500",2],["ACE_surgicalKit",1],["rhs_mag_an_m8hc",2,1],["ACE_CTS9",1,1],["rhsusf_mag_17Rnd_9x19_FMJ",3,17],["SMA_30Rnd_556x45_M855A1_IR",2,30],["SMA_30Rnd_556x45_M855A1",5,30]]],"rhsusf_opscore_bk_pelt","VSM_Shemagh_Balaclava2_OD_Peltor_Goggles",[],["ItemMap","","","ItemCompass","ItemWatch","CUP_NVG_GPNVG_black"]],
					2
				],
				[
					"Marksman",
					[["CUP_arifle_Mk16_CQC_FG_black","","CUP_acc_ANPEQ_15_Flashlight_Black_L","CUP_optic_CompM4",["CUP_30Rnd_556x45_PMAG_QP",30],[],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],["U_O_R_Gorka_01_black_F",[["ACE_EarPlugs",1],["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_bloodIV_500",1],["ACE_CableTie",3],["ACE_epinephrine",2],["ACE_morphine",2],["ACE_packingBandage",5],["ACE_tourniquet",4],["ACE_Flashlight_XL50",1],["ACE_IR_Strobe_Item",2]]],["VSM_LBT1961_Black",[["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["CUP_30Rnd_556x45_PMAG_QP",5,30]]],["B_RadioBag_01_black_F",[["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",2,1],["ACE_CTS9",1,1]]],"UK3CB_ANP_B_H_6b27m_BLK","VSM_Balaclava2_black_Goggles",[],["ItemMap","","TFAR_anprc152","ItemCompass","ItemWatch","NVGoggles_OPFOR"]],
					1
				]
			];

			private _setChances = [];

			{
				if (_x) then {
					private _num = ((call compile _type) # _forEachIndex) # 2;
					for "_i" from 1 to _num do {_setChances pushBack _forEachIndex};
				};
			} forEach [_isRiflemanAllowed, _isGrenadierAllowed, _isMachinegunnerAllowed, _isMedicAllowed, _isSniperAllowed];

			private _grp = createGroup _side;
			private _unitType = ["UK3CB_ADE_I_MK", "B_Survivor_F"] select (_type isEqualTo "_pmcs");
			private _units = [];

			for "_i" from 1 to _number do { 
				_unit = _grp createUnit [_unitType, [_position # 0, _position # 1], [], 0, "FORM"];
				_units pushBack _unit;
				_unit setUnitLoadout (((call compile _type) # (selectRandom _setChances)) # 1);
			};

			_units joinSilent _grp;
			
			//[{
			//	[[_this # 0], {(_this # 0) setGroupOwner 2}] remoteExec ["call", 2];
			//}, [_grp], 5] call CBA_fnc_waitAndExecute;
		},
		{},
		[_position]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;