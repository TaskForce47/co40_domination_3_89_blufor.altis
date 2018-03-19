////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Willard, v1.063, #Nifima)
////////////////////////////////////////////////////////
class tf47_modules_sp_tankammo_dialog
{
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['tf47_modules_sp_tankammo_dialog_var',_this select 0]; [(player getVariable['tf47_modules_sp_vehicle', player])] spawn tf47_modules_servicepoint_fnc_initTankammo;";
	onUnLoad = "uiNamespace setVariable ['tf47_modules_sp_tankammo_dialog_var',nil]";
	class ControlsBackground
    {
		class tf47_modules_sp_tankammo_background: tf47_modules_sp_base_rsctext
		{
			idc = 1000;

			x = 0.37625 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class tf47_modules_sp_tankammo_title: tf47_modules_sp_base_rsctext
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
		class tf47_modules_sp_tankammo_ammoText1: tf47_modules_sp_base_rsctext
		{
			idc = 1002;
			text = "Munition"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_sp_tankammo_countText1: tf47_modules_sp_base_rsctext
		{
			idc = 1003;
			text = "Anzahl"; //--- ToDo: Localize;
			x = 0.58 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_sp_tankammo_ammoText2: tf47_modules_sp_base_rsctext
		{
			idc = 1007;
			text = "Munition"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_sp_tankammo_countText2: tf47_modules_sp_base_rsctext
		{
			idc = 1008;
			text = "Anzahl"; //--- ToDo: Localize;
			x = 0.58 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_sp_tankammo_ammoText3: tf47_modules_sp_base_rsctext
		{
			idc = 1009;
			text = "Munition"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_sp_tankammo_countText3: tf47_modules_sp_base_rsctext
		{
			idc = 1010;
			text = "Anzahl"; //--- ToDo: Localize;
			x = 0.58 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
		};class tf47_modules_sp_tankammo_subtitle: tf47_modules_sp_base_rsctext
		{
			idc = 1011;
			text = "Panzerbewaffnung ändern"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class Controls
	{
		class tf47_modules_sp_tankammo_close_button: tf47_modules_sp_base_rscbutton_main
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
		class tf47_modules_sp_tankammo_back_button: tf47_modules_sp_base_rscbutton_main
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
		class tf47_modules_sp_tankammo_apply_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1603;
			action = "[(player getVariable['tf47_modules_sp_vehicle', player])] spawn tf47_modules_servicepoint_fnc_applyTankammo";
			text = "Anwenden"; //--- ToDo: Localize;
			x = 0.578478 * safezoneW + safezoneX;
			y = 0.64498 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};

		class tf47_modules_sp_tankammo_edit1: tf47_modules_sp_base_rscedit
		{
			idc = 1400;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_sp_tankammo_dropdown1: tf47_modules_sp_base_combo
		{
			idc = 2100;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class tf47_modules_sp_tankammo_dropdown2: tf47_modules_sp_base_combo
		{
			idc = 2101;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class tf47_modules_sp_tankammo_edit2: tf47_modules_sp_base_rscedit
		{
			idc = 1401;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class tf47_modules_sp_tankammo_dropdown3: tf47_modules_sp_base_combo
		{
			idc = 2102;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class tf47_modules_sp_tankammo_edit3: tf47_modules_sp_base_rscedit
		{
			idc = 1402;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};