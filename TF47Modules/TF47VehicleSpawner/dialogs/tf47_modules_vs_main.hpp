class tf47_modules_vs_main_dialog
{
	idd = -1;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['tf47_modules_vs_main_dialog_var',_this select 0]; [] spawn tf47_modules_vs_fnc_initMain;";
	onUnLoad = "uiNamespace setVariable ['tf47_modules_vs_main_dialog_var',nil]";
    class ControlsBackground
    {
        class tf47_modules_vs_main_background: tf47_modules_vs_base_rsctext
        {
        	idc = 1000;

        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.357 * safezoneH + safezoneY;
        	w = 0.2475 * safezoneW;
        	h = 0.286 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0.8};
        };
        class tf47_modules_vs_main_title: tf47_modules_vs_base_rsctext
        {
        	idc = 1001;
        	textSize = 1;

        	text = "TF47 Vehicle Spawner"; //--- ToDo: Localize;
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
        };
		class RscText_1007: tf47_modules_sp_base_rsctext
		{
			idc = 1007;
			text = "Fahrzeug"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1008: tf47_modules_sp_base_rsctext
		{
			idc = 1007;
			text = "Tickets"; //--- ToDo: Localize;
			x = 0.55 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1009: tf47_modules_sp_base_rsctext
		{
			idc = 1008;
			text = "WL ID"; //--- ToDo: Localize;
			x = 0.585 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
    };
    class Controls
    {
        class tf47_modules_vs_main_close_button: tf47_modules_vs_base_rscbutton_main
        {
        	idc = 1600;
        	action = "closeDialog 0;";
        	text = "Schließen"; //--- ToDo: Localize;
        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.64498 * safezoneH + safezoneY;
        	w = 0.042 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0.8};
        };
        class tf47_modules_vs_main_apply_button: tf47_modules_vs_base_rscbutton_main
        {
        	idc = 1603;
        	action = "[] call tf47_modules_vs_fnc_spawnVehicle;";
        	text = "Spawnen"; //--- ToDo: Localize;
        	x = 0.578478 * safezoneW + safezoneX;
        	y = 0.64498 * safezoneH + safezoneY;
        	w = 0.045 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0.8};
        };
        class tf47_modules_vs_main_despawn_button: tf47_modules_vs_base_rscbutton_main
        {
        	idc = 1603;
        	action = "[((call compile (lnbData [1500, [0, 0]])) select 0)] remoteExec ['tf47_modules_vs_fnc_despawnVehicle', 2]";
        	text = "Despawnen"; //--- ToDo: Localize;
        	x = 0.525 * safezoneW + safezoneX;
        	y = 0.64498 * safezoneH + safezoneY;
        	w = 0.05 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0.8};
        };
        class tf47_modules_vs_main_vehiclelist_listbox: tf47_modules_vs_adv_listbox
        {
            columns[] = {0,0.73,0.85};
        	idc = 1500;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.242 * safezoneH;
        };
        class tf47_modules_vs_main_firstbox_frame: tf47_modules_vs_base_frame
        {
        	idc = 1800;
        	x = 0.381406 * safezoneW + safezoneX;
        	y = 0.368 * safezoneH + safezoneY;
        	w = 0.17 * safezoneW;
        	h = 0.264 * safezoneH;
        };
		class tf47_modules_vs_main_firstboxtitle_frame: tf47_modules_vs_base_frame
		{
			idc = 1801;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.17 * safezoneW;
			h = 0.022 * safezoneH;
		};
        class tf47_modules_vs_main_secondbox_frame: tf47_modules_vs_base_frame
        {
        	idc = 1802;
        	x = 0.55 * safezoneW + safezoneX;
        	y = 0.368 * safezoneH + safezoneY;
        	w = 0.035 * safezoneW;
        	h = 0.264 * safezoneH;
        };
		class tf47_modules_vs_main_secondboxtitle_frame: tf47_modules_vs_base_frame
		{
			idc = 1803;
			x = 0.55 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.035 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_vs_main_thridbox_frame: tf47_modules_vs_base_frame
		{
			idc = 1804;
			x = 0.585 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0325 * safezoneW;
			h = 0.264 * safezoneH;
		};
		class tf47_modules_vs_main_thridboxtitle_frame: tf47_modules_vs_base_frame
		{
			idc = 1805;
			x = 0.585 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0325 * safezoneW;
			h = 0.022 * safezoneH;
		};
    };
};
