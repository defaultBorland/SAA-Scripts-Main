#include "\a3\3DEN\UI\macros.inc"
#include "\a3\3DEN\UI\macroexecs.inc"

class ModsApprovalDisplay {
	idd = 5450000;
	onLoad = "_this execVM 'GUI\ModsApproval\dialog_init.sqf'";

	class ControlsBackground {
		class BG: RscText {
			idc = 5450001;
			x = CENTER_X - GRID_W * 120;
			y = CENTER_Y - GRID_H * 80;
			w = GRID_W * 120 * 2;
			h = GRID_H * 80 * 2; 
			colorBackground[] = {0, 0, 0, 0.5};
		};
	};

	class Controls {

		class Header: RscText {
			idc = 5450002;
			x = CENTER_X - GRID_W * 120;
			y = CENTER_Y - GRID_H * 80 - GRID_H * 11;
			w = GRID_W * 120 * 2;
			h = GRID_H * 10;
			style = 2;
			text = "$STR_SAA_MAM_HEADER";
			colorBackground[] = {0.1294, 0.5333, 0.2157, 1};
			colorText[] = {1, 1, 1, 1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};

		class Content: RscControlsGroupNoScrollbars {
			x = CENTER_X - GRID_W * 120;
			y = CENTER_Y - GRID_H * 80;
			w = GRID_W * 120 * 2;
			h = GRID_H * 80 * 2 - GRID_H * 8 - GRID_H * 3 * 1;

			class Controls {

				class Players_BG: RscText {
					idc = 5450010;
					x = GRID_W * 3;
					y = GRID_H * 3;
					w = GRID_W * 54;
					h = GRID_H * 10;
					colorBackground[] = {0, 0, 0, 0.6};
				};

				class Players_Text: RscText {
					idc = 5450011;
					x = GRID_W * 3 + GRID_W * 2;
					y = GRID_H * 3;
					w = GRID_W * 54 - GRID_W * 2 * 2;
					h = GRID_H * 8;
					style = 2;
					text = "$STR_SAA_GENERAL_PLAYERS";
					colorBackground[] = {0, 0, 0, 0};
					colorText[] = {1, 1, 1, 1};
					font = "PuristaMedium";
					sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
				};

				class Players_Refresh_Button: RscButtonMenu {
					idc = 5450012;
					x = GRID_W * 2 + GRID_W * 2 * 2 + GRID_W * 54 - GRID_W * 2;
					y = GRID_H * 3;
					w = GRID_W * 10;
					h = GRID_H * 9;

					tooltip = "$STR_SAA_MAM_REFRESH_BUTTON_TOOLTIP";

					colorText[] = {1, 1, 1, 1};
					color2[] = {1, 1, 1, 1};
					colorFocused[] = {1, 1, 1, 1};
					colorBackground[] = {0, 0, 0, 0.6};
					colorBackgroundFocused[] = {0.1294, 0.5333, 0.2157, 1};
					colorBackground2[] = {0.1294, 0.5333, 0.2157, 1}; // Focused 2

					textureNoShortcut = "img\TeamManagement\Refresh.paa";

					class ShortcutPos {
						left = GRID_W * 2;
						top = GRID_H * 1.5;
						w = GRID_W * 6;
						h = GRID_H * 6;
					};
				};

				class Players_Counter_BG: Players_BG {
					idc = 5450013;
					x = GRID_W * 3 + GRID_W * 34 + GRID_W * 2 * 2 + GRID_W * 38 * 2 - GRID_W * 34 - GRID_W * 2 * 2 - GRID_W * 10;
					y = GRID_H * 3;
					w = GRID_W * 10;
					h = GRID_H * 10;
				};

				class Players_Counter_Text: Players_Text {
					idc = 5450014;
					x = GRID_W * 3 + GRID_W * 34 + GRID_W * 2 * 2 + GRID_W * 38 * 2 - GRID_W * 34 - GRID_W * 2 * 2 - GRID_W * 10;
					y = GRID_H * 3 + GRID_H;
					w = GRID_W * 10;
					h = GRID_H * 8;
					text = "";
				};
				
				class Players_ListNBox_BG: Players_BG {
					idc = 5450015;
					x = GRID_W * 3;
					y = GRID_H * 3 + GRID_H * 8 * 1 + GRID_H * 2;
					w = GRID_W * 38 * 2;
					h = GRID_H * 80 * 2 - GRID_H * 3 * 4 - GRID_H * 8 * 2 + GRID_H * 2;
				};

				class Players_ListNBox: RscListNBox {
					idc = 5450016;
					x = GRID_W * 3;
					y = GRID_H * 3 + GRID_H * 8 * 1 + GRID_H * 4;
					w = GRID_W * 38 * 2;
					h = GRID_H * 80 * 2 - GRID_H * 3 * 4 - GRID_H * 8 * 2 - GRID_H * 2;

					colorPictureSelected[] = {0,0,0,1};
					disableOverflow = 1;
					tooltipPerColumn = 1;
					colorText[] = {1, 1, 1, 1};
					colorPicture[] = {1, 1, 1, 1};

					columns[] = {
						0.02,
						0.85
					};

					onLoad = "";
				};

				class Mods_BG: Players_BG {
					idc = 5450020;
					x = GRID_W * 3 * 2 + GRID_W * 38 * 2;
				};

				class Mods_Text: Players_Text {
					idc = 5450021;
					x = GRID_W * 3 * 2 + GRID_W * 38 * 2;
					text = "$STR_SAA_GENERAL_MODS";
				};

