#include "\a3\3DEN\UI\macros.inc"
#include "\a3\3DEN\UI\macroexecs.inc"

class TeamManagementDisplay {
	idd = 544000;
	//onLoad = "_this execVM 'GUI\tutorialMenu.sqf'";

	class ControlsBackground {
		class BG: RscText {
			idc = 544201;
			x = CENTER_X - GRID_W * 50;
			y = CENTER_Y - GRID_H * 40;
			w = GRID_W * 50 * 2;
			h = GRID_H * 40 * 2 - GRID_H * 12; // Remove GRID_H * 12
			colorBackground[] = {0, 0, 0, 0.5};
		};
	};

	class Controls {

		class Header: RscText {
			idc = 544202;
			x = CENTER_X - GRID_W * 50;
			y = CENTER_Y - GRID_H * 40 - GRID_H * 11;
			w = GRID_W * 50 * 2;
			h = GRID_H * 10;
			style = 2;
			text = "$STR_SAA_INSTRUCTIONS_HEADER";
			colorBackground[] = {0.1294, 0.5333, 0.2157, 1};
			colorText[] = {1, 1, 1, 1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};

		class Content: RscControlsGroupNoScrollbars {

			x = CENTER_X - GRID_W * 50;
			y = CENTER_Y - GRID_H * 40;
			w = GRID_W * 50 * 2;
			h = GRID_H * 40 * 2 - GRID_H * 12; // Remove GRID_H * 12

			class Controls {

				class WhereToStart_Button: RscButtonMenu {
					idc = 544203;
					x = GRID_W * 3;
					y = (GRID_H * 3 + GRID_H * 10) * 0 + GRID_H * 3;
					w = GRID_W * 50 * 2 - GRID_W * 3 * 2;
					h = GRID_H * 10;
					text = "$STR_SAA_INSTRUCTIONS_WHERETOSTART";
					default = 0;

					colorText[] = {1, 1, 1, 1};
					color2[] = {1, 1, 1, 1};
					colorFocused[] = {1, 1, 1, 1};
					colorBackground[] = {0, 0, 0, 1};
					colorBackgroundFocused[] = {0.1294, 0.5333, 0.2157, 1};
					colorBackground2[] = {0.1294, 0.5333, 0.2157, 1}; // Focused 2

					onMouseEnter = "ctrlSetFocus (_this select 0);";

					class TextPos {
						left = 0;
						top = GRID_H * 2;
						right = 0;
						bottom = 0;
					};
					class Attributes {
						font = "PuristaLight";
						align = "center";
					};
					class ShortcutPos {
						left = 0;
						top = 0;
						w = 0;
						h = 0;
					};
				};

				class ExportArsenal_Button: WhereToStart_Button {
					idc = 544204;
					y = (GRID_H * 3 + GRID_H * 10) * 1  + GRID_H * 3;
					text = "$STR_SAA_INSTRUCTIONS_EXPORTARSENAL";
					tooltip = "$STR_SAA_INSTRUCTIONS_EXPORTARSENAL_TOOLTIP";
				};

				class ExportBox_Button: WhereToStart_Button {
					idc = 544205;
					y = (GRID_H * 3 + GRID_H * 10) * 2  + GRID_H * 3;
					text = "$STR_SAA_INSTRUCTIONS_EXPORTBOX";
					tooltip = "$STR_SAA_INSTRUCTIONS_EXPORTBOX_TOOLTIP";
				};

				class WhereToCopy_Button: WhereToStart_Button {
					idc = 544206;
					y = (GRID_H * 3 + GRID_H * 10) * 3  + GRID_H * 3;
					text = "$STR_SAA_INSTRUCTIONS_WHERETOCOPY";
					tooltip = "$STR_SAA_INSTRUCTIONS_WHERETOCOPY_TOOLTIP";
					textureNoShortcut = "\A3\Ui_f\data\GUI\Rsc\RscDisplayMain\link_ca.paa";

					class ShortcutPos {
						left = GRID_W * 50 * 2 - GRID_W * 3 * 2 - GRID_W * 11;
						top = GRID_H;
						w = GRID_W * 8;
						h = GRID_H * 8;
					};

					url = "https://docs.google.com/spreadsheets/d/1kwjGsqWoNCXp_607kwZvsXQ1UNZSURVlXNmdhbT1KAo/edit#gid=20315059";
				};

				class Storage_Button: WhereToStart_Button {
					idc = 544207;
					y = (GRID_H * 3 + GRID_H * 10) * 4  + GRID_H * 3;
					text = "$STR_SAA_INSTRUCTIONS_STORAGE";
					tooltip = "$STR_SAA_INSTRUCTIONS_STORAGE_TOOLTIP";
				};

				// class Storage_Button: WhereToStart_Button {
				// 	idc = 544208;
				// 	y = (GRID_H * 3 + GRID_H * 10) * 5  + GRID_H * 3;
				// 	text = "$STR_SAA_INSTRUCTIONS_STORAGE";
				// 	tooltip = "$STR_SAA_INSTRUCTIONS_STORAGE_TOOLTIP";
				// };
			};
		};

		class Close: RscButtonMenu {
			idc = 544218;

