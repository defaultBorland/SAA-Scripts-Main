params ["_box", "_type", "_uniformType", "_clear","_additionalInfo"];

[_box, true] call ace_arsenal_fnc_removeBox;

[_box, true] call ace_dragging_fnc_setDraggable;
[_box, true] call ace_dragging_fnc_setCarryable;

if (_clear isEqualTo 1) then {
	clearWeaponCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearBackpackCargoGlobal _box;
};

_arrayUniformArid = ["VSM_OGA_Crye_Camo","VSM_OGA_tan_casual_Camo","VSM_OGA_Camo","VSM_OGA_Camo_SS","Arid_Arid_Camo","Arid_Arid_SS_Camo","Multicam_Arid_Black_casual_Camo","Multicam_Arid_Blue_casual_Camo","Multicam_Arid_casual_Camo","dr_ARDfacp_br","dr_ARDfacp_op","dr_ARDlbt_br","dr_ARDlbt_op","dr_ARDpar_br","dr_ARDpar_op","VSM_OGA_Vest_1","VSM_OGA_Vest_2","VSM_OGA_Vest_3","Arid_Backpack_Compact","Arid_Backpack_Kitbag","UK3CB_BAF_B_Bergen_TAN_Rifleman_A","UK3CB_BAF_B_Bergen_TAN_Rifleman_B","UK3CB_BAF_B_Kitbag_TAN","VSM_OGA_Backpack_Compact","VSM_OGA_Backpack_Kitbag","UK3CB_UN_B_B_ASS","B_LegStrapBag_coyote_F","tf_anprc155_coyote","UK3CB_BAF_B_Bergen_TAN_JTAC_A","UK3CB_BAF_B_Bergen_TAN_JTAC_H_A","UK3CB_BAF_B_Bergen_TAN_SL_A","VSM_BackwardsHat_Peltor_tan","VSM_Beanie_tan","VSM_Bowman_cap_balaclava_Tan","VSM_Bowman_cap_Tan","VSM_Mich2000_OGA","VSM_Mich2000_2_OGA","VSM_OGA_Helmet1","VSM_OGA_Helmet2","VSM_oga_OPS","VSM_Tan_spray_OPS","VSM_oga_OPS_2","VSM_Tan_spray_OPS_2","VSM_FullShemagh_Tan_pattern","VSM_FullShemagh_Tan","rhsusf_ach_bare_tan","rhsusf_ach_bare_tan_ess","rhsusf_ach_bare_tan_headset","rhsusf_ach_bare_tan_headset_ess","rhs_altyn_novisor","rhs_altyn_novisor_bala","rhs_altyn_novisor_ess","rhs_altyn_novisor_ess_bala","rhs_altyn_visordown","rhs_altyn","rhs_altyn_bala","H_Booniehat_tan","H_Cap_tan","rhsusf_opscore_ut","rhsusf_opscore_ut_pelt","rhsusf_opscore_ut_pelt_cam","rhsusf_opscore_ut_pelt_nsw","rhsusf_opscore_ut_pelt_nsw_cam","rhsusf_mich_bare_tan","rhsusf_mich_bare_alt_tan","rhsusf_mich_bare_tan_headset","rhsusf_mich_bare_norotos_tan","rhsusf_mich_bare_norotos_alt_tan","rhsusf_mich_bare_norotos_alt_tan_headset","rhsusf_mich_bare_norotos_arc_tan","rhsusf_mich_bare_norotos_arc_alt_tan","rhsusf_mich_bare_norotos_arc_alt_tan_headset","rhsusf_mich_bare_norotos_tan_headset","H_ShemagOpen_tan","H_Booniehat_khk_hs","H_Booniehat_khk","VSM_balaclava_Black_Skull","VSM_balaclava_Black","VSM_balaclava_TAN_Skull","VSM_balaclava_tan","VSM_Balaclava_black_glasses","VSM_Balaclava_tan_glasses","VSM_Balaclava_black_Goggles","VSM_Balaclava_tan_Goggles","VSM_Balaclava_black_Peltor","VSM_Balaclava_tan_Peltor","VSM_Balaclava_black_Peltor_glasses","VSM_Balaclava_tan_Peltor_glasses","VSM_Balaclava_black_Peltor_Goggles","VSM_Balaclava_tan_Peltor_Goggles","VSM_balaclava2_Black","VSM_Balaclava2_black_glasses","VSM_Balaclava2_tan_glasses","VSM_Balaclava2_black_Goggles","VSM_Balaclava2_tan_Goggles","VSM_Balaclava2_black_Peltor","VSM_Balaclava2_tan_Peltor","VSM_Balaclava2_black_Peltor_glasses","VSM_Balaclava2_tan_Peltor_glasses","VSM_Balaclava2_black_Peltor_Goggles","VSM_Balaclava2_tan_Peltor_Goggles","VSM_FaceMask_black","VSM_FaceMask_Ghost","VSM_FaceMask_Ghost_tan","VSM_FaceMask_tan","VSM_Facemask_black_glasses","VSM_Facemask_tan_glasses","VSM_Facemask_black_Goggles","VSM_Facemask_tan_Goggles","VSM_Facemask_black_Peltor","VSM_Facemask_tan_Peltor","VSM_Facemask_black_Peltor_glasses","VSM_Facemask_tan_Peltor_glasses","VSM_Facemask_black_Peltor_Goggles","VSM_Facemask_tan_Peltor_Goggles","VSM_Goggles","VSM_Peltor_coyote_glasses","VSM_Shemagh_tan","VSM_Shemagh_Balaclava_tan","VSM_Shemagh_Balaclava_tan_Glasses","VSM_Shemagh_Balaclava_tan_Goggles","VSM_Shemagh_Balaclava_tan_Peltor","VSM_Shemagh_Balaclava_tan_Peltor_Glasses","VSM_Shemagh_Balaclava_tan_Peltor_Goggles","VSM_Shemagh_Balaclava2_tan","VSM_Shemagh_Balaclava2_tan_Glasses","VSM_Shemagh_Balaclava2_tan_Goggles","VSM_Shemagh_Balaclava2_tan_Peltor","VSM_Shemagh_Balaclava2_tan_Peltor_Glasses","VSM_Shemagh_Balaclava2_tan_Peltor_Goggles","VSM_Shemagh_Facemask_tan","VSM_Shemagh_Facemask_tan_Glasses","VSM_Shemagh_Facemask_tan_Goggles","VSM_Shemagh_Facemask_tan_Peltor","VSM_Shemagh_Facemask_tan_Peltor_Glasses","VSM_Shemagh_Facemask_tan_Peltor_Goggles","VSM_Shemagh_glasses_tan","VSM_Shemagh_goggles_tan","VSM_SkiMask_Black","G_Aviator","G_Balaclava_blk","UK3CB_BAF_G_Balaclava_Win","rhs_googles_black","rhs_googles_clear","rhs_googles_yellow","rhs_googles_orange","rhs_ess_black","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan","G_Combat","G_Lady_Blue","G_Lowprofile","rhs_scarf","G_Shades_Black","G_Shades_Blue","G_Shades_Red","rhsusf_shemagh_tan","rhsusf_shemagh2_tan","rhsusf_shemagh_gogg_tan","rhsusf_shemagh2_gogg_tan","rhsusf_oakley_goggles_blk","rhsusf_oakley_goggles_clr","rhsusf_oakley_goggles_ylw","G_Sport_Blackred","G_Squares_Tinted","G_Squares","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_blk_F","UK3CB_BAF_G_Tactical_Black","UK3CB_BAF_G_Tactical_Clear","UK3CB_BAF_G_Tactical_Grey","UK3CB_BAF_G_Tactical_Orange","UK3CB_BAF_G_Tactical_Yellow"];
_arrayUniformAridSpecific = [["Arid_CarryAll","UK3CB_BAF_B_Carryall_TAN","VSM_OGA_carryall"],["dr_ARDfacp_mg","dr_ARDlbt_mg","dr_ARDpar_mg"],["U_B_FullGhillie_ard","U_O_FullGhillie_ard"]];
_arrayUniformSemiarid = ["UK3CB_BAF_U_CombatUniform_MTP_TShirt","UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM","VSM_Multicam_od_shirt_Camo","VSM_Multicam_tan_shirt_Camo","VSM_Multicam_Crye_grey_shirt_Camo","VSM_Multicam_Crye_od_shirt_Camo","VSM_Multicam_Crye_tan_shirt_Camo","VSM_Multicam_Crye_SS_grey_shirt_Camo","VSM_Multicam_Crye_SS_od_shirt_Camo","VSM_Multicam_Crye_SS_tan_shirt_Camo","VSM_Multicam_od_shirt_Camo_SS","VSM_Multicam_tan_shirt_Camo_SS","VSM_Multicam_casual_Camo","UK3CB_BAF_V_Osprey","UK3CB_BAF_V_Osprey_Belt_A","UK3CB_BAF_V_Osprey_Grenadier_A","UK3CB_BAF_V_Osprey_Grenadier_B","UK3CB_BAF_V_Osprey_Holster","UK3CB_BAF_V_Osprey_Marksman_A","UK3CB_BAF_V_Osprey_Medic_A","UK3CB_BAF_V_Osprey_Medic_B","UK3CB_BAF_V_Osprey_Medic_C","UK3CB_BAF_V_Osprey_Medic_D","UK3CB_BAF_V_Osprey_MG_A","UK3CB_BAF_V_Osprey_MG_B","UK3CB_BAF_V_Osprey_Rifleman_A","UK3CB_BAF_V_Osprey_Rifleman_B","UK3CB_BAF_V_Osprey_Rifleman_C","UK3CB_BAF_V_Osprey_Rifleman_D","UK3CB_BAF_V_Osprey_Rifleman_E","UK3CB_BAF_V_Osprey_Rifleman_F","UK3CB_BAF_V_Osprey_SL_A","UK3CB_BAF_V_Osprey_SL_B","UK3CB_BAF_V_Osprey_SL_C","UK3CB_BAF_V_Osprey_SL_D","UK3CB_BAF_V_Osprey_Lite","UK3CB_BAF_V_Pilot_A","VSM_FAPC_Breacher_Multicam","VSM_FAPC_Operator_Multicam","VSM_CarrierRig_Breacher_Multicam","VSM_CarrierRig_Operator_Multicam","VSM_LBT6094_breacher_Multicam","VSM_LBT6094_operator_Multicam","VSM_RAV_Breacher_Multicam","VSM_RAV_operator_Multicam","VSM_Multicam_Backpack_Compact","VSM_Multicam_Backpack_Kitbag","UK3CB_BAF_B_Bergen_MTP_Engineer_H_A","UK3CB_BAF_B_Bergen_MTP_Engineer_L_A","UK3CB_BAF_B_Bergen_MTP_Medic_H_A","UK3CB_BAF_B_Bergen_MTP_Medic_H_B","UK3CB_BAF_B_Bergen_MTP_Medic_L_A","UK3CB_BAF_B_Bergen_MTP_Medic_L_B","UK3CB_BAF_B_Bergen_MTP_Rifleman_H_A","UK3CB_BAF_B_Bergen_MTP_Rifleman_H_B","UK3CB_BAF_B_Bergen_MTP_Rifleman_H_C","UK3CB_BAF_B_Bergen_MTP_Rifleman_L_A","UK3CB_BAF_B_Bergen_MTP_Rifleman_L_B","UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C","UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D","UK3CB_BAF_B_Bergen_MTP_Sapper_H_A","UK3CB_BAF_B_Bergen_MTP_Sapper_L_A","UK3CB_UN_B_B_ASS","B_LegStrapBag_coyote_F","B_LegStrapBag_olive_F","rhs_medic_bag","UK3CB_BAF_B_Bergen_MTP_JTAC_L_A","UK3CB_BAF_B_Bergen_MTP_Radio_H_A","UK3CB_BAF_B_Bergen_MTP_Radio_H_B","UK3CB_BAF_B_Bergen_MTP_Radio_L_A","UK3CB_BAF_B_Bergen_MTP_Radio_L_B","UK3CB_BAF_B_Bergen_MTP_SL_H_A","UK3CB_BAF_B_Bergen_MTP_SL_L_A","tf_mr3000_multicam","FRXA_tf_rt1523g_Black","FRXA_tf_rt1523g_MARPAT_Woodland","FRXA_tf_rt1523g_Ranger_Green","FRXA_tf_rt1523g_big_Black","FRXA_tf_rt1523g_big_MARPAT_Woodlaand","FRXA_tf_rt1523g_big_Ranger_Green","rhs_altyn_novisor","rhs_altyn_novisor_bala","rhs_altyn_novisor_ess","rhs_altyn_novisor_ess_bala","rhs_altyn_visordown","rhs_altyn","rhs_altyn_bala","rhsusf_mich_bare_norotos_semi","rhsusf_mich_bare_norotos_alt_semi","rhsusf_mich_bare_norotos_alt_semi_headset","rhsusf_mich_bare_norotos_arc_semi","rhsusf_mich_bare_norotos_arc_alt_semi","rhsusf_mich_bare_norotos_arc_alt_semi_headset","rhsusf_mich_bare_norotos_arc_semi_headset","rhsusf_mich_bare_norotos_semi_headset","VSM_Multicam_Boonie","VSM_MulticamTropic_Boonie","VSM_Multicam_Cap","VSM_MulticamTropic_Cap","VSM_Mich2000_MulticamTropic","VSM_Mich2000_Multicam","VSM_Mich2000_2_MulticamTropic","VSM_Mich2000_2_Multicam","VSM_OPS_multicam","VSM_MulticamTropic_OPS","VSM_OPS_2_multicam","VSM_MulticamTropic_OPS_2","UK3CB_BAF_H_Boonie_MTP","UK3CB_BAF_H_Boonie_MTP_PRR","H_Cap_tan_specops_US","UK3CB_BAF_H_CrewHelmet_A","UK3CB_BAF_H_CrewHelmet_ESS_A","UK3CB_BAF_H_Mk7_Camo_A","UK3CB_BAF_H_Mk7_Camo_B","UK3CB_BAF_H_Mk7_Camo_C","UK3CB_BAF_H_Mk7_Camo_D","UK3CB_BAF_H_Mk7_Camo_E","UK3CB_BAF_H_Mk7_Camo_F","UK3CB_BAF_H_Mk7_Camo_CESS_A","UK3CB_BAF_H_Mk7_Camo_CESS_B","UK3CB_BAF_H_Mk7_Camo_CESS_C","UK3CB_BAF_H_Mk7_Camo_CESS_D","UK3CB_BAF_H_Mk7_Camo_ESS_A","UK3CB_BAF_H_Mk7_Camo_ESS_B","UK3CB_BAF_H_Mk7_Camo_ESS_C","UK3CB_BAF_H_Mk7_Camo_ESS_D","VSM_Beanie_OD","VSM_FullShemagh_OD_pattern","VSM_FullShemagh_OD","VSM_Bowman_cap_balaclava_Tan","VSM_Bowman_cap_balaclava_Olive","H_Booniehat_tan","H_Booniehat_khk_hs","H_Booniehat_khk","rhs_Booniehat_ocp","rhssaf_helmet_m97_olive_nocamo","rhssaf_helmet_m97_olive_nocamo_black_ess","rhssaf_helmet_m97_olive_nocamo_black_ess_bare"];
_arrayUniformSemiaridSpecific = [["VSM_Multicam_carryall"],["VSM_FAPC_MG_Multicam","VSM_CarrierRig_Gunner_Multicam","VSM_LBT6094_MG_Multicam","VSM_RAV_MG_Multicam","UK3CB_BAF_V_Osprey_MG_A","UK3CB_BAF_V_Osprey_MG_B"],["U_B_FullGhillie_sard","U_O_FullGhillie_sard"]];
_arrayUniformForest = ["VSM_MulticamTropic_Crye_SS_grey_shirt_Camo","VSM_MulticamTropic_Crye_SS_od_shirt_Camo","VSM_MulticamTropic_Crye_grey_shirt_Camo","VSM_MulticamTropic_Crye_od_shirt_Camo","VSM_MulticamTropic_casual_Camo","VSM_MulticamTropic_od_shirt_Camo","VSM_MulticamTropic_od_shirt_Camo_SS","VSM_OGA_OD_IOTV_2","VSM_OGA_OD_IOTV_1","VSM_FAPC_Breacher_OGA_OD","VSM_FAPC_Operator_OGA_OD","VSM_CarrierRig_Breacher_OGA_OD","VSM_CarrierRig_Operator_OGA_OD","VSM_LBT6094_breacher_OGA_OD","VSM_LBT6094_operator_OGA_OD","VSM_RAV_Breacher_OGA_OD","VSM_RAV_operator_OGA_OD","VSM_OGA_OD_Vest_1","VSM_OGA_OD_Vest_2","VSM_OGA_OD_Vest_3","VSM_FAPC_Breacher_MulticamTropic","VSM_FAPC_Operator_MulticamTropic","VSM_CarrierRig_Breacher_multicamTropic","VSM_CarrierRig_Operator_multicamTropic","VSM_LBT6094_breacher_multicamTropic","VSM_LBT6094_operator_multicamTropic","VSM_RAV_Breacher_MulticamTropic","VSM_RAV_operator_MulticamTropic","UK3CB_BAF_B_Bergen_OLI_Rifleman_A","UK3CB_BAF_B_Bergen_OLI_Rifleman_B","VSM_MulticamTropic_Backpack_Compact","VSM_MulticamTropic_Backpack_Kitbag","VSM_OGA_OD_Backpack_Compact","VSM_OGA_OD_Backpack_Kitbag","UK3CB_UN_B_B_ASS","CUP_B_SLA_Medicbag","B_LegStrapBag_olive_F","rhs_medic_bag","FRXA_tf_rt1523g_Black","FRXA_tf_rt1523g_Ranger_Green","FRXA_tf_rt1523g_big_Black","FRXA_tf_rt1523g_big_Ranger_Green","UK3CB_BAF_B_Bergen_OLI_JTAC_A","UK3CB_BAF_B_Bergen_OLI_SL_A","rhs_altyn_novisor","rhs_altyn_novisor_bala","rhs_altyn_novisor_ess","rhs_altyn_novisor_ess_bala","rhs_altyn_visordown","rhs_altyn","rhs_altyn_bala","rhsusf_mich_bare_norotos","rhsusf_mich_bare_norotos_alt","rhsusf_mich_bare_norotos_alt_headset","rhsusf_mich_bare_norotos_arc","rhsusf_mich_bare_norotos_arc_alt","rhsusf_mich_bare_norotos_arc_alt_headset","rhsusf_mich_bare_norotos_arc_headset","rhsusf_mich_bare_norotos_headset","VSM_BackwardsHat_Peltor_OD","VSM_Beanie_OD","VSM_Mich2000_OGA_OD","VSM_Mich2000_2_OGA_OD","VSM_OGA_OD_Helmet1","VSM_OGA_OD_Helmet2","VSM_OD_spray_OPS","VSM_OGA_OD_OPS","VSM_OD_Spray_OPS_2","VSM_OGA_OD_OPS_2","VSM_Peltor_OD","VSM_FullShemagh_OD_pattern","VSM_FullShemagh_OD","VSM_Bowman_cap_balaclava_Olive","H_Booniehat_khk_hs","H_Booniehat_khk","H_Booniehat_mgrn","H_Booniehat_tna_F","H_Booniehat_wdl","rhssaf_helmet_m97_olive_nocamo","rhssaf_helmet_m97_olive_nocamo_black_ess","rhssaf_helmet_m97_olive_nocamo_black_ess_bare","VSM_balaclava_Black_Skull","VSM_balaclava_Black","VSM_balaclava_olive_Skull","VSM_balaclava_olive","VSM_Balaclava_black_glasses","VSM_Balaclava_OD_glasses","VSM_Balaclava_black_Goggles","VSM_Balaclava_OD_Goggles","VSM_Balaclava_black_Peltor","VSM_Balaclava_OD_Peltor","VSM_Balaclava_black_Peltor_glasses","VSM_Balaclava_OD_Peltor_glasses","VSM_Balaclava_black_Peltor_Goggles","VSM_Balaclava_OD_Peltor_Goggles","VSM_balaclava2_Black","VSM_Balaclava2_black_glasses","VSM_Balaclava2_OD_glasses","VSM_Balaclava2_black_Goggles","VSM_Balaclava2_OD_Goggles","VSM_Balaclava2_black_Peltor","VSM_Balaclava2_OD_Peltor","VSM_Balaclava2_black_Peltor_glasses","VSM_Balaclava2_OD_Peltor_glasses","VSM_Balaclava2_black_Peltor_Goggles","VSM_Balaclava2_OD_Peltor_Goggles","VSM_FaceMask_black","VSM_FaceMask_Ghost","VSM_FaceMask_Ghost_olive","VSM_FaceMask_olive","VSM_Facemask_black_glasses","VSM_Facemask_OD_glasses","VSM_Facemask_black_Goggles","VSM_Facemask_OD_Goggles","VSM_Facemask_black_Peltor","VSM_Facemask_OD_Peltor","VSM_Facemask_black_Peltor_glasses","VSM_Facemask_OD_Peltor_glasses","VSM_Facemask_black_Peltor_Goggles","VSM_Facemask_OD_Peltor_Goggles","VSM_Goggles","VSM_Peltor_OD_glasses","VSM_Shemagh_OD","VSM_Shemagh_Balaclava_OD","VSM_Shemagh_Balaclava_OD_Glasses","VSM_Shemagh_Balaclava_OD_Goggles","VSM_Shemagh_Balaclava_OD_Peltor","VSM_Shemagh_Balaclava_OD_Peltor_Glasses","VSM_Shemagh_Balaclava_OD_Peltor_Goggles","VSM_Shemagh_Balaclava2_OD","VSM_Shemagh_Balaclava2_OD_Glasses","VSM_Shemagh_Balaclava2_OD_Goggles","VSM_Shemagh_Balaclava2_OD_Peltor","VSM_Shemagh_Balaclava2_OD_Peltor_Glasses","VSM_Shemagh_Balaclava2_OD_Peltor_Goggles","VSM_Shemagh_Facemask_OD","VSM_Shemagh_Facemask_OD_Glasses","VSM_Shemagh_Facemask_OD_Goggles","VSM_Shemagh_Facemask_OD_Peltor","VSM_Shemagh_Facemask_OD_Peltor_Glasses","VSM_Shemagh_Facemask_OD_Peltor_Goggles","VSM_Shemagh_glasses_OD","VSM_Shemagh_goggles_od","VSM_SkiMask_Black","G_Aviator","rhs_balaclava","G_Balaclava_blk","G_Balaclava_lowprofile","G_Balaclava_oli","rhs_balaclava1_olive","UK3CB_BAF_G_Balaclava_Win","rhs_googles_black","rhs_googles_clear","rhs_googles_yellow","rhs_googles_orange","rhs_ess_black","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Diving","G_Lady_Blue","G_Lowprofile","rhs_scarf","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","rhsusf_shemagh_grn","rhsusf_shemagh2_grn","rhsusf_shemagh_od","rhsusf_shemagh2_od","rhsusf_shemagh_gogg_grn","rhsusf_shemagh2_gogg_grn","rhsusf_shemagh_gogg_od","rhsusf_shemagh2_gogg_od","rhsusf_oakley_goggles_blk","rhsusf_oakley_goggles_clr","rhsusf_oakley_goggles_ylw","G_Sport_Greenblack","G_Squares_Tinted","G_Squares","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_tna_F","G_Balaclava_TI_tna_F","UK3CB_BAF_G_Tactical_Black","UK3CB_BAF_G_Tactical_Clear","UK3CB_BAF_G_Tactical_Grey","UK3CB_BAF_G_Tactical_Orange","UK3CB_BAF_G_Tactical_Yellow"];
_arrayUniformForestSpecific = [["VSM_MulticamTropic_carryall","VSM_OGA_OD_carryall"],["VSM_FAPC_MG_OGA_OD","VSM_CarrierRig_Gunner_OGA_OD","VSM_LBT6094_MG_OGA_OD","VSM_RAV_MG_OGA_OD","VSM_FAPC_MG_MulticamTropic","VSM_LBT6094_MG_multicamTropic","VSM_RAV_MG_MulticamTropic","VSM_CarrierRig_Gunner_multicamTropic"],["U_I_FullGhillie_lsh","U_O_FullGhillie_lsh","U_B_T_FullGhillie_tna_F","U_O_T_FullGhillie_tna_F"]];
_arrayUniformWinter = ["Alpine_Crye_Grey_Shirt_Camo","Alpine_Crye_Grey_Shirt_SS_Camo","dr_ALPfacp_br","dr_ALPfacp_op","dr_ALPlbt_br","dr_ALPlbt_op","dr_ALPpar_br","dr_ALPpar_op","UK3CB_BAF_V_Osprey_Winter","Alpine_Backpack_Compact","Alpine_Backpack_Kitbag","UK3CB_BAF_B_Bergen_Arctic_Rifleman_A","UK3CB_BAF_B_Bergen_Arctic_Rifleman_B","UK3CB_BAF_B_Bergen_Arctic_JTAC_A","UK3CB_BAF_B_Bergen_Arctic_SL_A","rhs_altyn_novisor","rhs_altyn_novisor_bala","rhs_altyn_novisor_ess","rhs_altyn_novisor_ess_bala","rhs_altyn_visordown","rhs_altyn","rhs_altyn_bala","VSM_FullShemagh_OD_pattern","H_ShemagOpen_khk","ALP_Opscore_2","WHT_Opscore_2","ALP_Opscore","WHT_Opscore","UK3CB_BAF_H_Mk7_Win_A","UK3CB_BAF_H_Mk7_Win_ESS_A","VSM_balaclava_Black_Skull","VSM_balaclava_Black","VSM_Balaclava_black_glasses","VSM_Balaclava_black_Goggles","VSM_Balaclava_black_Peltor","VSM_Balaclava_black_Peltor_glasses","VSM_Balaclava_black_Peltor_Goggles","VSM_balaclava2_Black","VSM_Balaclava2_black_glasses","VSM_Balaclava2_black_Goggles","VSM_Balaclava2_black_Peltor","VSM_Balaclava2_black_Peltor_glasses","VSM_Balaclava2_black_Peltor_Goggles","VSM_FaceMask_black","VSM_Facemask_black_glasses","VSM_Facemask_black_Goggles","VSM_Facemask_black_Peltor","VSM_Facemask_black_Peltor_glasses","VSM_Facemask_black_Peltor_Goggles","VSM_SkiMask_Black","G_Balaclava_blk","UK3CB_BAF_G_Balaclava_Win","G_Bandanna_blk","rhsusf_shemagh_white","rhsusf_shemagh2_white","rhsusf_shemagh_gogg_white","rhsusf_shemagh2_gogg_white","rhsusf_oakley_goggles_blk","rhsusf_oakley_goggles_clr","rhsusf_oakley_goggles_ylw","G_Sport_BlackWhite","G_Squares_Tinted","G_Squares","UK3CB_BAF_G_Tactical_Black","UK3CB_BAF_G_Tactical_Clear","UK3CB_BAF_G_Tactical_Grey","UK3CB_BAF_G_Tactical_Orange","UK3CB_BAF_G_Tactical_Yellow"];
_arrayUniformWinterSpecific = [["Alpine_CarryAll"],["dr_ALPfacp_mg","dr_ALPlbt_mg","dr_ALPpar_mg"],[]];
_arrayUniformBlack = ["Black_Black_Camo","Black_Black_SS_Camo","dr_BLKfacp_br","dr_BLKfacp_op","dr_BLKlbt_br","dr_BLKlbt_op","dr_BLKpar_br","dr_BLKpar_op","b_FieldPack_blk","Black_Backpack_Compact","Black_Backpack_Kitbag","B_LegStrapBag_black_F","CUP_B_USPack_Black","UK3CB_TKP_O_B_ASS_BLK","FRXA_tf_rt1523g_Black","FRXA_tf_rt1523g_big_Black","BLK_Opscore_2","BLK2_Opscore","H_Cap_blk","H_Watchcap_blk","rhs_altyn","rhs_altyn_bala","rhs_altyn_novisor","rhs_altyn_novisor_bala","rhs_altyn_novisor_ess","rhs_altyn_novisor_ess_bala","rhs_altyn_visordown","rhssaf_helmet_m97_black_nocamo","rhssaf_helmet_m97_black_nocamo_black_ess","rhssaf_helmet_m97_black_nocamo_black_ess_bare","rhsusf_opscore_bk","rhsusf_opscore_bk_pelt","UK3CB_TKP_O_H_Patrolcap_Blk","VSM_BackwardsHat_Peltor_black","VSM_Beanie_Black","VSM_Black_OPS","VSM_Black_OPS_2","VSM_Bowman_cap_balaclava_Black","VSM_Bowman_cap_Black","VSM_balaclava_Black_Skull","VSM_balaclava_Black","VSM_Balaclava_black_glasses","VSM_Balaclava_black_glasses","VSM_Balaclava_black_Goggles","VSM_Balaclava_black_Peltor","VSM_Balaclava_black_Peltor_glasses","VSM_Balaclava_black_Peltor_Goggles","VSM_balaclava2_Black","VSM_Balaclava2_black_glasses","VSM_Balaclava2_black_Goggles","VSM_Balaclava2_black_Peltor","VSM_Balaclava2_black_Peltor_glasses","VSM_Balaclava2_black_Peltor_Goggles","VSM_FaceMask_black","VSM_FaceMask_Ghost","VSM_Facemask_black_glasses","VSM_Facemask_black_Goggles","VSM_Facemask_black_Peltor","VSM_Facemask_black_Peltor_glasses","VSM_Facemask_black_Peltor_Goggles","VSM_Goggles","VSM_SkiMask_Black","G_Aviator","rhs_balaclava","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","rhs_googles_black","rhs_googles_clear","rhs_googles_yellow","rhs_googles_orange","rhs_ess_black","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","rhsusf_oakley_goggles_blk","rhsusf_oakley_goggles_clr","rhsusf_oakley_goggles_ylw","G_Sport_Blackyellow","G_Sport_BlackWhite","G_Sport_Blackred","G_Squares_Tinted","G_Squares","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_blk_F","UK3CB_BAF_G_Tactical_Black","UK3CB_BAF_G_Tactical_Clear","UK3CB_BAF_G_Tactical_Grey","UK3CB_BAF_G_Tactical_Orange","UK3CB_BAF_G_Tactical_Yellow"];
_arrayUniformBlackSpecific = [["Black_CarryAll"],["dr_BLKfacp_mg","dr_BLKlbt_mg","dr_BLKpar_mg"],[]];
_items = ["tf_anprc152", "ItemMap"];

