params ["_classificationType"];

_availiableItems = [];
_itemsDisc = [];
_itemsPrice = [];

switch (_classificationType) do {
	case "Primary": {
		_availiableItems = ["CUP_arifle_L86A2","rhs_weap_m249","rhs_weap_m249_pip","rhs_weap_m249_light_L","rhs_weap_m249_pip_L_para","rhs_weap_m249_pip_L","rhs_weap_m249_pip_ris","rhs_weap_m249_light_S","rhs_weap_m249_pip_S_para","CUP_arifle_MG36","CUP_arifle_MG36_camo","CUP_arifle_MG36_hex","CUP_arifle_MG36_wdl","CUP_lmg_m249_SQuantoon","UK3CB_BAF_L110_762","rhs_weap_m240B","rhs_weap_m240G","CUP_lmg_M60E4","CUP_lmg_MG3_rail","rhs_weap_mg42","sma_minimi_mk3_762tlb","sma_minimi_mk3_762tlb_des","sma_minimi_mk3_762tlb_wdl","sma_minimi_mk3_762tsb","sma_minimi_mk3_762tsb_des","sma_minimi_mk3_762tsb_wdl","CUP_lmg_Mk48","CUP_lmg_Mk48_des","CUP_lmg_Mk48_wdl","CUP_lmg_PKM_B50_vfg","CUP_lmg_PKM_front_rail_B50_vfg","CUP_lmg_PKM_top_rail","CUP_lmg_PKM_top_rail_B50_vfg","CUP_lmg_PKMN","CUP_lmg_Pecheneg","CUP_lmg_Pecheneg_B50_vfg","CUP_lmg_Pecheneg_desert","CUP_lmg_Pecheneg_top_rail","CUP_lmg_Pecheneg_top_rail_B50_vfg","CUP_lmg_Pecheneg_woodland","rhs_weap_6p53","rhs_weap_pb_6p9","hgun_Pistol_heavy_02_F","CUP_hgun_Compact","CUP_hgun_Phantom","CUP_hgun_Deagle","CUP_hgun_Glock17","CUP_hgun_Glock17_blk","CUP_hgun_Glock17_tan","UK3CB_BAF_L105A1","UK3CB_BAF_L105A2","UK3CB_BAF_L107A1","UK3CB_BAF_L117A2","UK3CB_BAF_L131A1","UK3CB_BAF_L9A1","rhsusf_weap_m1911a1","rhsusf_weap_m9","CUP_hgun_Mk23","rhs_weap_pya","rhs_weap_makarov_pm","hgun_Pistol_Signal_F","CUP_hgun_TaurusTracker455","rhs_weap_tt33","rhs_weap_savz61_folded","rhs_weap_pp2000_folded","CUP_hgun_Mac10","CUP_hgun_MicroUzi","CUP_hgun_MP7","CUP_hgun_MP7_desert","CUP_hgun_MP7_woodland","rhs_weap_rsp30_white","rhs_weap_rsp30_green","rhs_weap_rsp30_red","rhs_weap_M136","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","UK3CB_BAF_NLAW_Launcher","rhs_weap_m80","rhs_weap_rpg26","rhs_weap_rpg75","CUP_launch_RPG18","rhs_weap_rshg2","UK3CB_BAF_Javelin_Slung_Tube","rhs_acc_6p9_suppressor","SMA_AAC_762_sdn6","SMA_AAC_762_sdn6_d","SMA_AAC_762_sdn6_G","SMA_AAC_762_sdn6_T","SMA_AAC_762_sdn6_w","rhsgref_sdn6_suppressor","rhs_acc_dtk4short","rhs_acc_dtk4long","CUP_muzzle_snds_FAMAS_Arid","CUP_muzzle_snds_FAMAS","CUP_muzzle_snds_FAMAS_Wood","CUP_muzzle_snds_G36_black","CUP_muzzle_snds_G36_desert","SMA_supp_762","SMA_supptan_762","SMA_supp2BW_556","SMA_supp2BOD_556","SMA_supp2BT_556","SMA_supp2T_556","SMA_supp2TB_556","SMA_supp2TWH_556","SMA_supp2TOD_556","SMA_supp2b_556","SMA_supp2btan_556","sma_gemtech_one_blk","sma_gemtech_one_des","sma_gemtech_one_wdl","CUP_muzzle_snds_mk23","CUP_muzzle_snds_KZRZP_PK","CUP_muzzle_snds_KZRZP_PK_desert","CUP_muzzle_snds_KZRZP_PK_woodland","CUP_muzzle_snds_M110_black","CUP_muzzle_snds_M110","CUP_muzzle_snds_M110_woodland","rhsusf_acc_m24_silencer_black","rhsusf_acc_m24_silencer_d","rhsusf_acc_m24_silencer_wd","CUP_muzzle_mfsup_Suppressor_Mac10","CUP_muzzle_snds_Mk12","rhsusf_acc_nt4_black","rhsusf_acc_nt4_tan","CUP_muzzle_snds_groza","rhs_acc_pbs1","rhs_acc_pbs4","SMA_supp1BB_556","SMA_supp1Bwht_556","SMA_supp1BOD_556","SMA_supp1BT_556","SMA_supp1TT_556","SMA_supp1TB_556","SMA_supp1TW_556","SMA_supp1TOD_556","SMA_supp1b_556","SMA_supp1tan_556","SMA_rotex_blk","SMA_rotex_gry","SMA_rotex_tan","rhsusf_acc_rotex5_grey","rhsusf_acc_rotex5_tan","rhsusf_acc_rotex_mp7_aor1","rhsusf_acc_rotex_mp7","rhsusf_acc_rotex_mp7_desert","rhsusf_acc_rotex_mp7_winter","CUP_muzzle_snds_MicroUzi","CUP_muzzle_snds_SR3M","rhsusf_acc_omega9k","SMA_Silencer_556","SMA_Silencer_556_Bronze","SMA_Silencer_556_Silver","SMA_supp2smaB_556","SMA_supp2smaT_556","muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand","muzzle_snds_acp","CUP_muzzle_snds_MP7","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F","muzzle_snds_M","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F","muzzle_snds_B","muzzle_snds_H_MG","muzzle_snds_H_MG_blk_F","muzzle_snds_H_MG_khk_F","rhsusf_acc_SR25S","rhsusf_acc_SR25S_d","rhsusf_acc_SR25S_wd","UK3CB_BAF_Silencer_L105A1","UK3CB_BAF_Silencer_L110","UK3CB_BAF_Silencer_L115A3","UK3CB_BAF_Silencer_L85","UK3CB_BAF_Silencer_L91A1","rhs_acc_tgpa","rhs_acc_tgpv","rhs_acc_tgpv2","rhsusf_acc_M2010S","rhsusf_acc_M2010S_d","rhsusf_acc_M2010S_sa","rhsusf_acc_M2010S_wd","muzzle_snds_570","rhs_acc_uuk","rhsusf_acc_ARDEC_M240","rhs_acc_ak5","rhs_acc_dtk","rhs_acc_dtk1983","rhs_acc_dtk1","rhs_acc_dtk1p","rhs_acc_dtk2","rhs_acc_dtk3","CUP_muzzle_mfsup_Flashhider_PK_Black","CUP_muzzle_mfsup_Flashhider_PK_OD","CUP_muzzle_mfsup_Flashhider_PK_Tan","ACE_muzzle_mzls_338","ACE_muzzle_mzls_smg_01","ACE_muzzle_mzls_L","ACE_muzzle_mzls_B","ACE_muzzle_mzls_smg_02","rhsusf_acc_m24_muzzlehider_black","rhsusf_acc_m24_muzzlehider_d","rhsusf_acc_m24_muzzlehider_wd","SMA_FLASHHIDER1","SMA_FLASHHIDER2","rhs_acc_pgs64","rhsusf_acc_SF3P556","rhsusf_acc_SFMB556","CUP_acc_sffh","rhsgref_acc_zendl","rhs_acc_1p29","rhs_acc_1p63","rhs_acc_rakursPM","rhs_acc_1p78","rhs_acc_1p87","rhs_acc_1pn34","rhs_acc_1pn93_1","CUP_optic_MicroT1","CUP_optic_MicroT1_coyote","CUP_optic_MicroT1_low","CUP_optic_MicroT1_low_coyote","CUP_optic_MicroT1_low_OD","CUP_optic_MicroT1_OD","CUP_optic_AN_PAS_13c1","rhsusf_acc_anpas13gv1","rhsusf_acc_ACOG2_USMC","rhsusf_acc_ACOG3_USMC","rhsusf_acc_ACOG_USMC","rhsusf_acc_anpvs27","optic_Yorris","optic_ACO_grn","optic_Aco","optic_ACO_grn_smg","optic_Aco_smg","rhs_acc_ekp1","rhs_acc_ekp8_02","rhs_acc_ekp8_18","SMA_ELCAN_SPECTER","SMA_ELCAN_SPECTER_RDS","SMA_ELCAN_SPECTER_ARDRDS","SMA_ELCAN_SPECTER_GREEN","SMA_ELCAN_SPECTER_GREEN_RDS","SMA_ELCAN_SPECTER_GREEN_ARDRDS","SMA_ELCAN_SPECTER_TAN","SMA_ELCAN_SPECTER_TAN_RDS","SMA_ELCAN_SPECTER_TAN_ARDRDS","SMA_eotech552","SMA_eotech552_3XDOWN","SMA_eotech552_3XDOWN_des","SMA_eotech552_3XDOWN_wdl","SMA_eotech552_kf","SMA_eotech552_kf_des","SMA_eotech552_kf_wdl","SMA_eotech","SMA_eotechG33_3XDOWN","SMA_eotechG33_grn_3XDOWN","SMA_eotechG33_tan_3XDOWN","SMA_eotech_G","SMA_eotech_T","optic_MRCO","optic_Hamr","optic_Hamr_khk_F","rhsusf_acc_ACOG","rhsusf_acc_ACOG2","rhsusf_acc_ACOG3","rhsusf_acc_eotech_552","rhsusf_acc_eotech_552_d","rhsusf_acc_eotech_552_wd","rhsusf_acc_compm4","CUP_optic_MARS","CUP_optic_MARS_OD","CUP_optic_MARS_tan","CUP_optic_AIMM_MARS_BLK","CUP_optic_AIMM_MARS_TAN","CUP_optic_AIMM_MARS_OD","rhsgref_mg42_acc_AAsight","SMA_MICRO_T2","SMA_MICRO_T2_3XDOWN","SMA_MICRO_T2_LM","rhsusf_acc_mrds","rhsusf_acc_mrds_fwd","rhsusf_acc_mrds_c","rhsusf_acc_mrds_fwd_c","rhs_acc_nita","rhs_acc_okp7_dovetail","rhs_acc_okp7_picatinny","rhs_acc_pkas","rhs_acc_pso1m2","rhs_acc_pso1m21","rhs_acc_npz","rhsusf_acc_RM05","rhsusf_acc_RM05_fwd","RKSL_optic_RMR_HG","RKSL_optic_RMR_HG_FDE","RKSL_optic_RMR_MS19","RKSL_optic_RMR_MS19_FDE","RKSL_optic_RMR_RM33","RKSL_optic_RMR_RM33_FDE","rhsusf_acc_RX01_NoFilter","rhsusf_acc_RX01","rhsusf_acc_RX01_NoFilter_tan","rhsusf_acc_RX01_tan","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","SMA_BARSKA","SMA_CMORE","SMA_CMOREGRN","SMA_AIMPOINT","SMA_AIMPOINT_GLARE","rhsusf_acc_ACOG_d","rhsusf_acc_ACOG_sa","rhsusf_acc_ACOG_wd","rhsusf_acc_ACOG_RMR","sma_spitfire_01_black","sma_spitfire_01_sc_black","sma_spitfire_03_black","sma_spitfire_03_sc_black","sma_spitfire_03_rds_black","sma_spitfire_03_rds_low_ard_black","sma_spitfire_03_rds_low_black","CUP_optic_ZeissZPoint","CUP_optic_ZeissZPoint_desert","CUP_optic_ZeissZPoint_hex","CUP_optic_ZeissZPoint_wood","optic_dms","optic_DMS_ghex_F","CUP_optic_GOSHAWK","CUP_optic_GOSHAWK_RIS","UK3CB_BAF_Kite","RKSL_optic_LDS","RKSL_optic_LDS_C","UK3CB_BAF_SpecterLDS","rhsusf_acc_ELCAN","rhsusf_acc_ELCAN_ard","rhsusf_acc_ACOG_anpvs27","CUP_optic_PSO_1_1","CUP_optic_PSO_1_1_open","rhsusf_acc_su230","rhsusf_acc_su230_c","rhsusf_acc_su230_mrds","rhsusf_acc_su230_mrds_c","UK3CB_BAF_SUIT","UK3CB_BAF_SUSAT","CUP_optic_ACOG_TA01B_Black_3D","CUP_optic_ACOG_TA01B_Coyote_3D","CUP_optic_ACOG_TA01B_OD_3D","CUP_optic_ACOG_TA01B_RMR_Black_3D","CUP_optic_ACOG_TA01B_RMR_Coyote_3D","CUP_optic_ACOG_TA01B_RMR_OD_3D","CUP_optic_ACOG_TA01B_RMR_Tan_3D","CUP_optic_ACOG_TA01B_RMR_Tropic_3D","CUP_optic_ACOG_TA01B_Tan_3D","CUP_optic_ACOG_TA01B_Tropic_3D","CUP_optic_CWS","CUP_optic_AN_PAS_13c2","UK3CB_BAF_MaxiKite","optic_SOS","optic_SOS_khk_F","optic_NVS","rhsusf_acc_ACOG_MDO","rhs_acc_2dpZenit","rhs_acc_2dpZenit_ris","CUP_acc_CZ_M3X","rhsusf_acc_M952V","acc_flashlight_pistol","SMA_SFLIGHT_TOPM4","SMA_SFFL_BLK","SMA_SFFL_TAN","acc_flashlight","rhsusf_acc_wmx","rhsusf_acc_wmx_bk","rhsusf_acc_anpeq15side","SMA_ANPEQ15_TOP_TAN_ACR","SMA_ANPEQ15_TOP_TAN_M4","SMA_ANPEQ15_TOP_TAN_MK18","SMA_ANPEQ15_TOP_TAN_SCAR","rhsusf_acc_anpeq15_top","rhsusf_acc_anpeq15side_bk","rhsusf_acc_anpeq15_bk_top","rhsusf_acc_anpeq15A","SMA_ANPEQ15_TAN","SMA_ANPEQ15_TOP_417TAN","SMA_ANPEQ15_BLK","SMA_ANPEQ15_TOP_417BLK","rhs_acc_perst1ik","rhs_acc_perst1ik_ris","rhs_acc_perst3","rhs_acc_perst3_top","rhsusf_acc_anpeq15_wmx","rhsusf_acc_anpeq15_wmx_light","SMA_ANPEQ15_TOP_BLK_M4","SMA_ANPEQ15_TOP_BLK_MK18","SMA_ANPEQ15_TOP_BLK_SCAR","SMA_ANPEQ15_TOP_BLK_ACR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15_light","rhsusf_acc_anpeq15_bk","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq16a","rhsusf_acc_anpeq16a_light","rhsusf_acc_anpeq16a_top","rhsusf_acc_anpeq16a_light_top","SMA_SFPEQ_AUGCQC_BLK","SMA_SFPEQ_ACRTOP_BLK","SMA_SFPEQ_M4TOP_BLK","SMA_SFPEQ_HK417TOP_BLK","SMA_SFPEQ_MK18TOP_BLK","SMA_SFPEQ_SCARTOP_BLK","SMA_SFPEQ_AUGCQC_TAN","SMA_SFPEQ_M4TOP_TAN","SMA_SFPEQ_HK417TOP_TAN","SMA_SFPEQ_MK18TOP_TAN","SMA_SFPEQ_SCARTOP_TAN","ACE_acc_pointer_green","acc_pointer_IR","UK3CB_BAF_LLM_Flashlight_Black","UK3CB_BAF_LLM_Flashlight_Tan","rhs_acc_perst3_2dp","rhs_acc_perst3_2dp_light","UK3CB_BAF_L105A1_LLM_FL_G","CUP_acc_LLM01_L","CUP_acc_LLM01_coyote_L","CUP_acc_LLM01_desert_L","CUP_acc_LLM01_hex_L","CUP_acc_LLM01_od_L","CUP_acc_mk23_lam_f","SMA_RAILGUARD_BLK_HK","SMA_RAILGUARD_OD_HK","SMA_RAILGUARD_TAN_HK","bipod_03_F_blk","bipod_02_F_blk","bipod_01_F_blk","bipod_02_F_hex","bipod_01_F_khk","bipod_01_F_mtp","bipod_03_F_oli","bipod_01_F_snd","bipod_02_F_tan","rhs_acc_harris_swivel","CUP_bipod_VLTOR_Modpod","rhsusf_acc_saw_bipod","CUP_bipod_G3","CUP_bipod_G3SG1","rhsusf_acc_harris_bipod","rhsusf_acc_harris_swivel","rhs_acc_grip_ffg2","rhs_acc_grip_rk2","rhs_acc_grip_rk6","rhsusf_acc_grip1","rhsusf_acc_grip2","rhsusf_acc_grip2_tan","rhsusf_acc_grip2_wd","rhsusf_acc_grip3","rhsusf_acc_grip3_tan","rhsusf_acc_grip4","rhsusf_acc_rvg_blk","rhsusf_acc_rvg_de","rhsusf_acc_tdstubby_blk","rhsusf_acc_tdstubby_tan","SMA_Gripod_01","UK3CB_underbarrel_acc_fgrip_bipod","rhs_1PN138","CUP_NVG_PVS14","rhsusf_ANPVS_15","CUP_NVG_PVS15_black","CUP_NVG_PVS15_green","CUP_NVG_PVS15_tan","CUP_NVG_PVS15_winter","CUP_NVG_PVS7","O_NVGoggles_ghex_F","O_NVGoggles_hex_F","O_NVGoggles_urb_F","CUP_NVG_GPNVG_black","CUP_NVG_GPNVG_green","CUP_NVG_GPNVG_tan","CUP_NVG_GPNVG_winter","UK3CB_BAF_HMNVS","CUP_NVG_HMNVS","ACE_NVG_Gen1","ACE_NVG_Gen2","NVGoggles_OPFOR","NVGoggles","NVGoggles_INDEP","ACE_NVG_Gen4","NVGoggles_tna_F","ACE_NVG_Wide","rhsusf_bino_leopold_mk4","rhsusf_bino_m24","rhsusf_bino_m24_ARD","ACE_MX2A","rhssaf_zrak_rd7j","rhsusf_bino_lerca_1200_black","rhsusf_bino_lerca_1200_tan","rhs_pdu4","Rangefinder","ACE_VectorDay","ACE_Vector","rhsusf_bino_lrf_Vector21","ACE_Yardage450","UK3CB_BAF_Soflam_Laserdesignator","Laserdesignator_02_ghex_F","Laserdesignator_02","Laserdesignator_01_khk_F","Laserdesignator_03","Laserdesignator","CUP_LRTV","rhs_mag_an_m14_th3","rhssaf_mag_br_m75","rhssaf_mag_br_m84","rhs_mag_f1","rhs_mag_m67","rhs_mag_rgd5","rhs_mag_rgn","rhs_mag_rgo","rhs_mag_an_m8hc","UK3CB_BAF_SmokeShellYellow","UK3CB_BAF_SmokeShellPurple","UK3CB_BAF_HandGrenade_Blank","UK3CB_BAF_SmokeShell","UK3CB_BAF_SmokeShellGreen","UK3CB_BAF_SmokeShellOrange","UK3CB_BAF_SmokeShellRed","UK3CB_BAF_SmokeShellBlue","rhs_mag_m18_green","rhs_mag_m18_purple","rhs_mag_m18_red","rhs_mag_m18_yellow","rhs_mag_m69","ACE_M84","Chemlight_blue","Chemlight_green","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiRed","ACE_Chemlight_HiWhite","ACE_Chemlight_HiYellow","ACE_Chemlight_IR","ACE_Chemlight_Orange","Chemlight_red","ACE_Chemlight_UltraHiOrange","ACE_Chemlight_White","Chemlight_yellow","I_IR_Grenade","O_IR_Grenade","B_IR_Grenade","ACE_HandFlare_Green","ACE_HandFlare_Red","ACE_HandFlare_White","ACE_HandFlare_Yellow","ACE_adenosine","ACE_atropine","ACE_fieldDressing","ACE_elasticBandage","ACE_quikclot","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_epinephrine","ACE_morphine","ACE_packingBandage","ACE_plasmaIV","ACE_plasmaIV_250","ACE_plasmaIV_500","ACE_salineIV","ACE_salineIV_250","ACE_salineIV_500","ACE_splint","ACE_tourniquet","ACE_RangeTable_82mm","ACE_Banana","ACE_SpraypaintBlack","ACE_SpraypaintBlue","ACE_bodyBag","ACE_CableTie","ACE_Cellphone","ACE_Chemlight_Shield","ACE_DAGR","Laserbatteries","ACE_EarPlugs","ACE_EntrenchingTool","ACE_Flashlight_MX991","ACE_SpraypaintGreen","ACE_IR_Strobe_Item","ACE_Flashlight_KSF1","ACE_Flashlight_XL50","ACE_MapTools","ACE_microDAGR","ACE_SpraypaintRed","ACE_rope12","ACE_rope15","ACE_rope18","ACE_rope27","ACE_rope36","ACE_Sandbag_empty","Money_bunch","Money_roll","Money_stack","Money","ACE_Tripod","ACE_RangeCard","ACE_Altimeter","ItemCompass","ItemGPS","ItemMap","ItemWatch","CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag","CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag_camo","CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag_hex","CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag_wdl","CUP_100Rnd_556x45_BetaCMag_hex","CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag","CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag_camo","CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag_hex","CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag_wdl","CUP_100Rnd_556x45_BetaCMag_wdl","CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag","CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag_camo","CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag_hex","CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag_wdl","CUP_100Rnd_556x45_BetaCMag","rhs_mag_100Rnd_556x45_M855_cmag","rhs_mag_100Rnd_556x45_M855_cmag_mixed","rhs_mag_100Rnd_556x45_M855A1_cmag","rhs_mag_100Rnd_556x45_M855A1_cmag_mixed","rhs_mag_100Rnd_556x45_Mk262_cmag","rhs_mag_100Rnd_556x45_Mk318_cmag","rhsusf_100Rnd_762x51_m61_ap","rhsusf_100Rnd_762x51_m62_tracer","rhsusf_100Rnd_762x51","rhsusf_100Rnd_762x51_m80a1epr","rhsusf_100Rnd_556x45_M855_soft_pouch","rhsusf_100Rnd_556x45_M855_mixed_soft_pouch","rhsusf_100Rnd_556x45_soft_pouch","rhsusf_100Rnd_556x45_mixed_soft_pouch","rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR_7BZ3","rhs_100Rnd_762x54mmR_7N13","rhs_100Rnd_762x54mmR_7N26","rhs_100Rnd_762x54mmR_green","CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M","SMA_150Rnd_762_M80A1_Mixed","SMA_150Rnd_762_M80A1_Tracer","SMA_150Rnd_762_M80A1","rhsusf_200rnd_556x45_M855_box","rhsusf_200rnd_556x45_M855_mixed_box","rhsusf_200Rnd_556x45_box","rhsusf_200rnd_556x45_mixed_box","rhsusf_200Rnd_556x45_M855_soft_pouch","rhsusf_200Rnd_556x45_M855_mixed_soft_pouch","rhsusf_200Rnd_556x45_soft_pouch","rhsusf_200Rnd_556x45_mixed_soft_pouch","rhssaf_250Rnd_762x54R","rhsgref_296Rnd_792x57_SmE_belt","rhsgref_296Rnd_792x57_SmE_notracers_belt","rhsgref_296Rnd_792x57_SmK_belt","rhsgref_296Rnd_792x57_SmK_alltracers_belt","CUP_200Rnd_TE1_Red_Tracer_556x45_M249","CUP_200Rnd_TE1_Red_Tracer_556x45_M249_Pouch","rhsusf_50Rnd_762x51_m61_ap","rhsusf_50Rnd_762x51_m62_tracer","rhsusf_50Rnd_762x51","rhsusf_50Rnd_762x51_m80a1epr","rhsgref_50Rnd_792x57_SmE_drum","rhsgref_50Rnd_792x57_SmE_notracers_drum","rhsgref_50Rnd_792x57_SmK_drum","rhsgref_50Rnd_792x57_SmK_alltracers_drum","rhs_75Rnd_762x39mm","rhs_75Rnd_762x39mm_89","rhs_75Rnd_762x39mm_tracer","CUP_6Rnd_45ACP_M","6Rnd_45ACP_Cylinder","rhsgref_10rnd_765x17_vz61","rhs_mag_9x18_12_57N181S","CUP_15Rnd_9x19_M9","rhsusf_mag_15Rnd_9x19_FMJ","rhsusf_mag_15Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_9x19_17","rhs_18rnd_9x21mm_7BT3","rhs_18rnd_9x21mm_7N28","rhs_18rnd_9x21mm_7N29","rhs_mag_9x19mm_7n21_20","rhs_mag_9x19mm_7n31_20","rhsgref_20rnd_765x17_vz61","CUP_20Rnd_46x30_MP7","CUP_30Rnd_45ACP_MAC10_M","CUP_30Rnd_45ACP_Green_Tracer_MAC10_M","CUP_30Rnd_45ACP_Yellow_Tracer_MAC10_M","CUP_40Rnd_46x30_MP7","rhs_mag_9x19mm_7n21_44","rhs_mag_9x19mm_7n31_44","6Rnd_GreenSignal_F","6Rnd_RedSignal_F","CUP_7Rnd_50AE_Deagle","rhsusf_mag_7x45acp_MHP","rhs_mag_9x18_8_57N181S","rhs_mag_762x25_8","UK3CB_BAF_9_13Rnd","UK3CB_BAF_9_15Rnd","CUP_10Rnd_9x19_Compact","CUP_12Rnd_45ACP_mk23","CUP_30Rnd_9x19_UZI","CUP_18Rnd_9x19_Phantom","CUP_32Rnd_9x19_TEC9"];
	};
	case "Secondary": {
		_availiableItems = [];
		_itemsDisc = [];
		_itemsPrice = [];
	};
};


//return
_availiableItems