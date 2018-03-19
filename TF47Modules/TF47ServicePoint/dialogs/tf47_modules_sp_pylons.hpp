class tf47_modules_sp_pylons_dialog
{
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['tf47_modules_sp_pylons_dialog_var',_this select 0]; [(player getVariable['tf47_modules_sp_vehicle', player])] spawn tf47_modules_servicepoint_fnc_initPylons;";
	onUnLoad = "uiNamespace setVariable ['tf47_modules_sp_pylons_dialog_var',nil]";
	class ControlsBackground
    {
		class tf47_modules_sp_pylons_background: tf47_modules_sp_base_rsctext
		{
			idc = 1000;

			x = 0.37625 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class tf47_modules_sp_pylons_title: tf47_modules_sp_base_rsctext
		{
			idc = 1001;
			textSize = 1;

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
		};
		class tf47_modules_sp_pylons_content_frame: tf47_modules_sp_base_frame
		{
			idc = 1801;

			text = "Magazine"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.264 * safezoneH;
		};
		class tf47_modules_sp_pylons_loadout_frame: tf47_modules_sp_base_frame
		{
			idc = 1800;

			text = "Pylons"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.264 * safezoneH;
		};
	};
	class Controls
    {
		class tf47_modules_sp_pylons_close_button: tf47_modules_sp_base_rscbutton_main
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
		class tf47_modules_sp_pylons_back_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1601;
			action = "closeDialog 0;";

			text = "Zurück"; //--- ToDo: Localize;
			x = 0.424512 * safezoneW + safezoneX;
			y = 0.64498 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class tf47_modules_sp_pylons_apply_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1603;
			action = "[(player getVariable['tf47_modules_sp_vehicle', player])] spawn tf47_modules_servicepoint_fnc_applyPylons";

			text = "Anwenden"; //--- ToDo: Localize;
			x = 0.578478 * safezoneW + safezoneX;
			y = 0.64498 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class tf47_modules_sp_pylons_pylons_listbox: tf47_modules_sp_base_listbox
		{
			onLBSelChanged = "[_this select 1] call tf47_modules_servicepoint_fnc_updatePylonContent;";
			idc = 1500;

			x = 0.386562 * safezoneW + safezoneX;
			y = 0.387 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.237 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class tf47_modules_sp_pylons_content_listbox: tf47_modules_sp_base_listbox
		{
			idc = 1501;
			onLBSelChanged = "[_this select 1] call tf47_modules_servicepoint_fnc_updatePylonMagazineContent;";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.387 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.237 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
	};
};