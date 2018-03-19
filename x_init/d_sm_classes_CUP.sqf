d_sm_fortress = "Land_Cargo_House_V2_F";
d_functionary = "C_Nikos_aged";
d_fuel_station = "Land_FuelStation_Build_F";//Land_FuelStation_Shed_F
d_sm_cargo = switch (d_enemy_side_short) do {
	case "E": {"rhs_kamaz5350_flatbed_cover_msv"};
	case "W": {"rhs_kamaz5350_flatbed_cover_msv"};
	case "G": {"rhs_kamaz5350_flatbed_cover_msv"};
};
//d_sm_hangar = "Land_TentHangar_V1_F"; // Land_TentHangar_V1_F creates 3 objects and adding a killed eh makes it useless as the correct object might never get destroyed
d_sm_hangar = "Land_Hangar_F";
d_sm_tent = "Land_TentA_F";

d_sm_land_tankbig = "Land_dp_bigTank_F";
d_sm_land_transformer = "Land_dp_transformer_F";
d_sm_barracks = "Land_i_Barracks_V2_F";
d_sm_land_tanksmall = "Land_dp_smallTank_F";
d_sm_land_factory = "Land_u_Barracks_V2_F";
d_sm_small_radar = "Land_Radar_Small_F";

d_soldier_officer = switch (d_enemy_side_short) do {
	case "E": {"rhs_msv_emr_officer_armored"};
	case "W": {"B_officer_F"};
	case "G": {"I_officer_F"};
};
d_sniper = switch (d_enemy_side_short) do {
	case "E": {"rhs_msv_emr_marksman"};
	case "W": {"B_sniper_F"};
	case "G": {"I_sniper_F"};
};
d_sm_arty = switch (d_enemy_side_short) do {
	case "E": {"rhs_D30_msv"};
	case "W": {"B_MBT_01_arty_F"};
	case "G": {"B_MBT_01_arty_F"}; // no independent arty in Alpha 3
};
d_sm_plane = switch (d_enemy_side_short) do {
	case "E": {"RHS_Su25SM_vvsc"};
	case "W": {"B_Plane_CAS_01_F"};
	case "G": {"I_Plane_Fighter_03_CAS_F"};
};
d_sm_tank = switch (d_enemy_side_short) do {
	case "E": {"rhs_t90a_tv"};
	case "W": {"B_MBT_01_cannon_F"};
	case "G": {"I_MBT_03_cannon_F"};
};
d_sm_HunterGMG = switch (d_enemy_side_short) do {
	case "E": {"rhs_tigr_sts_3camo_msv"};
	case "W": {"B_MRAP_01_gmg_F"};
	case "G": {"I_MRAP_03_hmg_F"};
};
d_sm_chopper = switch (d_enemy_side_short) do {
	case "E": {"RHS_Mi24V_vvsc"};
	case "W": {"B_Heli_Attack_01_F"};
	case "G": {"I_Heli_light_03_F"};
};
d_sm_pilottype = switch (d_enemy_side_short) do {
	case "E": {"B_Helipilot_F"};
	case "W": {"O_helipilot_F"};
	case "G": {"I_helipilot_F"};
};
d_sm_wrecktype = switch (d_enemy_side_short) do {
	case "E": {"Land_rhs_mi28_wreck2"};
	case "W": {"Land_UWreck_Heli_Attack_02_F"};
	case "G": {"Land_Wreck_Heli_Attack_02_F"};
};
d_sm_ammotrucktype = switch (d_enemy_side_short) do {
	case "E": {"rhs_gaz66_ammo_msv"};
	case "W": {"B_Truck_01_ammo_F"};
	case "G": {"I_Truck_02_ammo_F"};
};
d_sm_medtrucktype = switch (d_enemy_side_short) do {
	case "E": {"rhs_gaz66_ap2_msv"};
	case "W": {"B_Truck_01_medical_F"};
	case "G": {"I_Truck_02_medical_F"};
};
d_sm_deliver_truck = switch (d_enemy_side_short) do {
	case "E": {["rhsusf_M977A4_REPAIR_BKIT_usarmy_d", "rhsusf_M977A4_AMMO_BKIT_usarmy_d", "rhsusf_M978A4_BKIT_usarmy_d", "rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy"]};
	case "W": {["O_Truck_03_repair_F", "O_Truck_03_ammo_F", "O_Truck_03_fuel_F", "O_Truck_03_medical_F"]};
	case "G": {["I_Truck_03_repair_F", "I_Truck_03_ammo_F", "I_Truck_03_fuel_F", "I_Truck_03_medical_F"]};
};
