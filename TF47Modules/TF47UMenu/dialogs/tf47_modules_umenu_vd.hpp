class tf47_modules_umenu_vd_dialog
{
	idd = -1;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['tf47_modules_umenu_vd_dialog_var',_this select 0]; [] spawn tf47_modules_umenu_fnc_initVd;";
	onUnLoad = "uiNamespace setVariable ['tf47_modules_umenu_vd_dialog_var',nil]";
	class ControlsBackground
	{
		class tf47_modules_umenu_vd_background: tf47_modules_sp_base_rsctext
		{
			idc = 1000;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};

		class tf47_modules_umenu_vd_title: tf47_modules_sp_base_rsctext
		{
			idc = 1001;
			text = "TF47 U-Menu"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.397 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
				1
			};
		};
		class tf47_modules_umenu_vd_foot_text: tf47_modules_sp_base_rsctext
		{
			idc = 1002;
			text = "On Foot:"; //--- ToDo: Localize;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_umenu_vd_car_text: tf47_modules_sp_base_rsctext
		{
			idc = 1003;
			text = "In Car:"; //--- ToDo: Localize;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_umenu_vd_air_text: tf47_modules_sp_base_rsctext
		{
			idc = 1004;
			text = "In Air:"; //--- ToDo: Localize;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_umenu_vd_grass_text: tf47_modules_sp_base_rsctext
		{
			idc = 1006;
			text = "Grass:"; //--- ToDo: Localize;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_umenu_vd_object_text: tf47_modules_sp_base_rsctext
		{
			idc = 1007;
			text = "Object:"; //--- ToDo: Localize;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class Controls
	{
		class tf47_modules_umenu_vd_foot_slider: tf47_modules_umenu_base_slider
		{
			idc = 1900;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorActive[] = {1,1,1,1};
			onSliderPosChanged = "[0, 1900, _this select 1] call tf47_modules_umenu_fnc_onValueChange;";
		};
		class tf47_modules_umenu_vd_foot_edit: tf47_modules_umenu_base_rscedit
		{
			idc = 1400;
			text = "10000"; //--- ToDo: Localize;
			x = 0.554 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.022 * safezoneH;
			onKeyUp = "[0, 1400, -1] call tf47_modules_umenu_fnc_onValueChange;";
		};
		class tf47_modules_umenu_vd_car_slider: tf47_modules_umenu_base_slider
		{
			idc = 1901;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorActive[] = {1,1,1,1};
			onSliderPosChanged = "[1, 1901, _this select 1] call tf47_modules_umenu_fnc_onValueChange;";
		};
		class tf47_modules_umenu_vd_air_slider: tf47_modules_umenu_base_slider
		{
			idc = 1902;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorActive[] = {1,1,1,1};
			onSliderPosChanged = "[2, 1902, _this select 1] call tf47_modules_umenu_fnc_onValueChange;";
		};
		class tf47_modules_umenu_vd_car_edit: tf47_modules_umenu_base_rscedit
		{
			idc = 1401;
			text = "10000"; //--- ToDo: Localize;
			x = 0.554 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.022 * safezoneH;
			onKeyUp = "[1, 1401, -1] call tf47_modules_umenu_fnc_onValueChange;";
		};
		class tf47_modules_umenu_vd_air_edit: tf47_modules_umenu_base_rscedit
		{
			idc = 1402;
			text = "10000"; //--- ToDo: Localize;
			x = 0.554 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.022 * safezoneH;
			onKeyUp = "[2, 1402, -1] call tf47_modules_umenu_fnc_onValueChange;";
		};
		class tf47_modules_umenu_vd_object_slider: tf47_modules_umenu_base_slider
		{
			idc = 1903;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorActive[] = {1,1,1,1};
			onSliderPosChanged = "[3, 1903, _this select 1] call tf47_modules_umenu_fnc_onValueChange;";
		};
		class tf47_modules_umenu_vd_grass_combo: tf47_modules_umenu_base_combo
		{
			idc = 1904;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorActive[] = {1,1,1,1};
			onLBSelChanged = "tf47_modules_umenu_vd_vdterrain = call compile lbData [1904, _this select 1]; [] call tf47_modules_umenu_fnc_updateViewDistance;";
		};
		class tf47_modules_umenu_vd_object_edit: tf47_modules_umenu_base_rscedit
		{
			idc = 1403;
			text = "10000"; //--- ToDo: Localize;
			x = 0.554 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.022 * safezoneH;
			onKeyUp = "[3, 1403, -1] call tf47_modules_umenu_fnc_onValueChange;";
		};
		class tf47_modules_umenu_vd_close_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1604;
			text = "Close"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.601 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0;";
		};
		class tf47_modules_umenu_vd_back_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1605;
			text = "Back"; //--- ToDo: Localize;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.601 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0; createDialog 'tf47_modules_umenu_main_dialog';";
		};
		class tf47_modules_umenu_vd_save_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1606;
			text = "Save permanently"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.601 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.022 * safezoneH;
			action = "[] call tf47_modules_umenu_fnc_saveViewDistance;";
		};
	};
};
