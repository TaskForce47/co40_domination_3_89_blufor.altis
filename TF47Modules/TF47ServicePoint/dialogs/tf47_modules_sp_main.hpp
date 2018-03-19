class tf47_modules_sp_main_dialog
{
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['tf47_modules_sp_main_dialog_var',_this select 0]; [] spawn tf47_modules_servicepoint_fnc_initMain;";
	onUnLoad = "uiNamespace setVariable ['tf47_modules_sp_main_dialog_var',nil]";
    class ControlsBackground
    {
        class tf47_modules_sp_main_background: tf47_modules_sp_base_rsctext
        {
        	idc = 1000;

        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.357 * safezoneH + safezoneY;
        	w = 0.2475 * safezoneW;
        	h = 0.286 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0.8};
        };
        class tf47_modules_sp_main_title: tf47_modules_sp_base_rsctext
        {
        	idc = 1001;

        	text = "TF47 Service Point"; //--- ToDo: Localize;
        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.33302 * safezoneH + safezoneY;
        	w = 0.2475 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
                1
            };
            textSize = 1;
        };
        class tf47_modules_sp_main_status_frame: tf47_modules_sp_base_frame
        {
        	idc = 1800;
        	text = "Fahrzeug Status"; //--- ToDo: Localize;
        	x = 0.381406 * safezoneW + safezoneX;
        	y = 0.401 * safezoneH + safezoneY;
        	w = 0.134062 * safezoneW;
        	h = 0.231 * safezoneH;
        	//sizeEx = 1 * GUI_GRID_H;
        };
        class tf47_modules_sp_main_vehicle_picture: tf47_modules_sp_base_picture
        {
        	idc = 1200;
        	text = "\A3\armor_f_beta\APC_Tracked_01\Data\UI\APC_Tracked_01_CRV_ca.paa";
        	x = 0.391719 * safezoneW + safezoneX;
        	y = 0.368 * safezoneH + safezoneY;
        	w = 0.0309375 * safezoneW;
        	h = 0.033 * safezoneH;
        	//sizeEx = 1 * GUI_GRID_H;
        };
        class tf47_modules_sp_main_vehicle_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1002;
        	text = "Bobcat "; //--- ToDo: Localize;
        	x = 0.427812 * safezoneW + safezoneX;
        	y = 0.368 * safezoneH + safezoneY;
        	w = 0.190781 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_inventory_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1003;
        	text = "Freier Inventarplatz:"; //--- ToDo: Localize;
        	x = 0.382 * safezoneW + safezoneX;
        	y = 0.555 * safezoneH + safezoneY;
        	w = 0.0979687 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_fuel_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1004;
        	text = "Treibstoff:"; //--- ToDo: Localize;
        	x = 0.382 * safezoneW + safezoneX;
        	y = 0.489 * safezoneH + safezoneY;
        	w = 0.0979687 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_damage_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1005;
        	text = "Schaden:"; //--- ToDo: Localize;
        	x = 0.382 * safezoneW + safezoneX;
        	y = 0.456 * safezoneH + safezoneY;
        	w = 0.0979687 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_ammo_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1006;
        	text = "Munition:"; //--- ToDo: Localize;
        	x = 0.382 * safezoneW + safezoneX;
        	y = 0.522 * safezoneH + safezoneY;
        	w = 0.0979687 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_damage_percent_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1007;
        	text = "100%"; //--- ToDo: Localize;
        	x = 0.484531 * safezoneW + safezoneX;
        	y = 0.456 * safezoneH + safezoneY;
        	w = 0.0257812 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_aceinventory_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1009;
        	text = "Freier ACE Inventarplatz:"; //--- ToDo: Localize;
        	x = 0.382 * safezoneW + safezoneX;
        	y = 0.588 * safezoneH + safezoneY;
        	w = 0.1 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_fuel_percent_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1008;
        	text = "100%"; //--- ToDo: Localize;
        	x = 0.484531 * safezoneW + safezoneX;
        	y = 0.489 * safezoneH + safezoneY;
        	w = 0.0257812 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_ammo_percent_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1010;
        	text = "100%"; //--- ToDo: Localize;
        	x = 0.484531 * safezoneW + safezoneX;
        	y = 0.522 * safezoneH + safezoneY;
        	w = 0.0257812 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_inventory_percent_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1011;
        	text = "100%"; //--- ToDo: Localize;
        	x = 0.484531 * safezoneW + safezoneX;
        	y = 0.555 * safezoneH + safezoneY;
        	w = 0.0257812 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_aceinventory_percent_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1016;
        	text = "100%"; //--- ToDo: Localize;
        	x = 0.484531 * safezoneW + safezoneX;
        	y = 0.588 * safezoneH + safezoneY;
        	w = 0.0257812 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_repair_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1017;
        	text = "Reparieren"; //--- ToDo: Localize;
        	x = 0.54125 * safezoneW + safezoneX;
        	y = 0.456 * safezoneH + safezoneY;
        	w = 0.0464063 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_refuel_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1018;
        	text = "Auftanken"; //--- ToDo: Localize;
        	x = 0.54125 * safezoneW + safezoneX;
        	y = 0.489 * safezoneH + safezoneY;
        	w = 0.061875 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_rearm_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1019;
        	text = "Aufmunitionieren"; //--- ToDo: Localize;
        	x = 0.54125 * safezoneW + safezoneX;
        	y = 0.522 * safezoneH + safezoneY;
        	w = 0.1 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_clearinv_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1020;
        	text = "Inventar leeren"; //--- ToDo: Localize;
        	x = 0.54125 * safezoneW + safezoneX;
        	y = 0.555 * safezoneH + safezoneY;
        	w = 0.061875 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_clearaceinv_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1021;
        	text = "ACE Inv. leeren"; //--- ToDo: Localize;
        	x = 0.54125 * safezoneW + safezoneX;
        	y = 0.588 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_service_frame: tf47_modules_sp_base_frame
        {
        	idc = 1801;
        	text = "Service Möglichkeiten"; //--- ToDo: Localize;
        	x = 0.520625 * safezoneW + safezoneX;
        	y = 0.401 * safezoneH + safezoneY;
        	w = 0.0979687 * safezoneW;
        	h = 0.231 * safezoneH;
        	//sizeEx = 1 * GUI_GRID_H;
        };
        class tf47_modules_sp_main_status_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1023;
        	text = "Status:"; //--- ToDo: Localize;
        	x = 0.382 * safezoneW + safezoneX;
        	y = 0.423 * safezoneH + safezoneY;
        	w = 0.0979687 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_status_ready_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1024;
        	text = "       Bereit"; //--- ToDo: Localize;
        	x = 0.46 * safezoneW + safezoneX;
        	y = 0.423 * safezoneH + safezoneY;
        	w = 0.045 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_respawn_text: tf47_modules_sp_base_rsctext
        {
        	idc = 1022;
        	text = "Despawn"; //--- ToDo: Localize;
        	x = 0.54125 * safezoneW + safezoneX;
        	y = 0.423 * safezoneH + safezoneY;
        	w = 0.04125 * safezoneW;
        	h = 0.033 * safezoneH;
        };
    };

    class Controls
    {
        class tf47_modules_sp_main_close_button: tf47_modules_sp_base_rscbutton_main
        {
        	idc = 1600;
        	action = "closeDialog 0;";

        	text = "Schließen"; //--- ToDo: Localize;
        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.645 * safezoneH + safezoneY;
        	w = 0.042 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0.8};
        };
        class tf47_modules_sp_main_loadout_button: tf47_modules_sp_base_rscbutton_main
        {
        	idc = 1602;
        	action = "createDialog 'tf47_modules_sp_loadout_dialog';";

        	text = "Loadouts"; //--- ToDo: Localize;
        	x = 0.530937 * safezoneW + safezoneX;
        	y = 0.645 * safezoneH + safezoneY;
        	w = 0.04125 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0.8};
        };
        class tf47_modules_sp_main_apply_button: tf47_modules_sp_base_rscbutton_main
        {
        	idc = 1603;
        	action = "[(player getVariable['tf47_modules_sp_vehicle', player])] spawn tf47_modules_servicepoint_fnc_applyService;";

        	text = "Anwenden"; //--- ToDo: Localize;
        	x = 0.5785 * safezoneW + safezoneX;
        	y = 0.645 * safezoneH + safezoneY;
        	w = 0.045 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0.8};
        };
		class tf47_modules_sp_main_pylon_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1601;
			action = "if(count ((tf47_modules_sp_ammo_tankAmmo select 0) select {(player getVariable['tf47_modules_sp_vehicle', player]) isKindOf _x}) >= 1) then { createDialog 'tf47_modules_sp_tankammo_dialog'; } else { createDialog 'tf47_modules_sp_pylons_dialog' };";
			text = "Bewaffnung";
			x = 0.424512 * safezoneW + safezoneX;
			y = 0.64498 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
        class tf47_modules_sp_main_repair_checkbox: tf47_modules_sp_base_checkbox
        {
        	idc = 2800;
        	x = 0.525781 * safezoneW + safezoneX;
        	y = 0.456 * safezoneH + safezoneY;
        	w = 0.0154688 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_refuel_checkbox: tf47_modules_sp_base_checkbox
        {
        	idc = 2801;
        	x = 0.525781 * safezoneW + safezoneX;
        	y = 0.489 * safezoneH + safezoneY;
        	w = 0.0154688 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_rearm_checkbox: tf47_modules_sp_base_checkbox
        {
        	idc = 2802;
        	x = 0.525781 * safezoneW + safezoneX;
        	y = 0.522 * safezoneH + safezoneY;
        	w = 0.0154688 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_clearinv_checkbox: tf47_modules_sp_base_checkbox
        {
        	idc = 2803;
        	x = 0.525781 * safezoneW + safezoneX;
        	y = 0.555 * safezoneH + safezoneY;
        	w = 0.0154688 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_clearaceinv_checkbox: tf47_modules_sp_base_checkbox
        {
        	idc = 2804;
        	x = 0.525781 * safezoneW + safezoneX;
        	y = 0.588 * safezoneH + safezoneY;
        	w = 0.0154688 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class tf47_modules_sp_main_respawn_checkbox: tf47_modules_sp_base_checkbox
        {
			onCheckedChanged = "[_this select 1] call tf47_modules_servicepoint_fnc_onRespawnCheckedChanged";
            idc = 2805;
            x = 0.525781 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.033 * safezoneH;
        };
    };
};
