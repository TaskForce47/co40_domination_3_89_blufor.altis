class tf47_modules_sp_loadout_dialog
{
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['tf47_modules_sp_loadout_dialog_var',_this select 0]; [(player getVariable['tf47_modules_sp_vehicle', player])] spawn tf47_modules_servicepoint_fnc_initLoadout;";
	onUnLoad = "uiNamespace setVariable ['tf47_modules_sp_loadout_dialog_var',nil]";
    class ControlsBackground
    {
		class tf47_modules_sp_loadout_background: tf47_modules_sp_base_rsctext
		{
			idc = 1000;

			x = 0.37625 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class tf47_modules_sp_loadout_title: tf47_modules_sp_base_rsctext
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
		class tf47_modules_sp_loadout_clearinv_text: tf47_modules_sp_base_rsctext
		{
			idc = 1002;
			text = "Inventar wird geleert:"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_sp_loadout_clearinvstatus_text: tf47_modules_sp_base_rsctext
		{
			idc = 1003;
			text = "Yes"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_sp_loadout_content_frame: tf47_modules_sp_base_frame
		{
			idc = 1801;
			text = "Loadout Inhalt"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class tf47_modules_sp_loadout_loadout_frame: tf47_modules_sp_base_frame
		{
			idc = 1800;
			text = "Loadouts"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.242 * safezoneH;
		};
	};
	class Controls
    {
		class tf47_modules_sp_loadout_close_button: tf47_modules_sp_base_rscbutton_main
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
		class tf47_modules_sp_loadout_back_button: tf47_modules_sp_base_rscbutton_main
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
		class tf47_modules_sp_loadout_loadout_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1602;
			action = "";

			text = "Loadouts"; //--- ToDo: Localize;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.64498 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class tf47_modules_sp_loadout_apply_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1603;
			action = "if((lbCurSel 1500) > -1) then {if(ctrlEnabled 1605) then {[(player getVariable['tf47_modules_sp_vehicle', player]), call compile lbData [1500,	(lbCurSel 1500)]] spawn	tf47_modules_servicepoint_fnc_applyVanillaLoadout;} else {[(player getVariable['tf47_modules_sp_vehicle', player]), call compile lbData [1500, (lbCurSel 1500)]] spawn tf47_modules_servicepoint_fnc_applyAceLoadout;};};";

			text = "Anwenden"; //--- ToDo: Localize;
			x = 0.578478 * safezoneW + safezoneX;
			y = 0.64498 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class tf47_modules_sp_loadout_loadouts_listbox: tf47_modules_sp_base_listbox
		{
			onLBSelChanged = "[_this select 1] call tf47_modules_servicepoint_fnc_updateLoadoutContent;";
			idc = 1500;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.176 * safezoneH;
		};
		class tf47_modules_sp_loadout_content_listbox: tf47_modules_sp_base_listbox
		{
			idc = 1501;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.209 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 40) * 1)";
		};

		class tf47_modules_sp_loadout_vanilla_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1604;
			action = "ctrlEnable [1604, false]; ctrlEnable [1605, true]; [] call tf47_modules_servicepoint_fnc_initVanillaLoadouts;";
			text = "Vanilla Inventory"; //--- ToDo: Localize;
			x = 0.419688 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_modules_sp_loadout_ace_button: tf47_modules_sp_base_rscbutton_main
		{
			idc = 1605;
			action = "ctrlEnable [1604, true]; ctrlEnable [1605, false]; [] call tf47_modules_servicepoint_fnc_initAceLoadouts;";
			text = "ACE Inventory"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