			x = CENTER_X - GRID_W * 20;
			y = CENTER_Y + GRID_H * 40 + GRID_H - GRID_H * 12; // Remove GRID_H * 12
			w = GRID_W * 40;
			h = GRID_H * 8;

			text = "$STR_SAA_GENERIC_CLOSE";
			default = 0;

			colorText[] = {1, 1, 1, 1};
			color2[] = {1, 1, 1, 1};
			colorFocused[] = {1, 1, 1, 1};
			colorBackground[] = {0, 0, 0, 0.8};
			colorBackgroundFocused[] = {0.1294, 0.5333, 0.2157, 1};
			colorBackground2[] = {0.1294, 0.5333, 0.2157, 1}; // Focused 2

			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 1;"

			class TextPos {
				left = 0;
				top = GRID_H;
				right = 0;
				bottom = 0;
			};
			class Attributes {
				font = "PuristaLight";
				align = "center";
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

class Instructions_Page {
	idd = 544210;
	idc = 544210;

	class ControlsBackground {
		class BG: RscText {
			idc = 544211;
			x = CENTER_X - GRID_W * 50 * 2;
			y = CENTER_Y - GRID_H * 40 * 2;
			w = GRID_W * 50 * 4;
			h = GRID_H * 40 * 4;
			colorBackground[] = {0, 0, 0, 0.5};
		};
	};

	class Controls {

		class Header: RscText {
			idc = 544212;
			x = CENTER_X - GRID_W * 50 * 2;
			y = CENTER_Y - GRID_H * 40 * 2 - GRID_H * 11;
			w = GRID_W * 50 * 4;
			h = GRID_H * 10;
			style = 2;
			text = "STR_SAA_INSTRUCTIONS_HEADER";
			colorBackground[] = {0.1294, 0.5333, 0.2157, 1};
			colorText[] = {1, 1, 1, 1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};

		class Content: RscControlsGroupNoScrollbars {

			x = CENTER_X - GRID_W * 50 * 2;
			y = CENTER_Y - GRID_H * 40 * 2;
			w = GRID_W * 50 * 4;
			h = GRID_H * 40 * 4 + GRID_H * 11;

			class Controls {

				class MainText: RscStructuredText {
					idc = 544213;
					x = GRID_W * 3;
					y = GRID_H * 4;
					w = GRID_W * 50 * 4 - GRID_W * 3 * 2;
					h = GRID_H * 40 * 2;

					class Attributes {
						font = "PuristaMedium";
						color = "#ffffff";
						align = "left";
						valign = "middle";
						shadow = false;
					};
				};

				class Image: RscPicture {
					idc = 544215;
					style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
					x = GRID_W * 3;
					y = GRID_H * 40 * 2 + GRID_H * 2 * 2;
					w = GRID_W * 200 - GRID_W * 3 * 2; // 194
					h = GRID_H * 30 * 2; // 60
				};

				class ImageText: MainText {
					idc = 544216;
					x = GRID_W * 3;
					y = GRID_H * 40 * 2 + GRID_H * 30 * 2 + GRID_H * 2 * 3;
					w = GRID_W * 50 * 4 - GRID_W * 3 * 2;
					h = GRID_H * 10;

					class Attributes {
						font = "PuristaMedium";
						color = "#ffffff";
						align = "center";
						valign = "middle";
						shadow = false;
					};
				};

				class Close: RscButtonMenu {
					idc = 544218;

					x = GRID_W * 80;
					y = GRID_H * 40 * 4 + GRID_H;
					w = GRID_W * 40;
					h = GRID_H * 8;

					text = "$STR_SAA_GENERIC_CLOSE";
					default = 0;

					colorText[] = {1, 1, 1, 1};
					color2[] = {1, 1, 1, 1};
					colorFocused[] = {1, 1, 1, 1};
					colorBackground[] = {0, 0, 0, 0.8};
					colorBackgroundFocused[] = {0.1294, 0.5333, 0.2157, 1};
					colorBackground2[] = {0.1294, 0.5333, 0.2157, 1}; // Focused 2

					onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 1;";

					class TextPos {
						left = 0;
						top = GRID_H;
						right = 0;
						bottom = 0;
					};
					class Attributes {
						font = "PuristaLight";
						align = "center";
					};
					class ShortcutPos {
						left = 0;
						top = 0;
						w = 0;
						h = 0;
					};
				};

				class Prev: Close {
					idc = 544217;

					x = GRID_W * 80 - GRID_W * 40 - GRID_H * 3;
					text = "$STR_SAA_GENERIC_PREV";
					show = 1;
					onButtonClick = "";

					textureNoShortcut = "\A3\Ui_f\data\GUI\RscCommon\RscHTML\arrow_left_ca.paa";

					class ShortcutPos {
						left = GRID_W;
						top = GRID_H;
						w = GRID_W * 6;
						h = GRID_H * 6;
					};
				};

				class Next: Close {
					idc = 544219;

					x = GRID_W * 80 + GRID_W * 40 + GRID_H * 3;
					text = "$STR_SAA_GENERIC_NEXT";
					show = 1;
					onButtonClick = "";

					textureNoShortcut = "\A3\Ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";

					class ShortcutPos {
						left = GRID_W * 32;
						top = GRID_H;
						w = GRID_W * 6;
						h = GRID_H * 6;
					};
				};
			};
		};
	};
};