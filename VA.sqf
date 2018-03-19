#define NO_SIDE -1
#define EAST_SIDE 0
#define WEST_SIDE 1
#define INDEP_SIDE 2
#define CIV_SIDE 3
#define NEUTRAL_SIDE 4
#define ENEMY_SIDE 5
#define FRIENDLY_SIDE 6
#define LOGIC_SIDE 7
 
_box = switch (worldName) do {
    case "Malden": { [arsenal1, arsenal2, arsenal3] };
    case "Takistan": { [arsenal1, arsenal2, arsenal3, arsenal4] };
    case "Chernarus": { [arsenal1, arsenal2, arsenal3, arsenal4, arsenal5] };
    case "Zargabad": { [arsenal1, arsenal2] };
    default { [] };
};
 
//if (isServer) then {
{
// Grab the parameter that was passed in.
// The box should have "this execVM <scriptname>" in it's init field.
//_box = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_box = _x;
// Check if @XLA_FixedArsenal is loaded
 
[_box, [
 
    //PISTOLS
    "rhsusf_weap_glock17g4",
    "rhsusf_weap_m1911a1",
    "rhsusf_weap_m9",
    "rhs_weap_M320",

    "BWA3_P2A1",
    "BWA3_P8",
    "BWA3_MP7",

    "ACE_VMH3",
    "ACE_VMM3",

    //PRIMARY
    "rhs_weap_hk416d10",
    "rhs_weap_hk416d10_m320",
    "rhs_weap_hk416d10_LMT",
    "rhs_weap_hk416d10_LMT_d",
    "rhs_weap_hk416d10_LMT_wd",
    "rhs_weap_hk416d145",
    "rhs_weap_hk416d145_m320",
    "rhs_weap_hk416d145_d",
    "rhs_weap_hk416d145_d_2",
    "rhs_weap_hk416d145_wd",
    "rhs_weap_hk416d145_wd_2",
    "rhs_weap_M107",
    "rhs_weap_M107_d",
    "rhs_weap_M107_w",
    "rhs_weap_m14ebrri",
    "rhs_weap_m16a4",
    "rhs_weap_m16a4_carryhandle",
    "rhs_weap_m16a4_carryhandle_M203",
    "rhs_weap_m16a4_carryhandle_pmag",
    "rhs_weap_m16a4_pmag",
    "rhs_weap_XM2010",
    "rhs_weap_XM2010_wd",
    "rhs_weap_XM2010_sa",
    "rhs_weap_XM2010_d",
    "rhs_weap_m24sws",
    "rhs_weap_m24sws_blk",
    "rhs_weap_m24sws_ghillie",
    "rhs_weap_m240B",
    "rhs_weap_m240B_CAP",
    "rhs_weap_m240G",
    "rhs_weap_m249",
    "rhs_weap_m249_pip_L",
    "rhs_weap_m249_pip_L_para",
    "rhs_weap_m249_pip_L_vfg",
    "rhs_weap_m249_pip_S",
    "rhs_weap_m249_pip_S_para",
    "rhs_weap_m249_pip_S_vfg",
    "rhs_weap_m249_pip",
    "rhs_weap_m27iar",
    "rhs_weap_m27iar_grip",
    "rhs_weap_m32",
    "rhs_weap_m4",
    "rhs_weap_m4_carryhandle_mstock",
    "rhs_weap_m4_carryhandle",
    "rhs_weap_m4_carryhandle_pmag",
    "rhs_weap_m4_m203",
    "rhs_weap_m4_m203S",
    "rhs_weap_m4_m320",
    "rhs_weap_m4_pmag",
    "rhs_weap_m4_mstock",
    "rhs_weap_m40a5",
    "rhs_weap_m40a5_d",
    "rhs_weap_m40a5_wd",
    "rhs_weap_m4a1_carryhandle",
    "rhs_weap_m4a1_carryhandle_m203",
    "rhs_weap_m4a1_carryhandle_m203S",
    "rhs_weap_m4a1_carryhandle_pmag",
    "rhs_weap_m4a1_carryhandle_mstock",
    "rhs_weap_m4a1_blockII",
    "rhs_weap_m4a1_blockII_M203_d",
    "rhs_weap_m4a1_blockII_KAC_d",
    "rhs_weap_m4a1_blockII_M203",
    "rhs_weap_m4a1_blockII_bk",
    "rhs_weap_m4a1_blockII_M203_bk",
    "rhs_weap_m4a1_blockII_KAC_bk",
    "rhs_weap_m4a1_blockII_KAC",
    "rhs_weap_m4a1_blockII_M203_wd",
    "rhs_weap_m4a1_blockII_KAC_wd",
    "rhs_weap_m4a1_blockII_d",
    "rhs_weap_m4a1_blockII_wd",
    "rhs_weap_m4a1",
    "rhs_weap_m4a1_m203",
    "rhs_weap_m4a1_m203s",
    "rhs_weap_m4a1_m320",
    "rhs_weap_m4a1_pmag",
    "rhs_weap_m4a1_mstock",
    "rhs_weap_m4a1_wd",
    "rhs_weap_m4a1_m203s_wd",
    "rhs_weap_m4a1_wd_mstock",
    "rhs_weap_m4a1_d",
    "rhs_weap_m4a1_m203s_d",
    "rhs_weap_m4a1_d_mstock",
    "rhs_weap_M590_8RD",
    "rhs_weap_M590_5RD",
    "rhs_weap_sr25",
    "rhs_weap_sr25_d",
    "rhs_weap_sr25_ec_d",
    "rhs_weap_sr25_ec_wd",
    "rhs_weap_sr25_wd",
    "rhs_weap_sr25_ec",
    "rhs_weap_mk18",
    "rhs_weap_mk18_d",
    "rhs_weap_mk18_KAC_d",
    "rhs_weap_mk18_m320",
    "rhs_weap_mk18_bk",
    "rhs_weap_mk18_KAC_bk",
    "rhs_weap_mk18_KAC",
    "rhs_weap_mk18_wd",
    "rhs_weap_mk18_KAC_wd",
    "rhsusf_weap_MP7A2",
    "rhsusf_weap_MP7A2_aor1",
    "rhsusf_weap_MP7A2_desert",
    "rhsusf_weap_MP7A2_winter",

    "BWA3_G27",
    "BWA3_G27_Tan",
    "BWA3_G27_AG",
    "BWA3_G27_Tan_AG",
    "BWA3_G28_Standard",
    "BWA3_G28_Assault",
    "BWA3_G36",
    "BWA3_G36_LMG",
    "BWA3_G36_AG",
    "BWA3_G36K",
    "BWA3_G36K_AG",
    "BWA3_G38",
    "BWA3_G38_Tan",
    "BWA3_G38_AG",
    "BWA3_G38_AG_Tan",
    "BWA3_G38C",
    "BWA3_G38C_Tan",
    "BWA3_G38K_Tan",
    "BWA3_G38K_AG",
    "BWA3_G38K_AG_Tan",
    "BWA3_G38K_AG_Tan",
    "BWA3_G82",
    "BWA3_MG4",
    "BWA3_MG5",
    "BWA3_MG5_Tan",

    //LAUNCHER
    "rhs_weap_maaws",
    "rhs_weap_smaw",
    "rhs_weap_smaw_green",
    "rhs_weap_m72a7",
    "rhs_weap_M136_hp",
    "rhs_weap_M136_hedp",
    "rhs_weap_M136",
    "rhs_weap_fim92",
    "rhs_weap_fgm148",

    "BWA3_CarlGustaf",
    "BWA3_Pzf3",
    "BWA3_RGW90",
    "BWA3_Fliegerfaust"


],false, true] call xla_fnc_addVirtualWeaponCargo;

[_box, [

    //PISTOL AMMO
    "rhsusf_mag_17Rnd_9x19_JHP",
    "rhsusf_mag_17Rnd_9x19_FMJ",
    "rhsusf_mag_7x45acp_MHP",
    "rhsusf_mag_15Rnd_9x19_JHP",
    "rhsusf_mag_15Rnd_9x19_FMJ",

    "BWA3_40Rnd_46x30_MP7",
    "BWA3_40Rnd_46x30_MP7_SD",
    "BWA3_1Rnd_Flare_Illum",
    "BWA3_1Rnd_Flare_Singlestar_White",
    "BWA3_1Rnd_Flare_Singlestar_Green",
    "BWA3_1Rnd_Flare_Singlestar_Red",
    "BWA3_1Rnd_Flare_Multistar_White",
    "BWA3_1Rnd_Flare_Multistar_Green",
    "BWA3_1Rnd_Flare_Multistar_Red",
    "BWA3_15Rnd_9x19_P8",

    //RIFLE AMMO
    "rhsusf_mag_10Rnd_STD_50BMG_M33",
    "rhsusf_mag_10Rnd_STD_50BMG_mk211",
    "rhsusf_mag_40Rnd_46x30_AP",
    "rhsusf_mag_40Rnd_46x30_FMJ",
    "rhsusf_mag_40Rnd_46x30_JHP",
    "rhs_mag_30Rnd_556x45_M200_Stanag",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Orange",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
    "rhs_mag_30Rnd_556x45_Mk262_Stanag",
    "rhs_mag_30Rnd_556x45_Mk318_Stanag",
    "rhsusf_100Rnd_556x45_M200_soft_pouch",
    "rhsusf_100Rnd_556x45_soft_pouch",
    "rhs_200rnd_556x45_M_SAW",
    "rhs_200rnd_556x45_B_SAW",
    "rhsusf_200Rnd_556x45_soft_pouch",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag",
    "rhs_200rnd_556x45_T_SAW",
    "rhsusf_5Rnd_00Buck",
    "rhsusf_5Rnd_FRAG",
    "rhsusf_5Rnd_HE",
    "rhsusf_5Rnd_Slug",
    "rhsusf_5Rnd_300winmag_xm2010",
    "rhsusf_10Rnd_762x51_m118_special_Mag",
    "rhsusf_20Rnd_762x51_m118_special_Mag",
    "rhsusf_5Rnd_762x51_m118_special_Mag",
    "rhsusf_100Rnd_762x51_m61_ap",
    "rhsusf_50Rnd_762x51_m61_ap",
    "rhsusf_10Rnd_762x51_m62_Mag",
    "rhsusf_100Rnd_762x51_m62_tracer",
    "rhsusf_20Rnd_762x51_m62_Mag",
    "rhsusf_5Rnd_762x51_m62_Mag",
    "rhsusf_50Rnd_762x51_m62_tracer",
    "rhsusf_100Rnd_762x51",
    "rhsusf_50Rnd_762x51",
    "rhsusf_100Rnd_762x51_m80a1epr",
    "rhsusf_50Rnd_762x51_m80a1epr",
    "rhsusf_100Rnd_762x51_m82_blank",
    "rhsusf_50Rnd_762x51_m82_blank",
    "rhsusf_10Rnd_762x51_m993_Mag",
    "rhsusf_20Rnd_762x51_m993_Mag",
    "rhsusf_5Rnd_762x51_m993_Mag",
    "rhsusf_8Rnd_00Buck",
    "rhsusf_8Rnd_FRAG",
    "rhsusf_8Rnd_HE",
    "rhsusf_8Rnd_Slug",

    "BWA3_20Rnd_762x51_G28",
    "BWA3_20Rnd_762x51_G28_Tracer",
    "BWA3_20Rnd_762x51_G28_Tracer_Dim",
    "BWA3_20Rnd_762x51_G28_SD",
    "BWA3_20Rnd_762x51_G28_AP",
    "BWA3_10Rnd_762x51_G28",
    "BWA3_10Rnd_762x51_G28_Tracer",
    "BWA3_10Rnd_762x51_G28_Tracer_Dim",
    "BWA3_10Rnd_762x51_G28_SD",
    "BWA3_10Rnd_762x51_G28_AP",
    "BWA3_10Rnd_762x51_G28_LR",
    "BWA3_30Rnd_556x45_G36",
    "BWA3_30Rnd_556x45_G36_Tracer",
    "BWA3_30Rnd_556x45_G36_Tracer_Dim",
    "BWA3_30Rnd_556x45_G36_SD",
    "BWA3_30Rnd_556x45_G36_AP",
    "BWA3_100Rnd_556x45_G36",
    "BWA3_100Rnd_556x45_G36_Tracer",
    "BWA3_10Rnd_127x99_G82",
    "BWA3_10Rnd_127x99_G82_Tracer",
    "BWA3_10Rnd_127x99_G82_Tracer_Dim",
    "BWA3_10Rnd_127x99_G82_SD",
    "BWA3_10Rnd_127x99_G82_AP",
    "BWA3_10Rnd_127x99_G82_AP_Tracer",
    "BWA3_10Rnd_127x99_G82_Raufoss",
    "BWA3_10Rnd_127x99_G82_Raufoss_Tracer",
    "BWA3_10Rnd_127x99_G82_Raufoss_Tracer_Dim",
    "BWA3_200Rnd_556x45",
    "BWA3_200Rnd_556x45_Tracer",
    "BWA3_120Rnd_762x51",
    "BWA3_120Rnd_762x51_Tracer",

    //LAUNCHER AMMO
    "rhs_fgm172b_magazine_MPV",
    "rhs_fgm148_magazine_AT",
    "rhs_fim92_mag",
    "rhs_m136_mag",
    "rhs_m136_hedp_mag",
    "rhs_m136_hp_mag",
    "rhs_m72a7_mag",
    "rhs_mag_smaw_HEAA",
    "rhs_mag_smaw_HEDP",
    "rhs_mag_smaw_SR",
    "rhs_mag_maaws_HEAT",
    "rhs_mag_maaws_HEDP",
    "rhs_mag_maaws_HE",

    "BWA3_Pzf3_IT",
    "BWA3_RGW90_HH",
    "BWA3_Fliegerfaust_Mag",
    "BWA3_CarlGustaf_Illum",
    "BWA3_CarlGustaf_HE",
    "BWA3_CarlGustaf_HEAT",
    "BWA3_CarlGustaf_HEDP",
    "BWA3_CarlGustaf_Smoke",

    //ULG Ammo
    "rhsusf_mag_6Rnd_m4009",
    "rhsusf_mag_6Rnd_M397_HET",
    "rhsusf_mag_6Rnd_M433_HEDP",
    "rhsusf_mag_6Rnd_M441_HE",
    "rhsusf_mag_6Rnd_M576_Buckshot",
    "rhsusf_mag_6Rnd_M585_white",
    "rhsusf_mag_6Rnd_m661_green",
    "rhsusf_mag_6Rnd_m662_red",
    "rhsusf_mag_6Rnd_M713_red",
    "rhsusf_mag_6Rnd_M714_white",
    "rhsusf_mag_6Rnd_M715_green",
    "rhsusf_mag_6Rnd_M716_yellow",
    "rhsusf_mag_6Rnd_M781_Practice",
    "rhs_mag_m4009",
    "rhs_mag_M397_HET",
    "rhs_mag_M433_HEDP",
    "rhs_mag_M441_HE",
    "rhs_mag_m576",
    "rhs_mag_M585_white",
    "rhs_mag_m661_green",
    "rhs_mag_m662_red",
    "rhs_mag_m713_Red",
    "rhs_mag_m714_White",
    "rhs_mag_m715_Green",
    "rhs_mag_m716_yellow",
    "rhs_mag_M781_Practice",
    "1Rnd_HE_Grenade_shell",
    "UGL_FlareWhite_F",
    "UGL_FlareGreen_F",
    "UGL_FlareRed_F",
    "UGL_FlareYellow_F",
    "UGL_FlareCIR_F",
    "1Rnd_Smoke_Grenade_shell",
    "1Rnd_SmokeRed_Grenade_shell",
    "1Rnd_SmokeGreen_Grenade_shell",
    "1Rnd_SmokeYellow_Grenade_shell",
    "1Rnd_SmokePurple_Grenade_shell",
    "1Rnd_SmokeBlue_Grenade_shell",
    "1Rnd_SmokeOrange_Grenade_shell",
    "ACE_HuntIR_M203",

    //GRENADES
    "rhs_mag_an_m14_th3",
    "rhs_mag_an_m8hc",
    "rhs_mag_m18_yellow",
    "rhs_mag_m18_green",
    "rhs_mag_m18_purple",
    "rhs_mag_m18_red",
    "rhs_mag_m67",
    "rhs_mag_m69",
    "rhs_mag_m7a3_cs",
    "rhs_mag_mk84",
    "rhs_mag_mk3a2",

    "BWA3_DM25",
    "BWA3_DM32_Yellow",
    "BWA3_DM32_Orange",
    "BWA3_DM51A1",

    "ACE_Chemlight_HiYellow",
    "ACE_Chemlight_IR",
    "ACE_Chemlight_Orange",
    "ACE_Chemlight_HiOrange",
    "ACE_Chemlight_HiRed",
    "ACE_Chemlight_White",
    "ACE_Chemlight_HiWhite",
    "ACE_HandFlare_Yellow",
    "ACE_HandFlare_Green",
    "ACE_HandFlare_Red",
    "ACE_HandFlare_White",

    //Explosives
    "DemoCharge_Remote_Mag",
    "SatchelCharge_Remote_Mag",
    "rhsusf_mine_m14_mag",
    "rhs_mine_M19_mag",

    //LASER BATTERIES
    "Laserbatteries",
    "rhs_LaserFCSMag",
    "rhs_LaserMag"

], false, true] call xla_fnc_addVirtualMagazineCargo;

[_box, [
 
    //BACKPACKS
    "rhsusf_assault_eagleaiii_coy",
    "rhsusf_assault_eagleaiii_ocp",
    "rhsusf_assault_eagleaiii_ucp",
    "rhsusf_falconii_coy",
    "rhsusf_falconii_mc",
    "rhsusf_falconii",
    "RHS_M2_Gun_Bag",
    "RHS_M2_Tripod_Bag",
    "rhs_M252_Gun_Bag",
    "rhs_M252_Bipod_Bag",
    "RHS_M2_MiniTripod_Bag",
    "RHS_Mk19_Gun_Bag",
    "RHS_Mk19_Tripod_Bag",
    "rhs_Tow_Gun_Bag",
    "rhs_TOW_Tripod_Bag",

    "BWA3_AssaultPack_Fleck",
    "BWA3_AssaultPack_Tropen",
    "BWA3_PatrolPack_Fleck",
    "BWA3_PatrolPack_Fleck",
    "BWA3_PatrolPack_Tropen",
    "BWA3_Kitbag_Fleck",
    "BWA3_Kitbag_Fleck_Medic",
    "BWA3_Kitbag_Tropen",
    "BWA3_Kitbag_Tropen_Medic",
    "BWA3_TacticalPack_Fleck",
    "BWA3_TacticalPack_Fleck_Medic",
    "BWA3_TacticalPack_Tropen",
    "BWA3_TacticalPack_Tropen_Medic",

    "tfw_ilbe_coy",
    "tfw_ilbe_a_coy",
    "tfw_ilbe_blade_coy",
    "tfw_ilbe_dd_coy",

    "tfw_ilbe_gr",
    "tfw_ilbe_a_gr",
    "tfw_ilbe_blade_gr",
    "tfw_ilbe_dd_gr",

    "tfw_ilbe_d",
    "tfw_ilbe_a_d",
    "tfw_ilbe_blade_d",
    "tfw_ilbe_dd_d",

    "tfw_ilbe_wd",
    "tfw_ilbe_a_wd",
    "tfw_ilbe_blade_wd",
    "tfw_ilbe_dd_wd",

    "ace_gunbag",
    "ace_gunbag_Tan",

    "tf_rt1523g_big_rhs",
    "tf_rt1523g_rhs",
	
	"milgp_bp_Breacher_cb",
	"milgp_bp_Breacher_mc",
	"milgp_bp_Breacher_rgr",
	"milgp_bp_hydration_cb",
	"milgp_bp_hydration_mc",
	"milgp_bp_hydration_rgr",
	"milgp_bp_Pointman_cb",
	"milgp_bp_Pointman_mc",
	"milgp_bp_Pointman_rgr",
	"milgp_bp_Tomahawk_cb",
	"milgp_bp_Tomahawk_mc",
	"milgp_bp_Tomahawk_rgr",
	"milgp_bp_Breacher_AOR1",
	"milgp_bp_Breacher_AOR2",
	"milgp_bp_hydration_AOR1",
	"milgp_bp_hydration_AOR2",
	"milgp_bp_Pointman_AOR1",
	"milgp_bp_Pointman_AOR2",
	"milgp_bp_Tomahawk_AOR1",
	"milgp_bp_Tomahawk_AOR2",

	"Redd_Milan_Static_Bag",
	"Redd_Milan_Static_Tripod",

    "B_Kitbag_cbr",
    "B_Kitbag_sgg",
    "B_Kitbag_rgr",
    "B_Kitbag_mcamo",

    "B_Parachute",
    "B_rhsusf_B_BACKPACK"

], false, true] call xla_fnc_addVirtualBackpackCargo;

[_box, [
    //HEADGEAR
    "rhsusf_ach_bare",
    "rhsusf_ach_bare_des",
    "rhsusf_ach_bare_des_ess",
    "rhsusf_ach_bare_des_headset",
    "rhsusf_ach_bare_des_headset_ess",
    "rhsusf_ach_bare_ess",
    "rhsusf_ach_bare_headset",
    "rhsusf_ach_bare_headset_ess",
    "rhsusf_ach_bare_semi",
    "rhsusf_ach_bare_semi_ess",
    "rhsusf_ach_bare_semi_headset",
    "rhsusf_ach_bare_semi_headset_ess",
    "rhsusf_ach_bare_tan",
    "rhsusf_ach_bare_tan_ess",
    "rhsusf_ach_bare_tan_headset",
    "rhsusf_ach_bare_tan_headset_ess",
    "rhsusf_ach_bare_wood",
    "rhsusf_ach_bare_wood_ess",
    "rhsusf_ach_bare_wood_headset",
    "rhsusf_ach_bare_wood_headset_ess",
    "rhsusf_ach_helmet_M81",
    "rhsusf_ach_helmet_ocp",
    "rhsusf_ach_helmet_ESS_ocp",
    "rhsusf_ach_helmet_headset_ocp",
    "rhsusf_ach_helmet_headset_ess_ocp",
    "rhsusf_ach_helmet_camo_ocp",
    "rhsusf_ach_helmet_ocp_norotos",
    "rhsusf_ach_helmet_ucp",
    "rhsusf_ach_helmet_ESS_ucp",
    "rhsusf_ach_helmet_headset_ucp",
    "rhsusf_ach_helmet_headset_ess_ucp",
    "rhsusf_ach_helmet_ucp_norotos",
    "rhsusf_cvc_green_alt_helmet",
    "rhsusf_cvc_green_helmet",
    "rhsusf_cvc_green_ess",
    "rhsusf_cvc_alt_helmet",
    "rhsusf_cvc_helmet",
    "rhsusf_cvc_ess",
    "rhs_Booniehat_m81",
    "rhs_booniehat2_marpatd",
    "rhs_booniehat2_marpatwd",
    "rhs_Booniehat_ocp",
    "rhs_Booniehat_ucp",
    "rhsusf_Bowman",
    "rhsusf_bowman_cap",
    "rhsusf_opscore_aor1",
    "rhsusf_opscore_aor1_pelt",
    "rhsusf_opscore_aor1_pelt_nsw",
    "rhsusf_opscore_aor2",
    "rhsusf_opscore_aor2_pelt",
    "rhsusf_opscore_aor2_pelt_nsw",
    "rhsusf_opscore_bk",
    "rhsusf_opscore_bk_pelt",
    "rhsusf_opscore_coy_cover",
    "rhsusf_opscore_coy_cover_pelt",
    "rhsusf_opscore_fg",
    "rhsusf_opscore_fg_pelt",
    "rhsusf_opscore_fg_pelt_cam",
    "rhsusf_opscore_fg_pelt_nsw",
    "rhsusf_opscore_mc_cover",
    "rhsusf_opscore_mc_cover_pelt",
    "rhsusf_opscore_mc_cover_pelt_nsw",
    "rhsusf_opscore_mc_cover_pelt_cam",
    "rhsusf_opscore_mc",
    "rhsusf_opscore_mc_pelt",
    "rhsusf_opscore_mc_pelt_nsw",
    "rhsusf_opscore_paint",
    "rhsusf_opscore_paint_pelt",
    "rhsusf_opscore_paint_pelt_nsw",
    "rhsusf_opscore_paint_pelt_nsw_cam",
    "rhsusf_opscore_rg_cover",
    "rhsusf_opscore_rg_cover_pelt",
    "rhsusf_opscore_ut",
    "rhsusf_opscore_ut_pelt",
    "rhsusf_opscore_ut_pelt_cam",
    "rhsusf_opscore_ut_pelt_nsw",
    "rhsusf_opscore_ut_pelt_nsw_cam",
    "rhsusf_opscore_mar_fg",
    "rhsusf_opscore_mar_fg_pelt",
    "rhsusf_opscore_mar_ut",
    "rhsusf_opscore_mar_ut_pelt",
    "rhsusf_hgu56p_black",
    "rhsusf_hgu56p_mask_black",
    "rhsusf_hgu56p_mask_black_skull",
    "rhsusf_hgu56p_visor_black",
    "rhsusf_hgu56p_visor_mask_black",
    "rhsusf_hgu56p_visor_mask_Empire_black",
    "rhsusf_hgu56p_visor_mask_black_skull",
    "rhsusf_hgu56p_green",
    "rhsusf_hgu56p_mask_green",
    "rhsusf_hgu56p_mask_green_mo",
    "rhsusf_hgu56p_visor_green",
    "rhsusf_hgu56p_visor_mask_green",
    "rhsusf_hgu56p_visor_mask_green_mo",
    "rhsusf_hgu56p",
    "rhsusf_hgu56p_mask",
    "rhsusf_hgu56p_mask_mo",
    "rhsusf_hgu56p_mask_skull",
    "rhsusf_hgu56p_visor",
    "rhsusf_hgu56p_visor_mask",
    "rhsusf_hgu56p_visor_mask_mo",
    "rhsusf_hgu56p_visor_mask_skull",
    "rhsusf_hgu56p_pink",
    "rhsusf_hgu56p_mask_pink",
    "rhsusf_hgu56p_visor_pink",
    "rhsusf_hgu56p_visor_mask_pink",
    "rhsusf_hgu56p_saf",
    "rhsusf_hgu56p_mask_saf",
    "rhsusf_hgu56p_visor_saf",
    "rhsusf_hgu56p_visor_mask_saf",
    "rhsusf_hgu56p_mask_smiley",
    "rhsusf_hgu56p_visor_mask_smiley",
    "rhsusf_hgu56p_usa",
    "rhsusf_hgu56p_visor_usa",
    "RHS_jetpilot_usaf",
    "rhsusf_lwh_helmet_M1942",
    "rhsusf_lwh_helmet_marpatd",
    "rhsusf_lwh_helmet_marpatd_ess",
    "rhsusf_lwh_helmet_marpatd_headset",
    "rhsusf_lwh_helmet_marpatwd",
    "rhsusf_lwh_helmet_marpatwd_blk_ess",
    "rhsusf_lwh_helmet_marpatwd_headset_blk",
    "rhsusf_lwh_helmet_marpatwd_headset",
    "rhsusf_lwh_helmet_marpatwd_ess",
    "rhsusf_mich_bare",
    "rhsusf_mich_bare_alt",
    "rhsusf_mich_bare_headset",
    "rhsusf_mich_bare_norotos",
    "rhsusf_mich_bare_norotos_alt",
    "rhsusf_mich_bare_norotos_alt_headset",
    "rhsusf_mich_bare_norotos_arc",
    "rhsusf_mich_bare_norotos_arc_alt",
    "rhsusf_mich_bare_norotos_arc_alt_headset",
    "rhsusf_mich_bare_norotos_arc_headset",
    "rhsusf_mich_bare_norotos_headset",
    "rhsusf_mich_bare_semi",
    "rhsusf_mich_bare_alt_semi",
    "rhsusf_mich_bare_semi_headset",
    "rhsusf_mich_bare_norotos_semi",
    "rhsusf_mich_bare_norotos_alt_semi",
    "rhsusf_mich_bare_norotos_alt_semi_headset",
    "rhsusf_mich_bare_norotos_arc_semi",
    "rhsusf_mich_bare_norotos_arc_alt_semi",
    "rhsusf_mich_bare_norotos_arc_alt_semi_headset",
    "rhsusf_mich_bare_norotos_arc_semi_headset",
    "rhsusf_mich_bare_norotos_semi_headset",
    "rhsusf_mich_bare_tan",
    "rhsusf_mich_bare_alt_tan",
    "rhsusf_mich_bare_tan_headset",
    "rhsusf_mich_bare_norotos_tan",
    "rhsusf_mich_bare_norotos_alt_tan",
    "rhsusf_mich_bare_norotos_alt_tan_headset",
    "rhsusf_mich_bare_norotos_arc_tan",
    "rhsusf_mich_bare_norotos_arc_alt_tan",
    "rhsusf_mich_bare_norotos_arc_alt_tan_headset",
    "rhsusf_mich_bare_norotos_tan_headset",
    "rhsusf_mich_helmet_marpatd",
    "rhsusf_mich_helmet_marpatd_alt",
    "rhsusf_mich_helmet_marpatd_alt_headset",
    "rhsusf_mich_helmet_marpatd_headset",
    "rhsusf_mich_helmet_marpatd_norotos",
    "rhsusf_mich_helmet_marpatd_norotos_arc",
    "rhsusf_mich_helmet_marpatd_norotos_arc_headset",
    "rhsusf_mich_helmet_marpatd_norotos_headset",
    "rhsusf_mich_helmet_marpatwd",
    "rhsusf_mich_helmet_marpatwd_alt",
    "rhsusf_mich_helmet_marpatwd_alt_headset",
    "rhsusf_mich_helmet_marpatwd_headset",
    "rhsusf_mich_helmet_marpatwd_norotos",
    "rhsusf_mich_helmet_marpatwd_norotos_arc",
    "rhsusf_mich_helmet_marpatwd_norotos_arc_headset",
    "rhsusf_mich_helmet_marpatwd_norotos_headset",
    "rhsusf_patrolcap_ocp",
    "rhsusf_patrolcap_ucp",
    "rhsusf_protech_helmet",
    "rhsusf_protech_helmet_ess",
    "rhsusf_protech_helmet_rhino",
    "rhsusf_protech_helmet_rhino_ess",
    "rhs_8point_marpatd",
    "rhs_8point_marpatwd",

    "BWA3_Booniehat_Fleck",
    "BWA3_Booniehat_Tropen",
    "BWA3_CrewmanKSK_Fleck_Headset",
    "BWA3_CrewmanKSK_Fleck",
    "BWA3_CrewmanKSK_Schwarz_Headset",
    "BWA3_CrewmanKSK_Schwarz",
    "BWA3_CrewmanKSK_Tropen_Headset",
    "BWA3_CrewmanKSK_Tropen",
    "BWA3_M92_Fleck",
    "BWA3_M92_Tropen",
    "BWA3_Knighthelm",
    "BWA3_MICH_Fleck",
    "BWA3_MICH_Tropen",
    "BWA3_OpsCore_Fleck_Camera",
    "BWA3_OpsCore_Fleck_Patch",
    "BWA3_OpsCore_Fleck",
    "BWA3_OpsCore_Schwarz_Camera",
    "BWA3_OpsCore_Schwarz",
    "BWA3_OpsCore_Tropen_Camera",
    "BWA3_OpsCore_Tropen_Patch",
    "BWA3_OpsCore_Tropen",
    "BWA3_OpsCore_Tropen",

    //UNIFORM
    "rhs_uniform_acu_ucp",
    "rhs_uniform_cu_ocp",
    "rhs_uniform_cu_ocp_101st",
    "rhs_uniform_cu_ocp_10th",
    "rhs_uniform_cu_ocp_1stcav",
    "rhs_uniform_cu_ocp_82nd",
    "rhs_uniform_cu_ucp",
    "rhs_uniform_cu_ucp_101st",
    "rhs_uniform_cu_ucp_10th",
    "rhs_uniform_cu_ucp_1stcav",
    "rhs_uniform_cu_ucp_82nd",
    "rhs_uniform_FROG01_d",
    "rhs_uniform_FROG01_wd",
    "rhs_uniform_g3_blk",
    "rhs_uniform_g3_m81",
    "rhs_uniform_g3_mc",
    "rhs_uniform_g3_rgr",
    "rhs_uniform_g3_tan",

    "BWA3_Uniform_Fleck",
    "BWA3_Uniform2_Fleck",
    "BWA3_Uniform_Ghillie_Fleck",
    "BWA3_Uniform_idz_Fleck",
    "BWA3_Uniform3_idz_Fleck",
    "BWA3_Uniform2_idz_Fleck",
    "BWA3_Uniform_Ghillie_idz_Fleck",
    "BWA3_Uniform_Crew_Fleck",
    "BWA3_Uniform_Tropen",
    "BWA3_Uniform2_Tropen",
    "BWA3_Uniform_Ghillie_Tropen",
    "BWA3_Uniform_idz_Tropen",
    "BWA3_Uniform3_idz_Tropen",
    "BWA3_Uniform2_idz_Tropen",
    "BWA3_Uniform_Ghillie_idz_Tropen",
    "BWA3_Uniform_Crew_Tropen",
    "BWA3_Uniform_Helipilot",
	
	"milgp_u_fleece_grey_g3_field_pants_aor1",
	"milgp_u_fleece_grey_g3_field_pants_aor2",
	"milgp_u_fleece_grey_g3_field_pants_M81",
	"milgp_u_fleece_grey_g3_field_pants_mc",
	"milgp_u_g3_field_set_aor1",
	"milgp_u_g3_field_set_aor2",
	"milgp_u_g3_field_set_m81",
	"milgp_u_g3_field_set_mc",
	"milgp_u_g3_field_set_rolled_aor1",
	"milgp_u_g3_field_set_rolled_aor2",
	"milgp_u_g3_field_set_rolled_m81",
	"milgp_u_g3_field_set_rolled_mc",
	"milgp_u_pcu_g3_field_pants_aor1",
	"milgp_u_pcu_g3_field_pants_aor2",
	"milgp_u_pcu_g3_field_pants_m81",
	"milgp_u_pcu_g3_field_pants_mc",
	"milgp_u_tshirt_g3_field_pants_aor1",
	"milgp_u_tshirt_g3_field_pants_aor2",
	"milgp_u_tshirt_g3_field_pants_M81",
	"milgp_u_tshirt_g3_field_pants_mc",

    "U_B_HeliPilotCoveralls",
    "U_B_PilotCoveralls",
    "U_B_Wetsuit",
    "U_B_FullGhillie_lsh",
    "U_B_FullGhillie_sard",
    "U_B_FullGhillie_ard",
     
    //VESTS
    "rhsusf_mbav",
    "rhsusf_mbav_grenadier",
    "rhsusf_mbav_light",
    "rhsusf_mbav_mg",
    "rhsusf_mbav_medic",
    "rhsusf_mbav_rifleman",
    "rhsusf_iotv_ucp",
    "rhsusf_iotv_ucp_Rifleman",
    "rhsusf_iotv_ucp_Grenadier",
    "rhsusf_iotv_ucp_SAW",
    "rhsusf_iotv_ucp_Medic",
    "rhsusf_iotv_ucp_Repair",
    "rhsusf_iotv_ucp_Teamleader",
    "rhsusf_iotv_ucp_Squadleader",
    "rhsusf_spcs_ucp",
    "rhsusf_spcs_ucp_rifleman",
    "rhsusf_iotv_ocp",
    "rhsusf_iotv_ocp_Rifleman",
    "rhsusf_iotv_ocp_Grenadier",
    "rhsusf_iotv_ocp_SAW",
    "rhsusf_iotv_ocp_Medic",
    "rhsusf_iotv_ocp_Repair",
    "rhsusf_iotv_ocp_Teamleader",
    "rhsusf_iotv_ocp_Squadleader",
    "rhsusf_spcs_ocp",
    "rhsusf_spcs_ocp_rifleman",
    "rhsusf_spc",
    "rhsusf_spc_corpsman",
    "rhsusf_spc_crewman",
    "rhsusf_spc_iar",
    "rhsusf_spc_light",
    "rhsusf_spc_mg",
    "rhsusf_spc_marksman",
    "rhsusf_spc_patchless",
    "rhsusf_spc_patchless_radio",
    "rhsusf_spc_rifleman",
    "rhsusf_spc_squadleader",
    "rhsusf_spc_teamleader",

    "BWA3_Vest_Fleck",
    "BWA3_Vest_Grenadier_Fleck",
    "BWA3_Vest_Leader_Fleck",
    "BWA3_Vest_Marksman_Fleck",
    "BWA3_Vest_Medic_Fleck",
    "BWA3_Vest_Autorifleman_Fleck",
    "BWA3_Vest_Rifleman1_Fleck",
    "BWA3_Vest_Tropen",
    "BWA3_Vest_Grenadier_Tropen",
    "BWA3_Vest_Leader_Tropen",
    "BWA3_Vest_Marksman_Tropen",
    "BWA3_Vest_Autorifleman_Tropen",
    "BWA3_Vest_Medic_Tropen",
    "BWA3_Vest_Rifleman1_Tropen",
    "BWA3_Vest_JPC_Radioman_Fleck",
    "BWA3_Vest_JPC_Leader_Fleck",
    "BWA3_Vest_JPC_Rifleman_Fleck",
    "BWA3_Vest_JPC_Radioman_Tropen",
    "BWA3_Vest_JPC_Leader_Tropen",
    "BWA3_Vest_JPC_Rifleman_Tropen",
	
	"milgp_v_jpc_assaulter_belt_cb",
	"milgp_v_jpc_assaulter_belt_mc",
	"milgp_v_jpc_assaulter_belt_rgr",
	"milgp_v_jpc_Grenadier_belt_cb",
	"milgp_v_jpc_Grenadier_belt_mc",
	"milgp_v_jpc_hgunner_belt_cb",
	"milgp_v_jpc_hgunner_belt_mc",
	"milgp_v_jpc_hgunner_belt_rgr",
	"milgp_v_jpc_marksman_belt_cb",
	"milgp_v_jpc_marksman_belt_mc",
	"milgp_v_jpc_marksman_belt_rgr",
	"milgp_v_jpc_medic_belt_cb",
	"milgp_v_jpc_medic_belt_mc",
	"milgp_v_jpc_medic_belt_rgr",
	"milgp_v_jpc_teamleader_belt_cb",
	"milgp_v_jpc_teamleader_belt_mc",
	"milgp_v_jpc_teamleader_belt_rgr",
	"milgp_v_jpc_assaulter_belt_AOR1",
	"milgp_v_jpc_assaulter_belt_AOR2",
	"milgp_v_jpc_Grenadier_belt_AOR1",
	"milgp_v_jpc_Grenadier_belt_AOR2",
	"milgp_v_jpc_hgunner_belt_AOR1",
	"milgp_v_jpc_hgunner_belt_AOR2",
	"milgp_v_jpc_marksman_belt_AOR1",
	"milgp_v_jpc_marksman_belt_AOR2",
	"milgp_v_jpc_medic_belt_AOR1",
	"milgp_v_jpc_medic_belt_AOR2",
	"milgp_v_jpc_teamleader_belt_AOR1",
	"milgp_v_jpc_teamleader_belt_AOR2",
	"milgp_v_marciras_assaulter_belt_cb",
	"milgp_v_marciras_assaulter_belt_rgr",
	"milgp_v_marciras_grenadier_belt_cb",
	"milgp_v_marciras_grenadier_belt_rgr",
	"milgp_v_marciras_hgunner_belt_cb",
	"milgp_v_marciras_hgunner_belt_rgr",
	"milgp_v_marciras_marksman_belt_cb",
	"milgp_v_marciras_marksman_belt_rgr",
	"milgp_v_marciras_medic_belt_cb",
	"milgp_v_marciras_medic_belt_rgr",
	"milgp_v_marciras_teamleader_belt_CB",
	"milgp_v_marciras_teamleader_belt_RGR",

    "V_RebreatherB",
    "V_TacVestIR_blk",

    "V_TacVest_blk",
    "V_TacVest_oli",
    "V_TacVest_khk",

    //GOOGLES
    "G_B_Diving",

    "rhs_googles_clear",
    "rhs_googles_orange",
    "rhs_googles_yellow",
    "rhs_googles_black",
    "rhs_ess_black",
    "rhsusf_oakley_goggles_blk",
    "rhsusf_oakley_goggles_clr",
    "rhsusf_oakley_goggles_ylw",
    "rhsusf_shemagh_grn",
    "rhsusf_shemagh2_grn",
    "rhsusf_shemagh_od",
    "rhsusf_shemagh2_od",
    "rhsusf_shemagh_tan",
    "rhsusf_shemagh2_tan",
    "rhsusf_shemagh_white",
    "rhsusf_shemagh2_white",
    "rhsusf_shemagh_gogg_grn",
    "rhsusf_shemagh2_gogg_grn",
    "rhsusf_shemagh_gogg_od",
    "rhsusf_shemagh2_gogg_od",
    "rhsusf_shemagh_gogg_white",
    "rhsusf_shemagh2_gogg_white",

    "UK3CB_BAF_G_Tactical_Black",
    "UK3CB_BAF_G_Tactical_Clear",
    "UK3CB_BAF_G_Tactical_Grey",
    "UK3CB_BAF_G_Tactical_Orange",
    "UK3CB_BAF_G_Tactical_Yellow",
    "UK3CB_BAF_G_Balaclava_Win",

    "BWA3_G_Combat_Clear",
    "BWA3_G_Combat_Orange",
    "BWA3_G_Combat_Black",

    //NVGs 
    "rhsusf_ANPVS_14",
    "rhsusf_ANPVS_15",
    "rhsusf_Rhino",

    //BINOCULARS
    "lerca_1200_black",
    "lerca_1200_tan",
    "Leupold_Mk4",

    "UK3CB_BAF_Soflam_Laserdesignator",
    "UK3CB_BAF_Javelin_CLU",

    "BWA3_Vector",

    "rhsusf_lrf_Vector21",

    "ACE_VectorDay",
    "ACE_Vector",
    "ACE_Yardage450",
    "ACE_MX2A",

    "Binocular",
    "Rangefinder",
    "Laserdesignator",
     
    //MAP
    "ItemMap",

    //GPSs
    "BWA3_ItemNaviPad",
	"FIR_PDU",
    "ItemGPS",
    "B_UavTerminal",

    //COMPASS
    "ItemCompass",

    //RADIOS
    "tf_rf7800str",
    "tf_anprc152",

    //WATCHES
    "ItemWatch",
    "tf_microdagr",
    "ACE_Altimeter",

    //ACE Stuff
    "tfw_dd",
    "tfw_whip",
    "tfw_blade",
    "tfw_rf3080Item",

    "ACE_SpareBarrel",
    "ACE_RangeTable_82mm",
    "ACE_adenosine",
    "ACE_ATragMX",
    "ACE_atropine",
    "ACE_Banana",
    "ACE_fieldDressing",
    "ACE_elasticBandage",
    "ACE_SpraypaintBlue",
    "ACE_bloodIV",
    "ACE_bloodIV_250",
    "ACE_bloodIV_500",
    "ACE_DAGR",
    "ACE_wirecutter",
    "ACE_RangeCard",
    "ACE_DefusalKit",
    "ACE_epinephrine",
    "ACE_Flashlight_MX991",
    "ACE_SpraypaintGreen",
    "ACE_HuntIR_monitor",
    "ACE_IR_Strobe_Item",
    "ACE_CableTie",
    "ACE_MapTools",
    "ACE_Kestrel4500",
    "ACE_EntrenchingTool",
    "ACE_Chemlight_Shield",
    "ACE_salineIV",
    "ACE_salineIV_250",
    "ACE_salineIV_500",
    "ACE_Flashlight_KSF1",
    "ACE_bodyBag",
    "ACE_M26_Clacker",
    "ACE_Clacker",
    "ACE_Flashlight_XL50",
    "ACE_microDAGR",
    "ACE_morphine",
    "ACE_packingBandage",
    "ACE_EarPlugs",
    "ACE_surgicalKit",
    "ACE_personalAidKit",
    "ACE_plasmaIV",
    "ACE_plasmaIV_250",
    "ACE_plasmaIV_500",
    "ACE_SpraypaintRed",
    "ACE_Sandbag_empty",
    "ACE_Tripod",
    "ACE_SpraypaintBlack",
    "ACE_SpottingScope",
    "ACE_DeadManSwitch",
    "ACE_tourniquet",
    "ACE_UAVBattery",
    "ACE_quikclot",
    "ToolKit",
    "MineDetector",

    //ATACHMENTS Pistol
    "rhsusf_acc_omega9k",
    "BWA3_muzzle_snds_MP7",
    "acc_flashlight_pistol",

    //ATACHMENTS Rifle
    "rhsusf_acc_g33_xps3",
    "rhsusf_acc_g33_T1",
    "rhsusf_acc_g33_xps3_tan",
    "rhsusf_acc_M2010S_d",
    "rhsusf_acc_M2010S_sa",
    "rhsusf_acc_M2010S_wd",
    "rhsusf_acc_T1_low",
    "rhsusf_acc_T1_high",
    "rhsusf_acc_T1_low_fwd",
    "rhsusf_acc_SR25S",
    "rhsusf_acc_anpas13gv1",
    "rhsusf_acc_ACOG2_USMC",
    "rhsusf_acc_ACOG3_USMC",
    "rhsusf_acc_ACOG_USMC",
    "rhsusf_acc_anpvs27",
    "rhsusf_acc_EOTECH",
    "rhsusf_acc_ELCAN",
    "rhsusf_acc_ELCAN_ard",
    "rhsusf_acc_ACOG",
    "rhsusf_acc_ACOG2",
    "rhsusf_acc_ACOG3",
    "rhsusf_acc_ACOG_anpvs27",
    "rhsusf_acc_M2A1",
    "rhsusf_acc_eotech_552",
    "rhsusf_acc_eotech_552_d",
    "rhsusf_acc_compm4",
    "rhsusf_acc_M8541",
    "rhsusf_acc_M8541_low",
    "rhsusf_acc_M8541_low_d",
    "rhsusf_acc_M8541_low_wd",
    "rhsusf_acc_premier_low",
    "rhsusf_acc_premier_anpvs27",
    "rhsusf_acc_premier",
    "rhsusf_acc_LEUPOLDMK4",
    "rhsusf_acc_LEUPOLDMK4_2",
    "rhsusf_acc_LEUPOLDMK4_2_d",
    "rhsusf_acc_SpecterDR",
    "rhsusf_acc_SpecterDR_OD",
    "rhsusf_acc_SpecterDR_D",
    "rhsusf_acc_SpecterDR_A",
    "rhsusf_acc_ACOG_MDO",
    "rhsusf_acc_ACOG_RMR",
    "rhsusf_acc_ACOG_d",
    "rhsusf_acc_ACOG_wd",
    "rhsusf_acc_eotech_xps3",
    "rhsusf_acc_anpeq15side",
    "rhsusf_acc_anpeq15_top",
    "rhsusf_acc_anpeq15_wmx_light",
    "rhsusf_acc_anpeq15_wmx",
    "rhsusf_acc_anpeq15side_bk",
    "rhsusf_acc_anpeq15_bk_top",
    "rhsusf_acc_anpeq15",
    "rhsusf_acc_anpeq15_light",
    "rhsusf_acc_anpeq15_bk",
    "rhsusf_acc_anpeq15_bk_light",
    "rhsusf_acc_anpeq15A",
    "rhsusf_acc_M952V",
    "rhsusf_acc_wmx",
    "rhsusf_acc_nt4_black",
    "rhsusf_acc_nt4_tan",
    "rhsusf_acc_rotex5_grey",
    "rhsusf_acc_rotex5_tan",
    "rhsusf_acc_SF3P556",
    "rhsusf_acc_SFMB556",
    "rhsusf_acc_grip2",
    "rhsusf_acc_grip2_tan",
    "rhsusf_acc_grip1",
    "rhsusf_acc_harris_bipod",
    "rhsusf_acc_harris_swivel",
    "rhsusf_acc_grip3",
    "rhsusf_acc_grip3_tan",
    "rhsusf_acc_rotex_mp7",
    "rhsusf_acc_rotex_mp7_aor1",
    "rhsusf_acc_rotex_mp7_desert",
    "rhsusf_acc_rotex_mp7_winter",

    "BWA3_muzzle_snds_G28",
    "BWA3_acc_LLM01_irlaser",
    "BWA3_optic_Aimpoint",
    "BWA3_optic_NSA80",
    "BWA3_acc_VarioRay_irlaser",
    "BWA3_optic_EOTech",
    "BWA3_optic_EOTech_tan",
    "BWA3_acc_LLM01_irlaser",
    "BWA3_optic_EOTech_tan_Mag_Off",
    "BWA3_acc_LLM01_irlaser_underbarrel",
    "BWA3_optic_EOTech_Mag_Off",
    "BWA3_muzzle_snds_G36",
    "BWA3_optic_G36C_Ironsight_100",
    "BWA3_optic_RSAS",
    "BWA3_optic_20x50",
    "BWA3_optic_Shortdot",
    "BWA3_optic_24x72",
    "BWA3_optic_ZO4x30_Single",
    "BWA3_optic_ZO4x30",
    "BWA3_optic_ZO4x30",
    "optic_DMS",
    "BWA3_optic_IRV600",
    "BWA3_optic_NSV600",
    "BWA3_optic_NSV80",

    //ATTACHMENTS Launcher
    "rhs_weap_optic_smaw",
    "rhs_optic_maaws",
    "BWA3_optic_CarlGustaf"

], false, true] call xla_fnc_addVirtualItemCargo;

//[_box, [WEST_SIDE,FRIENDLY_SIDE],true,false] call XLA_fnc_addVirtualSideCargo;
//[_box, ["arifle_Katiba_BASE_F"],true,false] call XLA_fnc_addVirtualWeaponCargo;

// Start the arsenal on it
_addActionText = "<t color=""#11F22F"">" + "Arsenal";
["AmmoboxInit",[_box,false,{true},_addActionText,false]] spawn XLA_fnc_arsenal;

} forEach _box; //[arsenal1, arsenal2, arsenal3]; //, arsenal2, arsenal3, arsenal4, arsenal5, arsenal6];