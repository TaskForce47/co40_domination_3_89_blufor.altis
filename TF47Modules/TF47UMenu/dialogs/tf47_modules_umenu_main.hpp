class tf47_modules_umenu_main_dialog
{
	idd = -1;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['tf47_modules_umenu_main_dialog_var',_this select 0]; [] spawn tf47_modules_umenu_fnc_initMain;";
	onUnLoad = "uiNamespace setVariable ['tf47_modules_umenu_main_dialog_var',nil]";
	class ControlsBackground
	{
		class tf47_modules_umenu_main_background: tf47_modules_sp_base_rsctext
		{
			idc = 1000;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.231 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class tf47_modules_umenu_main_title: tf47_modules_sp_base_rsctext
		{
			idc = 1002;
			text = "TF47 U-Menu"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.365 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
				1
			};
		};
		class tf47_modules_umenu_main_ticket_text: tf47_modules_sp_base_rsctext
		{
			idc = 1001;
			text = "Current Tickets:"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_umenu_main_curticket_text: tf47_modules_sp_base_rsctext
		{
			idc = 1003;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class tf47_modules_umenu_main_slotcost_text: tf47_modules_sp_base_rsctext
		{
			idc = 1004;
			text = "Your slot costs:"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_umenu_main_curslotcost_text: tf47_modules_sp_base_rsctext
		{
			idc = 1005;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class Controls
	{
		class tf47_modules_umenu_main_freqtrack_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1600;
			text = "Frequency Tracker"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
			action = "closeDialog 0; createDialog 'tf47_modules_umenu_ft_dialog';";
		};
		class tf47_modules_umenu_main_vd_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1601;
			text = "Viewdistance Settings"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
			action = "closeDialog 0; createDialog 'tf47_modules_umenu_vd_dialog';";
		};
		class tf47_modules_umenu_main_groupname_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1602;
			text = "Change group name"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
			action = "closeDialog 0; createDialog 'tf47_modules_umenu_gnc_dialog'";
		};
		class tf47_modules_umenu_main_close_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1603;
			text = "Close"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0;";
		};
	};
};
