class tf47_modules_umenu_gnc_dialog
{
	idd = -1;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['tf47_modules_umenu_gnc_dialog_var',_this select 0]; [] spawn tf47_modules_umenu_fnc_initGnc;";
	onUnLoad = "uiNamespace setVariable ['tf47_modules_umenu_gnc_dialog_var',nil]";
	class ControlsBackground
	{
		class tf47_modules_umenu_gnc_background: tf47_modules_sp_base_rsctext
		{
			idc = 1000;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.121 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class tf47_modules_umenu_gnc_title: tf47_modules_sp_base_rsctext
		{
			idc = 1001;
			text = "TF47 U-Menu"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
				1
			};
		};
		class tf47_modules_umenu_gnc_oldgroupname_text: tf47_modules_sp_base_rsctext
		{
			idc = 1002;
			text = "Current group name:"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_umenu_gnc_newgroupname_text: tf47_modules_sp_base_rsctext
		{
			idc = 1003;
			text = "New group name:"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.505 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class Controls
	{
		class tf47_modules_umenu_gnc_newname_edit: tf47_modules_umenu_base_rscedit
		{
			idc = 1401;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class tf47_modules_umenu_gnc_oldname_edit: tf47_modules_umenu_base_rscedit
		{
			idc = 1400;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			canModify = 0;
		};
		class tf47_modules_umenu_gnc_close_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.5685 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0;";
		};
		class tf47_modules_umenu_gnc_back_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1601;
			text = "Back"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.5685 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0; createDialog 'tf47_modules_umenu_main_dialog';";
		};
		class tf47_modules_umenu_gnc_apply_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1602;
			text = "Apply"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.5685 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "if((ctrlText 1401) != '') then {(group player) setGroupIdGlobal [(ctrlText 1401)]; ctrlSetText [1400,groupId (group player)]; ctrlSetText [1401, ''];};";
		};
	};
};