				class Mods_Combo: RscCombo {
					idc = 5450022;
					x = GRID_W * 3 * 2 + GRID_W * 38 * 2 + GRID_W * 54 + GRID_W;
					y = GRID_H * 3;
					w = GRID_W * 54 + GRID_W * 2;
					h = GRID_H * 9;
					colorBackground[] = {0, 0, 0, 0.6};

					class Attributes {
						font = "PuristaLight";
						align = "middle";
						valign = "middle";
					};
				};

				class Mods_Whitelist_Button: Players_Refresh_Button {
					idc = 5450023;
					x = GRID_W * 3 * 2 + GRID_W * 38 * 2 + GRID_W * 54 + GRID_W * 54 + GRID_W * 4;
					y = GRID_H * 3;
					w = GRID_W * 10;

					tooltip = "$STR_SAA_MAM_WHITELIST_BUTTON_TOOLTIP";

					colorText[] = {1, 1, 1, 1};
					color2[] = {1, 1, 1, 1};
					colorFocused[] = {0, 0, 0, 1};
					colorBackground[] = {0, 0, 0, 0.6};
					colorBackgroundFocused[] = {0.1294, 0.5333, 0.2157, 1};
					colorBackground2[] = {0.1294, 0.5333, 0.2157, 1}; // Focused 2

					textureNoShortcut = "\A3\UI_F\data\IGUI\Cfg\HoldActions\holdAction_thumbsUp_ca.paa";

					class ShortcutPos {
						left = GRID_W * 1;
						top = GRID_H * 0.5;
						w = GRID_W * 8;
						h = GRID_H * 8;
					};
			
				};

				class Mods_Workshop_Button: Mods_Whitelist_Button {
					idc = 5450024;
					x = GRID_W * 3 * 2 + GRID_W * 38 * 2 + GRID_W * 54 + GRID_W * 54 + GRID_W * 4 + GRID_W * 1 + GRID_W * 10;
					y = GRID_H * 3;
					w = GRID_W * 10;

					tooltip = "$STR_SAA_MAM_WORKSHOP_BUTTON_TOOLTIP";

					colorBackgroundFocused[] = {0, 0, 1, 0.6};
					colorBackground2[] = {0, 0, 1, 0.6}; // Focused 2

					textureNoShortcut = "\A3\UI_F\data\GUI\Rsc\RscDisplayArcadeMap\icon_steam_ca.paa";
				};

				class Mods_Blacklist_Button: Mods_Whitelist_Button {
					idc = 5450025;
					x = GRID_W * 3 * 2 + GRID_W * 38 * 2 + GRID_W * 54 + GRID_W * 54 + GRID_W * 4 + GRID_W * 2 + GRID_W * 10 * 2;
					y = GRID_H * 3;
					w = GRID_W * 10;

					tooltip = "$STR_SAA_MAM_BLACKLIST_BUTTON_TOOLTIP";

					colorBackgroundFocused[] = {1, 0, 0, 0.6};
					colorBackground2[] = {1, 0, 0, 0.6}; // Focused 2

					textureNoShortcut = "\A3\UI_F\data\IGUI\Cfg\HoldActions\holdAction_thumbsDown_ca.paa";
			
				};

				class Mods_Counter_BG: Players_Counter_BG {
					idc = 5450026;
					x = GRID_W * 3 * 2 + GRID_W * 38 * 2 * 3 + GRID_W * 3 - GRID_W * 10;
					y = GRID_H * 3;
					w = GRID_W * 10;
					h = GRID_H * 10;
				};

				class Mods_Counter_Text: Players_Counter_Text {
					idc = 5450027;
					x = GRID_W * 3 * 2 + GRID_W * 38 * 2 * 3 + GRID_W * 3 - GRID_W * 10;
					y = GRID_H * 3 + GRID_H;
					w = GRID_W * 10;
					h = GRID_H * 8;
				};

				class Mods_ListNBox_BG: Players_ListNBox_BG {
					idc = 5450028;
					x = GRID_W * 38 * 2 + GRID_W * 3 * 2;
					w = GRID_W * 38 * 2 * 2 + GRID_W * 3;
				};

				class Mods_ListNBox: Players_ListNBox {
					idc = 5450029;
					x = GRID_W * 38 * 2 + GRID_W * 3 * 2;
					w = GRID_W * 38 * 2 * 2 + GRID_W * 3;

					columns[] = {
						0.02,
						0.8,
						0.99
					};

					onLoad = "";
				};

			};
		};

		class Close: RscButtonMenu {
			idc = 5450100;
			x = CENTER_X - GRID_W * 38;
			y = CENTER_Y + GRID_H * 80 - GRID_H * 3 - GRID_H * 8;
			w = GRID_W * 38 * 2;
			h = GRID_H * 8;

			text = "$STR_SAA_GENERAL_CLOSE";

			colorText[] = {1, 1, 1, 1};
			color2[] = {1, 1, 1, 1};
			colorFocused[] = {1, 1, 1, 1};
			colorBackground[] = {0, 0, 0, 0.6};
			colorBackgroundFocused[] = {0.1294, 0.5333, 0.2157, 1};
			colorBackground2[] = {0.1294, 0.5333, 0.2157, 1}; // Focused 2

			class TextPos {
				left = 0;
				top = GRID_H;
				right = 0;
				bottom = 0;
			};
			class Attributes {
				font = "PuristaLight";
				align = "center";
				valign = "middle";
			};
			class ShortcutPos {
				left = 0;
				top = 0;
				w = 0;
				h = 0;
			};
		};
	};
};