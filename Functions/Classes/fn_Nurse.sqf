params ["_classificationType"];

_availiableItems = [];
_itemsDisc = [];
_itemsPrice = [];

switch (_classificationType) do {
	case "Primary": {
		_availiableItems = ["SMA_AAC_MPW_12_Black","SMA_AAC_MPW_12_Desert","SMA_AAC_MPW_12_OD","SMA_AAC_MPW_12_Tan","SMA_AAC_MPW_12_Woodland","SMA_AAC_MPW_16_Black","SMA_AAC_MPW_16_Desert","SMA_AAC_MPW_16_OD","SMA_AAC_MPW_16_Tan","SMA_AAC_MPW_16_Woodland","SMA_AAC_MPW_9_Black","SMA_AAC_MPW_9_Desert","SMA_AAC_MPW_9_OD","SMA_AAC_MPW_9_Tan","SMA_AAC_MPW_9_Woodland","SMA_ACRREM","SMA_ACRREMAFGCQB","SMA_ACRREMAFG","SMA_ACRREMMOECQB","SMA_ACRREMMOE","SMA_ACRREM_N","SMA_ACRREMAFGCQB_N","SMA_ACRREMMOECQB_N","SMA_ACRREMMOE_N","SMA_ACRREMblk","SMA_ACRREMAFGCQBblk","SMA_ACRREMAFGblk","SMA_ACRREMMOECQBblk","SMA_ACRREMMOEblk","SMA_ACRREMblk_N","SMA_ACRREMAFGCQBblk_N","SMA_ACRREMAFGblk_N","SMA_ACRREMMOECQBblk_N","SMA_ACRREMMOEblk_N","CUP_arifle_AK101","CUP_arifle_AK101_top_rail","CUP_arifle_AK101_railed","CUP_arifle_AK102","CUP_arifle_AK102_top_rail","CUP_arifle_AK102_railed","rhs_weap_ak103","rhs_weap_ak103_npz","rhs_weap_ak103_zenitco01","rhs_weap_ak103_zenitco01_b33","rhs_weap_ak103_1","rhs_weap_ak103_1_npz","rhs_weap_ak104","rhs_weap_ak104_npz","rhs_weap_ak104_zenitco01","rhs_weap_ak104_zenitco01_b33","rhs_weap_ak105","rhs_weap_ak105_npz","rhs_weap_ak105_zenitco01","rhs_weap_ak105_zenitco01_b33","CUP_arifle_AK107","CUP_arifle_AK107_top_rail","CUP_arifle_AK107_railed","CUP_arifle_AK108","CUP_arifle_AK108_top_rail","CUP_arifle_AK108_railed","CUP_arifle_AK109","CUP_arifle_AK109_top_rail","CUP_arifle_AK109_railed","arifle_AK12_F","arifle_AK12_arid_F","arifle_AK12_lush_F","rhs_weap_ak74","rhs_weap_ak74_3","rhs_weap_ak74_2","rhs_weap_ak74m","rhs_weap_ak74m_npz","rhs_weap_ak74m_camo","rhs_weap_ak74m_camo_npz","rhs_weap_ak74m_desert","rhs_weap_ak74m_desert_npz","rhs_weap_ak74m_fullplum","rhs_weap_ak74m_fullplum_npz","rhs_weap_ak74m_zenitco01","rhs_weap_ak74m_zenitco01_b33","CUP_arifle_AK74M_railed","CUP_arifle_AK74M_railed_afg","CUP_arifle_AK74M_railed_afg_desert","CUP_arifle_AK74M_railed_afg_camo","CUP_arifle_AK74M_railed_desert","CUP_arifle_AK74M_railed_camo","rhs_weap_ak74mr","rhs_weap_ak74n","rhs_weap_ak74n_npz","rhs_weap_ak74n_2","rhs_weap_ak74n_2_npz","rhs_weap_akm","rhs_weap_akm_zenitco01_b33","CUP_arifle_AKM","CUP_arifle_AKM","CUP_arifle_AKM_top_rail","CUP_arifle_AKMN_railed","CUP_arifle_AKMN_railed_afg","CUP_arifle_AKMN_railed_afg_desert","CUP_arifle_AKMN_railed_desert","rhs_weap_45th_akms","CUP_arifle_AK47","CUP_arifle_AK47_top_rail","rhs_weap_aks74","rhs_weap_aks74_2","rhs_weap_aks74n","rhs_weap_aks74n_npz","rhs_weap_aks74n_2","rhs_weap_aks74n_2_npz","CUP_arifle_AKS74U","CUP_arifle_AKS74U_top_rail","CUP_arifle_AKS74U_railed","arifle_AK12U_F","arifle_AK12U_arid_F","arifle_AK12U_lush_F","rhs_weap_asval","rhs_weap_asval_grip","rhs_weap_asval_grip_npz","rhs_weap_asval_npz","CUP_arifle_AUG_A1","SMA_AUG_A3_F","SMA_AUG_A3_KRYPT_F","SMA_AUG_A3_MCAM_F","CUP_arifle_CZ805_A1","CUP_arifle_CZ805_A1_blk","CUP_arifle_CZ805_A1_coyote","CUP_arifle_CZ805_A2","CUP_arifle_CZ805_A2_blk","CUP_arifle_CZ805_A2_coyote","CUP_arifle_CZ805_B","CUP_CZ_BREN2_762_14","CUP_CZ_BREN2_762_8","CUP_CZ_BREN2_556_11","CUP_CZ_BREN2_556_14","CUP_CZ_BREN2_556_8","arifle_Mk20_plain_F","arifle_Mk20_F","arifle_Mk20C_plain_F","arifle_Mk20C_F","CUP_arifle_FNFAL5061_railed","CUP_arifle_FNFAL5062_railed","CUP_arifle_FNFAL5061_wooden_railed","CUP_arifle_FNFAL5061_wooden_railed","CUP_arifle_FNFAL_OSW_railed","CUP_Famas_F1_Rail","CUP_Famas_F1_Rail_Arid","CUP_Famas_F1_Rail_Wood","CUP_arifle_Gewehr1_railed","CUP_arifle_G36A_RIS","CUP_arifle_G36A_RIS_camo","CUP_arifle_G36A_RIS_wdl","CUP_arifle_G36C","CUP_arifle_G36C_camo","CUP_arifle_G36C_VFG","CUP_arifle_G36C_VFG_camo","CUP_arifle_G36C_VFG_hex","CUP_arifle_G36C_VFG_wdl","CUP_arifle_G36C_hex","CUP_arifle_G36C_wdl","CUP_arifle_G36K_KSK","CUP_arifle_G36K_KSK_camo","CUP_arifle_G36K_KSK_VFG","CUP_arifle_G36K_KSK_VFG_camo","CUP_arifle_G36K_KSK_VFG_hex","CUP_arifle_G36K_KSK_hex","CUP_arifle_G3A3_ris","CUP_arifle_G3A3_ris_black","CUP_arifle_G3A3_ris_vfg","CUP_arifle_G3A3_ris_vfg_black","CUP_arifle_G3A3_modern_ris","CUP_arifle_G3A3_modern_ris_black","UK3CB_G3KA4","UK3CB_HK33KA2_RIS","CUP_arifle_HK416_Black","CUP_arifle_HK416_Desert","CUP_arifle_HK416_Wood","CUP_arifle_HK416_CQB_Black","CUP_arifle_HK416_CQB_Desert","CUP_arifle_HK416_CQB_Wood","CUP_arifle_HK417_12","CUP_arifle_HK417_12_Desert","CUP_arifle_HK417_12_Wood","rhs_weap_kar98k","UK3CB_BAF_L22","CUP_arifle_L85A2","CUP_arifle_L85A2_G","CUP_arifle_L85A2_NG","CUP_srifle_LeeEnfield","CUP_srifle_LeeEnfield_rail","rhs_weap_m1garand_sa43","rhs_weap_m14","rhs_weap_m14_d","rhs_weap_m14_fiberglass","rhs_weap_m14_rail","rhs_weap_m14_rail_d","rhs_weap_m14_rail_fiberglass","rhs_weap_m14_rail_wd","rhs_weap_m14_wd","rhs_weap_m16a4","rhs_weap_m16a4_carryhandle","rhs_weap_m21a","rhs_weap_m21a_pr","rhs_weap_m21s","rhs_weap_m21s_pr","rhs_weap_m27iar","rhs_weap_m27iar_grip","rhs_weap_m4","rhs_weap_m4_carryhandle","rhs_weap_m4_carryhandle_mstock","rhs_weap_m4_mstock","CUP_arifle_SBR_od","CUP_arifle_SBR_black","rhs_weap_m4a1_carryhandle","rhs_weap_m4a1_carryhandle_mstock","rhs_weap_m4a1_blockII","rhs_weap_m4a1_blockII_bk","rhs_weap_m4a1_blockII_KAC_bk","rhs_weap_m4a1_blockII_d","rhs_weap_m4a1_blockII_KAC_d","rhs_weap_m4a1_blockII_KAC","rhs_weap_m4a1_blockII_wd","rhs_weap_m4a1_blockII_KAC_wd","rhs_weap_m4a1","rhs_weap_m4a1_d","rhs_weap_m4a1_d_mstock","rhs_weap_m4a1_mstock","rhs_weap_m4a1_wd","rhs_weap_m4a1_wd_mstock","rhs_weap_m70ab2","rhs_weap_m70b1","rhs_weap_m70b1n","rhs_weap_m70b3n","rhs_weap_m92","SMA_ACR","SMA_ACRblk","SMA_ACRMOE_Blk","SMA_ACRMOE","CUP_arifle_Mk16_CQC","CUP_arifle_Mk16_CQC_AFG","CUP_arifle_Mk16_CQC_AFG_black","CUP_arifle_Mk16_CQC_AFG_woodland","CUP_arifle_Mk16_CQC_black","CUP_arifle_Mk16_CQC_FG","CUP_arifle_Mk16_CQC_FG_black","CUP_arifle_Mk16_CQC_FG_woodland","CUP_arifle_Mk16_CQC_woodland","CUP_arifle_Mk16_STD","CUP_arifle_Mk16_STD_AFG","CUP_arifle_Mk16_STD_AFG_black","CUP_arifle_Mk16_STD_AFG_woodland","CUP_arifle_Mk16_STD_black","CUP_arifle_Mk16_STD_FG","CUP_arifle_Mk16_STD_FG_black","CUP_arifle_Mk16_STD_FG_woodland","CUP_arifle_Mk16_STD_woodland","CUP_arifle_Mk17_CQC","CUP_arifle_Mk17_CQC_Black","CUP_arifle_Mk17_CQC_FG","CUP_arifle_Mk17_CQC_FG_black","CUP_arifle_Mk17_CQC_FG_woodland","CUP_arifle_Mk17_CQC_woodland","CUP_arifle_Mk17_STD","CUP_arifle_Mk17_STD_black","CUP_arifle_Mk17_STD_FG","CUP_arifle_Mk17_STD_FG_black","CUP_arifle_Mk17_STD_FG_woodland","CUP_arifle_Mk17_STD_woodland","SMA_MK18afgTANBLK","SMA_MK18MOEBLKTAN","SMA_MK18afgBLK","SMA_MK18MOEBLK","SMA_MK18afgODBLK","SMA_MK18MOEODBLK","SMA_MK18afgOD","SMA_MK18MOEOD","SMA_MK18afgTANBLK_SM","SMA_MK18MOEBLKTAN_SM","SMA_MK18afgBLK_SM","SMA_MK18MOEBLK_SM","SMA_MK18afgODBLK_SM","SMA_MK18MOEODBLK_SM","SMA_MK18afgOD_SM","SMA_MK18MOEOD_SM","SMA_MK18afgTAN_SM","SMA_MK18MOETAN_SM","SMA_MK18afg_SM","SMA_MK18MOE_SM","SMA_MK18afgTAN","SMA_MK18MOETAN","SMA_MK18afg","SMA_MK18MOE","rhs_weap_m38","rhs_weap_m38_rail","rhs_weap_mosin_sbr","rhs_weap_MP44","SMA_STG_E4_F","SMA_STG_E4_BLACK_F","SMA_STG_E4_OD_F","CUP_arifle_OTS14_GROZA_762_Grip","CUP_arifle_OTS14_GROZA_762","CUP_arifle_OTS14_GROZA_Grip","CUP_arifle_OTS14_GROZA","rhs_weap_pm63","rhs_weap_savz58p","rhs_weap_savz58p_black","rhs_weap_savz58p_rail_black","rhs_weap_savz58p_rail","rhs_weap_savz58v","rhs_weap_savz58v_black","rhs_weap_savz58v_rail_black","rhs_weap_savz58v_rail","rhs_weap_savz58v_ris","CUP_arifle_Sa58RIS2","CUP_arifle_Sa58RIS2_camo","CUP_arifle_Sa58RIS2_woodland","CUP_arifle_DSA_SA58","CUP_arifle_DSA_SA58_OSW","CUP_arifle_DSA_SA58_OSW_Desert","CUP_arifle_DSA_SA58_OSW_VFG","CUP_arifle_DSA_SA58_OSW_VFG_Desert","CUP_arifle_DSA_SA58_OSW_VFG_Sand","CUP_arifle_DSA_SA58_OSW_VFG_Woodland","CUP_arifle_DSA_SA58_OSW_Sand","CUP_arifle_DSA_SA58_OSW_Woodland","SMA_SAR21_F","SMA_SAR21_AFG_F","SMA_SAR21MMS_F","SMA_SAR21MMS_AFG_F","SMA_SKS_F","SMA_SKS_TAN_F","SMA_Steyr_AUG_F","SMA_Steyr_AUG_BLACK_F","SMA_CTAR_F","SMA_CTARBLK_F","SMA_CTAROD_F","rhs_weap_vhsd2","rhs_weap_vhsd2_ct15x","rhs_weap_vhsk2","CUP_smg_bizon","UK3CB_BAF_L91A1","UK3CB_BAF_L92A1","rhs_weap_m3a1","rhs_weap_m3a1_specops","rhs_weap_scorpion","CUP_smg_MP5A5","SMG_05_F","CUP_smg_MP5SD6","rhsusf_weap_MP7A2","rhsusf_weap_MP7A2_aor1","rhsusf_weap_MP7A2_desert","rhsusf_weap_MP7A2_winter","CUP_smg_p90_olive","CUP_smg_p90_black","rhs_weap_pp2000","CUP_smg_PS90_olive","rhs_weap_savz61","SMG_01_F","CUP_smg_EVO","CUP_hgun_Mac10","CUP_smg_MP7","CUP_smg_MP7_desert","CUP_smg_MP7_woodland","CUP_smg_vityaz","CUP_smg_vityaz_vfg","CUP_smg_vityaz_vfg_front_rail","CUP_smg_vityaz_top_rail","CUP_smg_vityaz_vfg_top_rail","CUP_arifle_SR3M_Vikhr","CUP_arifle_SR3M_Vikhr_VFG","CUP_arifle_SR3M_Vikhr_top_rail","CUP_arifle_SR3M_Vikhr_VFG_top_rail","CUP_sgun_AA12","rhs_weap_Izh18","sgun_HunterShotgun_01_F","sgun_HunterShotgun_01_sawedoff_F","UK3CB_BAF_L128A1","CUP_sgun_M1014_Entry","rhs_weap_M590_8RD","rhs_weap_M590_5RD","CUP_sgun_Saiga12K","CUP_sgun_M1014_vfg","CUP_sgun_M1014_Entry_vfg","CUP_sgun_Saiga12K_top_rail","CUP_sgun_CZ584_RIS","CUP_hgun_BallisticShield_Armed","rhs_weap_6p53","rhs_weap_pb_6p9","hgun_Pistol_heavy_02_F","CUP_hgun_Compact","CUP_hgun_Phantom","CUP_hgun_Deagle","CUP_hgun_Glock17","CUP_hgun_Glock17_blk","CUP_hgun_Glock17_tan","UK3CB_BAF_L105A1","UK3CB_BAF_L105A2","UK3CB_BAF_L107A1","UK3CB_BAF_L117A2","UK3CB_BAF_L131A1","UK3CB_BAF_L9A1","rhsusf_weap_m1911a1","rhsusf_weap_m9","CUP_hgun_Mk23","rhs_weap_pya","rhs_weap_makarov_pm","hgun_Pistol_Signal_F","CUP_hgun_TaurusTracker455","rhs_weap_tt33","rhs_weap_type94_new","rhs_weap_savz61_folded","rhs_weap_pp2000_folded","CUP_hgun_Mac10","CUP_hgun_MicroUzi","CUP_hgun_MP7","CUP_hgun_MP7_desert","CUP_hgun_MP7_woodland","rhs_weap_rsp30_white","rhs_weap_rsp30_green","rhs_weap_rsp30_red","rhs_weap_M136","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","UK3CB_BAF_NLAW_Launcher","rhs_weap_m80","rhs_weap_rpg26","rhs_weap_rpg75","CUP_launch_RPG18","rhs_weap_rshg2","UK3CB_BAF_Javelin_Slung_Tube","rhs_acc_6p9_suppressor","SMA_AAC_762_sdn6","SMA_AAC_762_sdn6_d","SMA_AAC_762_sdn6_G","SMA_AAC_762_sdn6_T","SMA_AAC_762_sdn6_w","rhsgref_sdn6_suppressor","rhs_acc_dtk4short","rhs_acc_dtk4long","CUP_muzzle_snds_FAMAS_Arid","CUP_muzzle_snds_FAMAS","CUP_muzzle_snds_FAMAS_Wood","CUP_muzzle_snds_G36_black","CUP_muzzle_snds_G36_desert","SMA_supp_762","SMA_supptan_762","SMA_supp2BW_556","SMA_supp2BOD_556","SMA_supp2BT_556","SMA_supp2T_556","SMA_supp2TB_556","SMA_supp2TWH_556","SMA_supp2TOD_556","SMA_supp2b_556","SMA_supp2btan_556","sma_gemtech_one_blk","sma_gemtech_one_des","sma_gemtech_one_wdl","CUP_muzzle_snds_mk23","CUP_muzzle_snds_KZRZP_PK","CUP_muzzle_snds_KZRZP_PK_desert","CUP_muzzle_snds_KZRZP_PK_woodland","CUP_muzzle_snds_M110_black","CUP_muzzle_snds_M110","CUP_muzzle_snds_M110_woodland","rhsusf_acc_m24_silencer_black","rhsusf_acc_m24_silencer_d","rhsusf_acc_m24_silencer_wd","CUP_muzzle_mfsup_Suppressor_Mac10","CUP_muzzle_snds_Mk12","rhsusf_acc_nt4_black","rhsusf_acc_nt4_tan","CUP_muzzle_snds_groza","rhs_acc_pbs1","rhs_acc_pbs4","SMA_supp1BB_556","SMA_supp1Bwht_556","SMA_supp1BOD_556","SMA_supp1BT_556","SMA_supp1TT_556","SMA_supp1TB_556","SMA_supp1TW_556","SMA_supp1TOD_556","SMA_supp1b_556","SMA_supp1tan_556","SMA_rotex_blk","SMA_rotex_gry","SMA_rotex_tan","rhsusf_acc_rotex5_grey","rhsusf_acc_rotex5_tan","rhsusf_acc_rotex_mp7_aor1","rhsusf_acc_rotex_mp7","rhsusf_acc_rotex_mp7_desert","rhsusf_acc_rotex_mp7_winter","CUP_muzzle_snds_MicroUzi","CUP_muzzle_snds_SR3M","rhsusf_acc_omega9k","SMA_Silencer_556","SMA_Silencer_556_Bronze","SMA_Silencer_556_Silver","SMA_supp2smaB_556","SMA_supp2smaT_556","muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand","muzzle_snds_acp","CUP_muzzle_snds_MP7","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F","muzzle_snds_M","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F","muzzle_snds_B","muzzle_snds_h_mg","muzzle_snds_h_mg_blk_f","muzzle_snds_h_mg_khk_f","rhsusf_acc_SR25S","rhsusf_acc_SR25S_d","rhsusf_acc_SR25S_wd","UK3CB_BAF_Silencer_L105A1","UK3CB_BAF_Silencer_L110","UK3CB_BAF_Silencer_L115A3","UK3CB_BAF_Silencer_L85","UK3CB_BAF_Silencer_L91A1","rhs_acc_tgpa","rhs_acc_tgpv","rhs_acc_tgpv2","rhsusf_acc_M2010S","rhsusf_acc_M2010S_d","rhsusf_acc_M2010S_sa","rhsusf_acc_M2010S_wd","rhs_acc_uuk","rhsusf_acc_ARDEC_M240","rhs_acc_ak5","rhs_acc_dtk","rhs_acc_dtk1983","rhs_acc_dtk1","rhs_acc_dtk1p","rhs_acc_dtk2","rhs_acc_dtk3","CUP_muzzle_mfsup_Flashhider_PK_Black","CUP_muzzle_mfsup_Flashhider_PK_OD","CUP_muzzle_mfsup_Flashhider_PK_Tan","ACE_muzzle_mzls_338","ACE_muzzle_mzls_smg_01","ACE_muzzle_mzls_L","ACE_muzzle_mzls_B","ACE_muzzle_mzls_smg_02","rhsusf_acc_m24_muzzlehider_black","rhsusf_acc_m24_muzzlehider_d","rhsusf_acc_m24_muzzlehider_wd","SMA_FLASHHIDER1","SMA_FLASHHIDER2","rhs_acc_pgs64","rhsusf_acc_SF3P556","rhsusf_acc_SFMB556","CUP_acc_sffh","rhsgref_acc_zendl","rhs_acc_1p29","rhs_acc_1p63","rhs_acc_rakursPM","rhs_acc_1p78","rhs_acc_1p87","rhs_acc_1pn34","rhs_acc_1pn93_1","CUP_optic_MicroT1","CUP_optic_MicroT1_coyote","CUP_optic_MicroT1_low","CUP_optic_MicroT1_low_coyote","CUP_optic_MicroT1_low_OD","CUP_optic_MicroT1_OD","CUP_optic_AN_PAS_13c1","rhsusf_acc_anpas13gv1","rhsusf_acc_ACOG2_USMC","rhsusf_acc_ACOG3_USMC","rhsusf_acc_ACOG_USMC","rhsusf_acc_anpvs27","optic_Yorris","optic_ACO_grn","optic_Aco","optic_ACO_grn_smg","optic_Aco_smg","rhs_acc_ekp1","rhs_acc_ekp8_02","rhs_acc_ekp8_18","SMA_ELCAN_SPECTER","SMA_ELCAN_SPECTER_RDS","SMA_ELCAN_SPECTER_ARDRDS","SMA_ELCAN_SPECTER_GREEN","SMA_ELCAN_SPECTER_GREEN_RDS","SMA_ELCAN_SPECTER_GREEN_ARDRDS","SMA_ELCAN_SPECTER_TAN","SMA_ELCAN_SPECTER_TAN_RDS","SMA_ELCAN_SPECTER_TAN_ARDRDS","SMA_eotech552","SMA_eotech552_3XDOWN","SMA_eotech552_3XDOWN_des","SMA_eotech552_3XDOWN_wdl","SMA_eotech552_kf","SMA_eotech552_kf_des","SMA_eotech552_kf_wdl","SMA_eotech","SMA_eotechG33_3XDOWN","SMA_eotechG33_grn_3XDOWN","SMA_eotechG33_tan_3XDOWN","SMA_eotech_G","SMA_eotech_T","optic_MRCO","optic_Hamr","optic_Hamr_khk_F","rhsusf_acc_ACOG","rhsusf_acc_ACOG2","rhsusf_acc_ACOG3","rhsusf_acc_eotech_552","rhsusf_acc_eotech_552_d","rhsusf_acc_eotech_552_wd","rhsusf_acc_compm4","CUP_optic_MARS","CUP_optic_MARS_OD","CUP_optic_MARS_tan","CUP_optic_AIMM_MARS_BLK","CUP_optic_AIMM_MARS_TAN","CUP_optic_AIMM_MARS_OD","rhsgref_mg42_acc_AAsight","SMA_MICRO_T2","SMA_MICRO_T2_3XDOWN","SMA_MICRO_T2_LM","rhsusf_acc_mrds","rhsusf_acc_mrds_fwd","rhsusf_acc_mrds_c","rhsusf_acc_mrds_fwd_c","rhs_acc_nita","rhs_acc_okp7_dovetail","rhs_acc_okp7_picatinny","rhs_acc_pkas","rhs_acc_pso1m2","rhs_acc_pso1m21","rhs_acc_npz","rhsusf_acc_RM05","rhsusf_acc_RM05_fwd","RKSL_optic_RMR_HG","RKSL_optic_RMR_HG_FDE","RKSL_optic_RMR_MS19","RKSL_optic_RMR_MS19_FDE","RKSL_optic_RMR_RM33","RKSL_optic_RMR_RM33_FDE","rhsusf_acc_RX01_NoFilter","rhsusf_acc_RX01","rhsusf_acc_RX01_NoFilter_tan","rhsusf_acc_RX01_tan","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","SMA_BARSKA","SMA_CMORE","SMA_CMOREGRN","SMA_AIMPOINT","SMA_AIMPOINT_GLARE","rhsusf_acc_ACOG_d","rhsusf_acc_ACOG_sa","rhsusf_acc_ACOG_wd","rhsusf_acc_ACOG_RMR","sma_spitfire_01_black","sma_spitfire_01_sc_black","sma_spitfire_03_black","sma_spitfire_03_sc_black","sma_spitfire_03_rds_black","sma_spitfire_03_rds_low_ard_black","sma_spitfire_03_rds_low_black","CUP_optic_ZeissZPoint","CUP_optic_ZeissZPoint_desert","CUP_optic_ZeissZPoint_hex","CUP_optic_ZeissZPoint_wood","optic_dms","optic_DMS_ghex_F","CUP_optic_GOSHAWK","CUP_optic_GOSHAWK_RIS","UK3CB_BAF_Kite","RKSL_optic_LDS","RKSL_optic_LDS_C","UK3CB_BAF_SpecterLDS","rhsusf_acc_ELCAN","rhsusf_acc_ELCAN_ard","rhsusf_acc_ACOG_anpvs27","CUP_optic_PSO_1_1","CUP_optic_PSO_1_1_open","rhsusf_acc_su230","rhsusf_acc_su230_c","rhsusf_acc_su230_mrds","rhsusf_acc_su230_mrds_c","UK3CB_BAF_SUIT","UK3CB_BAF_SUSAT","CUP_optic_ACOG_TA01B_Black_3D","CUP_optic_ACOG_TA01B_Coyote_3D","CUP_optic_ACOG_TA01B_OD_3D","CUP_optic_ACOG_TA01B_RMR_Black_3D","CUP_optic_ACOG_TA01B_RMR_Coyote_3D","CUP_optic_ACOG_TA01B_RMR_OD_3D","CUP_optic_ACOG_TA01B_RMR_Tan_3D","CUP_optic_ACOG_TA01B_RMR_Tropic_3D","CUP_optic_ACOG_TA01B_Tan_3D","CUP_optic_ACOG_TA01B_Tropic_3D","rhs_acc_2dpZenit","rhs_acc_2dpZenit_ris","CUP_acc_CZ_M3X","rhsusf_acc_M952V","acc_flashlight_pistol","SMA_SFLIGHT_TOPM4","SMA_SFFL_BLK","SMA_SFFL_TAN","acc_flashlight","rhsusf_acc_wmx","rhsusf_acc_wmx_bk","rhsusf_acc_anpeq15side","SMA_ANPEQ15_TOP_TAN_ACR","SMA_ANPEQ15_TOP_TAN_M4","SMA_ANPEQ15_TOP_TAN_MK18","SMA_ANPEQ15_TOP_TAN_SCAR","rhsusf_acc_anpeq15_top","rhsusf_acc_anpeq15side_bk","rhsusf_acc_anpeq15_bk_top","rhsusf_acc_anpeq15A","SMA_ANPEQ15_TAN","SMA_ANPEQ15_TOP_417TAN","SMA_ANPEQ15_BLK","SMA_ANPEQ15_TOP_417BLK","rhs_acc_perst1ik","rhs_acc_perst1ik_ris","rhs_acc_perst3","rhs_acc_perst3_top","rhsusf_acc_anpeq15_wmx","rhsusf_acc_anpeq15_wmx_light","SMA_ANPEQ15_TOP_BLK_M4","SMA_ANPEQ15_TOP_BLK_MK18","SMA_ANPEQ15_TOP_BLK_SCAR","SMA_ANPEQ15_TOP_BLK_ACR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15_light","rhsusf_acc_anpeq15_bk","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq16a","rhsusf_acc_anpeq16a_light","rhsusf_acc_anpeq16a_top","rhsusf_acc_anpeq16a_light_top","SMA_SFPEQ_AUGCQC_BLK","SMA_SFPEQ_ACRTOP_BLK","SMA_SFPEQ_M4TOP_BLK","SMA_SFPEQ_HK417TOP_BLK","SMA_SFPEQ_MK18TOP_BLK","SMA_SFPEQ_SCARTOP_BLK","SMA_SFPEQ_AUGCQC_TAN","SMA_SFPEQ_M4TOP_TAN","SMA_SFPEQ_HK417TOP_TAN","SMA_SFPEQ_MK18TOP_TAN","SMA_SFPEQ_SCARTOP_TAN","ACE_acc_pointer_green","acc_pointer_IR","UK3CB_BAF_LLM_Flashlight_Black","UK3CB_BAF_LLM_Flashlight_Tan","rhs_acc_perst3_2dp","rhs_acc_perst3_2dp_light","UK3CB_BAF_L105A1_LLM_FL_G","CUP_acc_LLM01_L","CUP_acc_LLM01_coyote_L","CUP_acc_LLM01_desert_L","CUP_acc_LLM01_hex_L","CUP_acc_LLM01_od_L","CUP_acc_mk23_lam_f","SMA_RAILGUARD_BLK_HK","SMA_RAILGUARD_OD_HK","SMA_RAILGUARD_TAN_HK","bipod_03_F_blk","bipod_02_F_blk","bipod_01_F_blk","bipod_02_F_hex","bipod_01_F_khk","bipod_01_F_mtp","bipod_03_F_oli","bipod_01_F_snd","bipod_02_F_tan","rhs_acc_harris_swivel","CUP_bipod_VLTOR_Modpod","rhsusf_acc_saw_bipod","CUP_bipod_G3","CUP_bipod_G3SG1","rhsusf_acc_harris_bipod","rhsusf_acc_harris_swivel","rhs_acc_grip_ffg2","rhs_acc_grip_rk2","rhs_acc_grip_rk6","rhsusf_acc_grip1","rhsusf_acc_grip2","rhsusf_acc_grip2_tan","rhsusf_acc_grip2_wd","rhsusf_acc_grip3","rhsusf_acc_grip3_tan","rhsusf_acc_grip4","rhsusf_acc_rvg_blk","rhsusf_acc_rvg_de","rhsusf_acc_tdstubby_blk","rhsusf_acc_tdstubby_tan","SMA_Gripod_01","UK3CB_underbarrel_acc_fgrip_bipod","rhs_1PN138","CUP_NVG_PVS14","rhsusf_ANPVS_15","CUP_NVG_PVS15_black","CUP_NVG_PVS15_green","CUP_NVG_PVS15_tan","CUP_NVG_PVS15_winter","CUP_NVG_PVS7","O_NVGoggles_ghex_F","O_NVGoggles_hex_F","O_NVGoggles_urb_F","CUP_NVG_GPNVG_black","CUP_NVG_GPNVG_green","CUP_NVG_GPNVG_tan","CUP_NVG_GPNVG_winter","UK3CB_BAF_HMNVS","CUP_NVG_HMNVS","ACE_NVG_Gen1","ACE_NVG_Gen2","NVGoggles_OPFOR","NVGoggles","NVGoggles_INDEP","ACE_NVG_Gen4","NVGoggles_tna_F","ACE_NVG_Wide","rhsusf_bino_leopold_mk4","rhsusf_bino_m24","rhsusf_bino_m24_ARD","ACE_MX2A","rhssaf_zrak_rd7j","rhsusf_bino_lerca_1200_black","rhsusf_bino_lerca_1200_tan","rhs_pdu4","Rangefinder","ACE_VectorDay","ACE_Vector","rhsusf_bino_lrf_Vector21","ACE_Yardage450","UK3CB_BAF_Soflam_Laserdesignator","Laserdesignator_02_ghex_F","Laserdesignator_02","Laserdesignator_01_khk_F","Laserdesignator_03","Laserdesignator","CUP_LRTV","rhs_mag_an_m14_th3","rhssaf_mag_br_m75","rhssaf_mag_br_m84","rhs_mag_f1","rhs_mag_m67","rhs_mag_rgd5","rhs_mag_rgn","rhs_mag_rgo","rhs_mag_an_m8hc","UK3CB_BAF_SmokeShellYellow","UK3CB_BAF_SmokeShellPurple","UK3CB_BAF_HandGrenade_Blank","UK3CB_BAF_SmokeShell","UK3CB_BAF_SmokeShellGreen","UK3CB_BAF_SmokeShellOrange","UK3CB_BAF_SmokeShellRed","UK3CB_BAF_SmokeShellBlue","rhs_mag_m18_green","rhs_mag_m18_purple","rhs_mag_m18_red","rhs_mag_m18_yellow","rhs_mag_m69","ACE_M84","Chemlight_blue","Chemlight_green","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiRed","ACE_Chemlight_HiWhite","ACE_Chemlight_HiYellow","ACE_Chemlight_IR","ACE_Chemlight_Orange","Chemlight_red","ACE_Chemlight_UltraHiOrange","ACE_Chemlight_White","Chemlight_yellow","I_IR_Grenade","O_IR_Grenade","B_IR_Grenade","ACE_HandFlare_Green","ACE_HandFlare_Red","ACE_HandFlare_White","ACE_HandFlare_Yellow","ACE_adenosine","ACE_atropine","ACE_fieldDressing","ACE_elasticBandage","ACE_quikclot","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_epinephrine","ACE_morphine","ACE_packingBandage","ACE_plasmaIV","ACE_plasmaIV_250","ACE_plasmaIV_500","ACE_salineIV","ACE_salineIV_250","ACE_salineIV_500","ACE_tourniquet","ACE_Altimeter","ItemCompass","ItemGPS","ItemMap","ItemWatch","ACE_surgicalKit","ACE_RangeTable_82mm","ACE_Banana","ACE_SpraypaintBlack","ACE_SpraypaintBlue","ACE_bodyBag","ACE_CableTie","ACE_Cellphone","ACE_Chemlight_Shield","ACE_DAGR","Laserbatteries","ACE_EarPlugs","ACE_EntrenchingTool","ACE_Flashlight_MX991","ACE_SpraypaintGreen","ACE_IR_Strobe_Item","ACE_Flashlight_KSF1","ACE_Flashlight_XL50","ACE_MapTools","ACE_microDAGR","ACE_SpraypaintRed","ACE_rope12","ACE_rope15","ACE_rope18","ACE_rope27","ACE_rope36","ACE_Sandbag_empty","Money_bunch","Money_roll","Money_stack","Money","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow","rhs_10Rnd_762x39mm","rhs_10Rnd_762x39mm_89","rhs_10Rnd_762x39mm_tracer","rhs_10Rnd_762x39mm_U","rhs_10rnd_9x39mm_SP5","rhs_10rnd_9x39mm_SP6","rhsgref_10rnd_765x17_vz61","2Rnd_12Gauge_Pellets","2Rnd_12Gauge_Slug","UK3CB_BAF_12G_Pellets","UK3CB_BAF_12G_Slugs","CUP_20Rnd_B_Saiga12_74Pellets_M","CUP_20Rnd_B_Saiga12_74Slug_M","rhsgref_1Rnd_00Buck","rhsgref_1Rnd_Slug","CUP_1Rnd_762x51_CZ584","CUP_1Rnd_B_CZ584_74Pellets","CUP_1Rnd_B_CZ584_74Slug","UK3CB_G3_50rnd_762x51_GT","UK3CB_G3_50rnd_762x51_RT","UK3CB_G3_50rnd_762x51_WT","UK3CB_G3_50rnd_762x51","rhsgref_20rnd_1143x23_M1T_SMG","rhsgref_20rnd_1143x23_M1911B_SMG","CUP_20Rnd_762x51_FNFAL_Desert_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_Desert_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_Woodland_M","CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M","CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_Desert_M","CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_Woodland_M","CUP_20Rnd_762x51_FNFAL_Woodland_M","CUP_20Rnd_TE1_Yellow_Tracer_762x51_FNFAL_M","CUP_20Rnd_TE1_Yellow_Tracer_762x51_FNFAL_Desert_M","CUP_20Rnd_TE1_Yellow_Tracer_762x51_FNFAL_Woodland_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_G3","CUP_20Rnd_TE1_Red_Tracer_762x51_G3","CUP_20Rnd_TE1_Yellow_Tracer_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_HK417_Camo_Desert","CUP_20Rnd_TE1_Green_Tracer_762x51_HK417","CUP_20Rnd_TE1_Red_Tracer_762x51_HK417","CUP_20Rnd_762x51_HK417_Camo_Wood","CUP_20Rnd_TE1_Yellow_Tracer_762x51_HK417","CUP_20Rnd_762x51_HK417","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_wdl","CUP_20Rnd_762x51_B_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_wdl","CUP_20Rnd_762x51_B_SCAR_wdl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_wdl","CUP_20Rnd_9x39_SP5_GROZA_M","rhs_20rnd_9x39mm_SP5","rhs_20rnd_9x39mm_SP6","rhsusf_20Rnd_762x51_m118_special_Mag","rhsusf_20Rnd_762x51_m62_Mag","rhsusf_20Rnd_762x51_m993_Mag","rhs_mag_9x19mm_7n21_20","rhs_mag_9x19mm_7n31_20","rhsgref_20rnd_765x17_vz61","CUP_20Rnd_B_AA12_Pellets","CUP_20Rnd_B_AA12_74Slug","CUP_20Rnd_46x30_MP7","rhsgref_24rnd_75x55_Stgw57","CUP_25Rnd_556x45_Famas_Arid","CUP_25Rnd_556x45_Famas_Tracer_Green","CUP_25Rnd_556x45_Famas_Arid_Tracer_Green","CUP_25Rnd_556x45_Famas_Wood_Tracer_Green","CUP_25Rnd_556x45_Famas_Tracer_Red","CUP_25Rnd_556x45_Famas_Arid_Tracer_Red","CUP_25Rnd_556x45_Famas_Wood_Tracer_Red","CUP_25Rnd_556x45_Famas_Wood","CUP_25Rnd_556x45_Famas_Tracer_Yellow","CUP_25Rnd_556x45_Famas_Arid_Tracer_Yellow","CUP_25Rnd_556x45_Famas_Wood_Tracer_Yellow","CUP_25Rnd_556x45_Famas","rhsgref_25Rnd_792x33_SmE_StG","CUP_30Rnd_45ACP_MAC10_M","CUP_30Rnd_45ACP_Green_Tracer_MAC10_M","CUP_30Rnd_45ACP_Yellow_Tracer_MAC10_M","SMA_30Rnd_762x35_BLK_EPR","rhsgref_30rnd_1143x23_M1T_SMG","rhsgref_30rnd_1143x23_M1T_2mag_SMG","rhsgref_30rnd_1143x23_M1911B_SMG","rhsgref_30rnd_1143x23_M1911B_2mag_SMG","CUP_30Rnd_556x45_AUG","CUP_30Rnd_TE1_Green_Tracer_556x45_AUG","CUP_30Rnd_TE1_Red_Tracer_556x45_AUG","CUP_30Rnd_TE1_Yellow_Tracer_556x45_AUG","CUP_30Rnd_556x45_G36_camo","CUP_30Rnd_TE1_Green_Tracer_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36_camo","CUP_30Rnd_TE1_Green_Tracer_556x45_G36_hex","CUP_30Rnd_TE1_Green_Tracer_556x45_G36_wdl","CUP_30Rnd_556x45_G36_hex","CUP_30Rnd_TE1_Red_Tracer_556x45_G36","CUP_30Rnd_TE1_Red_Tracer_556x45_G36_camo","CUP_30Rnd_TE1_Red_Tracer_556x45_G36_hex","CUP_30Rnd_TE1_Red_Tracer_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36","CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36_hex","CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36_camo","CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36_camo","CUP_30Rnd_556x45_G36","CUP_30Rnd_762x39_AKM_bakelite_desert_M","CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M","CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M","CUP_30Rnd_TE1_Green_Tracer_762x39_AKM_bakelite_desert_M","CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M","CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M","CUP_30Rnd_TE1_Red_Tracer_762x39_AKM_bakelite_desert_M","CUP_30Rnd_TE1_Green_Tracer_762x39_CZ807","CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807","CUP_30Rnd_TE1_Yellow_Tracer_762x39_CZ807","CUP_30Rnd_762x39_CZ807","CUP_30Rnd_TE1_Green_Tracer_762x51_FNFAL_M","CUP_30Rnd_TE1_Red_Tracer_762x51_FNFAL_M","CUP_30Rnd_TE1_Yellow_Tracer_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_TE1_Green_Tracer_762x51_1_SCAR","CUP_30Rnd_TE1_Green_Tracer_762x51_1_SCAR","CUP_30Rnd_TE1_Red_Tracer_762x51_1_SCAR","CUP_30Rnd_TE1_Red_Tracer_762x51_1_SCAR","CUP_30Rnd_TE1_White_Tracer_762x51_2_SCAR","CUP_30Rnd_TE1_White_Tracer_762x51_1_SCAR","CUP_30Rnd_TE1_Yellow_Tracer_762x51_2_SCAR","CUP_30Rnd_TE1_Yellow_Tracer_762x51_1_SCAR","CUP_30Rnd_762x51_2_B_SCAR","CUP_30Rnd_762x51_1_B_SCAR","rhsgref_30Rnd_792x33_SmE_StG","CUP_30Rnd_9x19AP_Vityaz","CUP_30Rnd_9x19_Vityaz","rhs_30Rnd_762x39mm_polymer","rhs_30Rnd_762x39mm_polymer_89","rhs_30Rnd_762x39mm_polymer_tracer","rhs_30Rnd_762x39mm_polymer_U","rhs_30Rnd_545x39_7N10_2mag_AK","rhs_30Rnd_545x39_7N10_2mag_camo_AK","rhs_30Rnd_545x39_7N10_2mag_desert_AK","rhs_30Rnd_545x39_7N10_2mag_plum_AK","rhs_30Rnd_545x39_7N6_AK","rhs_30Rnd_545x39_7N6M_AK","rhs_30Rnd_545x39_AK_green","rhs_30Rnd_545x39_7N10_camo_AK","rhs_30Rnd_545x39_7N22_camo_AK","rhs_30Rnd_545x39_7N10_desert_AK","rhs_30Rnd_545x39_7N22_desert_AK","rhs_30Rnd_545x39_7N6_green_AK","rhs_30Rnd_545x39_7N6M_green_AK","rhs_30Rnd_545x39_7N10_plum_AK","rhs_30Rnd_545x39_7N22_plum_AK","rhs_30Rnd_545x39_7N6M_plum_AK","rhs_30Rnd_545x39_AK_plum_green","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N22_AK","rhs_30Rnd_545x39_7U1_AK","rhs_30Rnd_762x39mm_bakelite","rhs_30Rnd_762x39mm_bakelite_89","rhs_30Rnd_762x39mm_bakelite_tracer","rhs_30Rnd_762x39mm_bakelite_U","rhs_30Rnd_762x39mm","rhs_30Rnd_762x39mm_89","rhs_30Rnd_762x39mm_tracer","rhs_30Rnd_762x39mm_U","rhs_mag_30Rnd_556x45_M855A1_EPM_Pull","rhs_mag_30Rnd_556x45_M855A1_EPM_Pull_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger","rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_EPM","rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red","rhsgref_30rnd_556x45_m21","rhsgref_30rnd_556x45_m21_t","rhssaf_30Rnd_762x39mm_M67","rhssaf_30Rnd_762x39mm_M78_tracer","rhssaf_30Rnd_762x39_M82_api","rhs_mag_30Rnd_556x45_M855_PMAG","rhs_mag_30Rnd_556x45_M855_PMAG_Tan","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan","rhs_mag_30Rnd_556x45_M855_PMAG_Tracer_Red","rhs_mag_30Rnd_556x45_M855_PMAG_Tan_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red","rhs_mag_30Rnd_556x45_Mk262_PMAG","rhs_mag_30Rnd_556x45_Mk262_PMAG_Tan","rhs_mag_30Rnd_556x45_Mk318_PMAG","rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan","rhs_30Rnd_762x39mm_Savz58","rhs_30Rnd_762x39mm_Savz58_tracer","rhs_mag_30Rnd_556x45_M855_Stanag_Pull","rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull","rhs_mag_30Rnd_556x45_M855_Stanag_Pull_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red","rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull","rhs_mag_30Rnd_556x45_Mk318_Stanag_Pull","rhs_mag_30Rnd_556x45_M855_Stanag_Ranger","rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger","rhs_mag_30Rnd_556x45_M855_Stanag_Ranger_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger_Tracer_Red","rhs_mag_30Rnd_556x45_Mk262_Stanag_Ranger","rhs_mag_30Rnd_556x45_Mk318_Stanag_Ranger","rhs_mag_30Rnd_556x45_M855_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red","rhs_mag_30Rnd_556x45_Mk262_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhsgref_30rnd_556x45_vhs2","rhsgref_30rnd_556x45_vhs2_t","CUP_30Rnd_556x45_AK","CUP_30Rnd_TE1_Green_Tracer_556x45_AK","CUP_30Rnd_TE1_Red_Tracer_556x45_AK","CUP_30Rnd_TE1_Yellow_Tracer_556x45_AK","CUP_30Rnd_9x39_SP5_VIKHR_M","SMA_30Rnd_762x35_SS","rhsusf_mag_40Rnd_46x30_AP","rhsusf_mag_40Rnd_46x30_FMJ","rhsusf_mag_40Rnd_46x30_JHP","CUP_40Rnd_46x30_MP7","rhs_mag_9x19mm_7n21_44","rhs_mag_9x19mm_7n31_44","rhs_45Rnd_545X39_7N10_AK","rhs_45Rnd_545X39_7N22_AK","rhs_45Rnd_545X39_7N6_AK","rhs_45Rnd_545X39_AK_Green","rhs_45Rnd_545X39_7U1_AK","CUP_5Rnd_762x67_G22","UK3CB_BAF_556_30Rnd","UK3CB_BAF_556_30Rnd_T","CUP_50Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_50Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_50Rnd_TE1_White_Tracer_762x51_SCAR","CUP_50Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_50Rnd_762x51_B_SCAR","CUP_50Rnd_570x28_Green_Tracer_P90_M","CUP_50Rnd_570x28_Red_Tracer_P90_M","CUP_50Rnd_570x28_Yellow_Tracer_P90_M","SMA_30Rnd_762x39_SKS_FMJ","SMA_30Rnd_762x39_SKS_FMJ_Red","rhsusf_5Rnd_00Buck","rhsusf_5Rnd_Slug","rhsgref_5Rnd_762x54_m38","rhsgref_5Rnd_792x57_kar98k","CUP_60Rnd_545x39_AK74M_M","CUP_60Rnd_TE1_Green_Tracer_545x39_AK74M_M","CUP_60Rnd_TE1_Red_Tracer_545x39_AK74M_M","CUP_60Rnd_TE1_White_Tracer_545x39_AK74M_M","CUP_60Rnd_TE1_Yellow_Tracer_545x39_AK74M_M","CUP_60Rnd_556x45_SureFire","CUP_6Rnd_B_Beneli_74Pellets","CUP_6Rnd_B_Benelli_74Slug","SMA_30Rnd_762x39_SKS_7n23_AP","SMA_30Rnd_762x39_7n23_AP_Red","rhsusf_8Rnd_00Buck","rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle","rhsgref_8Rnd_762x63_M2B_M1rifle","rhsusf_8Rnd_Slug","CUP_8Rnd_B_Beneli_74Pellets","CUP_8Rnd_B_Beneli_74Pellets","CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Saiga12_74Pellets_M","CUP_8Rnd_B_Saiga12_74Slug_M","UK3CB_BAF_9_30Rnd","CUP_64Rnd_9x19_Bizon_M","CUP_64Rnd_Green_Tracer_9x19_Bizon_M","CUP_64Rnd_Red_Tracer_9x19_Bizon_M","CUP_64Rnd_White_Tracer_9x19_Bizon_M","CUP_64Rnd_Yellow_Tracer_9x19_Bizon_M","SMA_30Rnd_68x43_BT_IR","SMA_30Rnd_68x43_BT","SMA_30Rnd_68x43_BT_Tracer","CUP_30Rnd_9x19_EVO","CUP_20Rnd_762x51_FNFAL_M","CUP_10x_303_M","SMA_20Rnd_762x51mm_M80A1_EPR_IR","SMA_20Rnd_762x51mm_M80A1_EPR","SMA_20Rnd_762x51mm_M80A1_EPR_Tracer","SMA_30Rnd_556x45_M855A1_IR","SMA_30Rnd_556x45_M855A1","SMA_30Rnd_556x45_M855A1_Tracer","SMA_30Rnd_556x45_Mk262_IR","SMA_30Rnd_556x45_Mk262","SMA_30Rnd_556x45_Mk262_Tracer","SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range_IR","SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range","SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range_Tracer","SMA_30Rnd_556x45_Mk318","SMA_30Rnd_556x45_Mk318_Tracer","SMA_30Rnd_556x45_Mk318_IR","CUP_30Rnd_9x19_MP5","CUP_30Rnd_Sa58_M","CUP_30Rnd_Sa58_M_TracerG","SMA_30Rnd_68x43_SPC_FMJ_IR","SMA_30Rnd_68x43_SPC_FMJ","SMA_30Rnd_68x43_SPC_FMJ_Tracer","SMA_30Rnd_68x43_sub_IR","SMA_30Rnd_68x43_sub","SMA_30Rnd_68x43_sub_Tracer","CUP_6Rnd_45ACP_M","6Rnd_45ACP_Cylinder","rhsgref_10rnd_765x17_vz61","rhs_mag_9x18_12_57N181S","CUP_15Rnd_9x19_M9","rhsusf_mag_15Rnd_9x19_FMJ","rhsusf_mag_15Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_9x19_17","rhs_18rnd_9x21mm_7BT3","rhs_18rnd_9x21mm_7N28","rhs_18rnd_9x21mm_7N29","rhs_mag_9x19mm_7n21_20","rhs_mag_9x19mm_7n31_20","rhsgref_20rnd_765x17_vz61","CUP_20Rnd_46x30_MP7","CUP_30Rnd_45ACP_MAC10_M","CUP_30Rnd_45ACP_Green_Tracer_MAC10_M","CUP_30Rnd_45ACP_Yellow_Tracer_MAC10_M","CUP_40Rnd_46x30_MP7","rhs_mag_9x19mm_7n21_44","rhs_mag_9x19mm_7n31_44","6Rnd_GreenSignal_F","6Rnd_RedSignal_F","rhs_mag_6x8mm_mhp","CUP_7Rnd_50AE_Deagle","rhsusf_mag_7x45acp_MHP","rhs_mag_9x18_8_57N181S","rhs_mag_762x25_8","UK3CB_BAF_9_13Rnd","UK3CB_BAF_9_15Rnd","CUP_10Rnd_9x19_Compact","CUP_12Rnd_45ACP_mk23","CUP_30Rnd_9x19_UZI","CUP_18Rnd_9x19_Phantom","CUP_32Rnd_9x19_TEC9"];
	};
	case "Secondary": {
		_availiableItems = [];
		_itemsDisc = [];
		_itemsPrice = [];
	};
};


//return
_availiableItems