_allSAAArrays = [];
_specificUniform = [];

switch (_uniformType) do {
	case "Arid": {_allSAAArrays append _arrayUniformArid; _specificUniform append _arrayUniformAridSpecific};
	case "Semiarid": {_allSAAArrays append _arrayUniformSemiarid; _specificUniform append _arrayUniformSemiaridSpecific};
	case "Forest": {_allSAAArrays append _arrayUniformForest; _specificUniform append _arrayUniformForestSpecific};
	case "Winter": {_allSAAArrays append _arrayUniformWinter; _specificUniform append _arrayUniformWinterSpecific};
	case "Black": {_allSAAArrays append _arrayUniformBlack; _specificUniform append _arrayUniformBlackSpecific};
	case "All": {
		{_allSAAArrays append _x} forEach [_arrayUniformArid, _arrayUniformSemiarid, _arrayUniformForest, _arrayUniformWinter, _arrayUniformBlack];
		{_specificUniform append _x} forEach [_arrayUniformAridSpecific, _arrayUniformSemiaridSpecific, _arrayUniformForestSpecific, _arrayUniformWinterSpecific, _arrayUniformBlackSpecific];
	};
	default {};
};

_arrayWeapons = [];

switch (_type) do {
	case "Full": {_allSAAArrays append _arrayWeapons};
	case "Uniform";
	default {};
};

_allSAAArrays append _items;

[_box, _allSAAArrays, true] call ace_arsenal_fnc_initBox;

// _box setVariable ["uniformType", _uniformType];

[[_box, _specificUniform], {_this call Shadec_fnc_addArsenalSpecificItems}] remoteExec ["spawn", -2, true];


if (_additionalInfo isEqualTo 1) then {
	[[_box], {
		_this params ["_arsenal"];
		hint parseText format ["<t align='center'>Arsenal was assigned</t><t align='center'><img size='4' image='%1'/></t><br/><br/><t align='center' shadow='1' shadowColor='#000000'>%2</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Direction from you: %3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Distance: %4</t>", getText(configfile >> "CfgVehicles" >> typeOf _arsenal >> "picture"), getText (configFile >> "CfgVehicles" >> typeOf _arsenal >> "displayName"), floor ([player, _arsenal] call BIS_fnc_dirTo), round (player distance _arsenal)]
	}] remoteExec ["call"];
};

["> Server: Arsenal added."] remoteExec ["systemChat"];