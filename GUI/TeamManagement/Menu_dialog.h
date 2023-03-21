#include "\a3\3DEN\UI\macros.inc"
#include "\a3\3DEN\UI\macroexecs.inc"

class TeamManagementDisplay {
	idd = 5440000;
	onLoad = "_this execVM 'GUI\TeamManagement\dialog_init.sqf'";

	class ControlsBackground {
		class BG: RscText {
			idc = 5440001;
			x = CENTER_X - GRID_W * 150;
			y = CENTER_Y - GRID_H * 80;
			w = GRID_W * 150 * 2;
			h = GRID_H * 80 * 2; 
			colorBackground[] = {0, 0, 0, 0.5};
		};
	};

	class Controls {

		class Header: RscText {
			idc = 5440002;
			x = CENTER_X - GRID_W * 150;
			y = CENTER_Y - GRID_H * 80 - GRID_H * 11;
			w = GRID_W * 150 * 2;
			h = GRID_H * 10;
			style = 2;
			text = "$STR_SAA_TMM_HEADER";
			colorBackground[] = {0.1294, 0.5333, 0.2157, 1};
			colorText[] = {1, 1, 1, 1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};

		class Content: RscControlsGroupNoScrollbars {
			x = CENTER_X - GRID_W * 150;
			y = CENTER_Y - GRID_H * 80;
			w = GRID_W * 150 * 2;
			h = GRID_H * 80 * 2 - GRID_H * 8 - GRID_H * 3 * 1;

			class Controls {

				class OthersSquads_BG: RscText {
					idc = 5440014;
					x = GRID_W * 3;
					y = GRID_H * 3;
					w = GRID_W * 34;
					h = GRID_H * 10;
					colorBackground[] = {0, 0, 0, 0.6};
				};

				class OthersSquads_Text: RscText {
					idc = 5440010;
					x = GRID_W * 3;
					y = GRID_H * 3;
					w = GRID_W * 34;
					h = GRID_H * 8;
					style = 2;
					text = "$STR_SAA_TMM_ALLY_GROUP";
					colorBackground[] = {0, 0, 0, 0};
					colorText[] = {1, 1, 1, 1};
					font = "PuristaMedium";
					sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
				};

				class OthersSquads_Combo: RscCombo {
					idc = 5440011;
					x = GRID_W * 3 + GRID_W * 34 + GRID_W * 1;
					y = GRID_H * 3;
					w = GRID_W * 48 * 2 - GRID_W * 34 - GRID_W * 2 * 2 - GRID_W * 8;
					h = GRID_H * 9;
					colorBackground[] = {0, 0, 0, 0.6};

					class Attributes {
						font = "PuristaLight";
						align = "middle";
						valign = "middle";
					};
				};

				class OthersSquads_Counter_BG: OthersSquads_BG {
					idc = 5440018;
					x = GRID_W * 3 + GRID_W * 34 + GRID_W * 2 * 2 + GRID_W * 48 * 2 - GRID_W * 34 - GRID_W * 2 * 2 - GRID_W * 10;
					y = GRID_H * 3;
					w = GRID_W * 10;
					h = GRID_H * 10;
				};

				class OthersSquads_Counter_Text: OthersSquads_Text {
					idc = 5440019;
					x = GRID_W * 3 + GRID_W * 34 + GRID_W * 2 * 2 + GRID_W * 48 * 2 - GRID_W * 34 - GRID_W * 2 * 2 - GRID_W * 10;
					y = GRID_H * 3 + GRID_H;
					w = GRID_W * 10;
					h = GRID_H * 8;
					text = "";
				};
				
				class OthersSquads_ListNBox_BG: OthersSquads_BG {
					idc = 5440013;
					x = GRID_W * 3;
					y = GRID_H * 3 + GRID_H * 8 * 2 + GRID_H * 2;
					w = GRID_W * 48 * 2;
					h = GRID_H * 80 * 2 - GRID_H * 3 * 4 - GRID_H * 8 * 3 + GRID_H * 2;
				};

				class OthersSquads_ListNBox: RscListNBox {
					idc = 5440012;
					x = GRID_W * 3;
					y = GRID_H * 3 + GRID_H * 8 * 2 + GRID_H * 2 * 2;
					w = GRID_W * 48 * 2;
					h = GRID_H * 80 * 2 - GRID_H * 3 * 4 - GRID_H * 8 * 4 + + GRID_H * 2 * 2;

					colorPictureSelected[] = {0,0,0,1};
					disableOverflow = 1;
					colorText[] = {0.5, 0.5, 0.5, 1};
					tooltipPerColumn = 1;
					colorPicture[] = {0.5, 0.5, 0.5, 1};

					columns[] = {
						0.02,
						0.1,
						0.25,
						0.8,
						0.88
					};

					// columns[] = {
					// 	GRID_W * 3,
					// 	GRID_W * 3 + GRID_W * 16,
					// 	GRID_W * 3 + GRID_W * 16 + GRID_W * 32,
					// 	GRID_W * 3 + GRID_W * 16 + GRID_W * 32 * 4 + GRID_W * 3 * 2,
					// 	GRID_W * 3 + GRID_W * 16 + GRID_W * 32 * 4 + GRID_W * 3 * 3 + GRID_W * 16
					// };

					onLoad = "(_this # 0) ctrlEnable false";
				};

				class OthersSquads_Cmd_ListNBox_BG: OthersSquads_ListNBox_BG {
					idc = 5440015;
					y = GRID_H * 3 + GRID_H * 8 * 1 + GRID_H * 2;
					h = GRID_H * 8;
				};

				class OthersSquads_Cmd_ListNBox: OthersSquads_ListNBox {
					idc = 5440016;
					y = GRID_H * 3 + GRID_H * 8 * 1 + GRID_H * 2 * 2;
					h = GRID_H * 8;
					font = "RobotoCondensedBold";
				};

				class MySquad_BG: OthersSquads_BG {
					idc = 5440014;
					x = GRID_W * 3 * 2 + GRID_W * 48 * 2;
				};

				class MySquad_Text: OthersSquads_Text {
					idc = 5440020;
					x = GRID_W * 3 * 2 + GRID_W * 48 * 2;
					text = "$STR_SAA_TMM_MY_GROUP";
				};

				class MySquad_Rename_EditBox: RscEdit {
					idc = 5440021;
					x = GRID_W * 3 * 2 + GRID_W * 48 * 2 + GRID_W * 34 + GRID_H * 1;
					y = GRID_H * 3;
					w = GRID_W * 48 * 2 - GRID_W * 34 - GRID_H * 2 * 2 - GRID_W * 10 + GRID_H - GRID_H - GRID_W * 9;
					h = GRID_H * 9;

					colorBackground[] = {0, 0, 0, 0.6};
					text = "";
					tooltip = "$STR_SAA_TMM_RENAME_GROUP_EDITBOX_TOOLTIP";
				};

				class MySquad_Rename_Button: RscButtonMenu {
					idc = 5440022;
					x = GRID_W * 3 * 2 + GRID_W * 48 * 2 + GRID_W * 34 + GRID_H * 2 * 2 + (GRID_W * 48 * 2 - GRID_W * 34 - GRID_H * 2 * 2 - GRID_W * 10) - GRID_W * 12;
					y = GRID_H * 3;
					w = GRID_W * 11;
					h = GRID_H * 9;
					default = 1;

					colorText[] = {1, 1, 1, 1};
					color2[] = {1, 1, 1, 1};
					colorFocused[] = {1, 1, 1, 1};
					colorBackground[] = {0, 0, 0, 0.6};
					colorBackgroundFocused[] = {0.1294, 0.5333, 0.2157, 1};
					colorBackground2[] = {0.1294, 0.5333, 0.2157, 1}; // Focused 2

					textureNoShortcut = "img\TeamManagement\Edit.paa";
					tooltip = "$STR_SAA_TMM_RENAME_GROUP_BUTTON_TOOLTIP";

					class ShortcutPos {
						left = GRID_W * 2;
						top = GRID_H;
						w = GRID_W * 6;
						h = GRID_H * 6;
					};
				};

				class MySquad_Counter_BG: OthersSquads_Counter_BG {
					idc = 5440028;
					x = GRID_W * 3 * 2 + GRID_W * 48 * 2 + GRID_W * 34 + GRID_H * 2 * 2 + (GRID_W * 48 * 2 - GRID_W * 34 - GRID_H * 2 * 2 - GRID_W * 10);
					y = GRID_H * 3;
					w = GRID_W * 10;
					h = GRID_H * 10;
				};

				class MySquad_Counter_Text: OthersSquads_Counter_Text {
					idc = 5440029;
					x = GRID_W * 3 * 2 + GRID_W * 48 * 2 + GRID_W * 34 + GRID_H * 2 * 2 + (GRID_W * 48 * 2 - GRID_W * 34 - GRID_H * 2 * 2 - GRID_W * 10);
					y = GRID_H * 3 + GRID_H;
					w = GRID_W * 10;
					h = GRID_H * 8;
				};

				class MySquad_ListNBox_BG: OthersSquads_ListNBox_BG {
					idc = 5440024;
					x = GRID_W * 48 * 2 + GRID_W * 3 * 2;
				};

				class MySquad_ListNBox: OthersSquads_ListNBox {
					idc = 5440023;
					x = GRID_W * 48 * 2 + GRID_W * 3 * 2;
					colorText[] = {1, 1, 1, 1};
					colorPicture[] = {1, 1, 1, 1};
					onLoad = "";
				};

				class MySquad_Cmd_ListNBox_BG: OthersSquads_Cmd_ListNBox_BG {
					idc = 5440025;
					x = GRID_W * 48 * 2 + GRID_W * 3 * 2;
				};

				class MySquad_Cmd_ListNBox: OthersSquads_Cmd_ListNBox {
					idc = 5440026;
					x = GRID_W * 48 * 2 + GRID_W * 3 * 2;
					colorText[] = {1, 1, 1, 1};
					colorPicture[] = {1, 1, 1, 1};
				};

				class NoSquad_BG: OthersSquads_BG {
					idc = 5440036;
					x = GRID_W * 3 * 3 + GRID_W * 48 * 2 * 2;
					w = GRID_W * 32;
				};

				class NoSquad_Text: OthersSquads_Text {
					idc = 5440030;
					x = GRID_W * 3 * 3 + GRID_W * 48 * 2 * 2;
					w = GRID_W * 32;
					text = "$STR_SAA_TMM_NO_GROUP";
				};

				class NoSquad_PickRandom_Button: MySquad_Rename_Button {
					idc = 5440031;
					x = GRID_W * 3 * 3 + GRID_W * 48 * 2 * 2 + GRID_W * 33;
					y = GRID_H * 3;
					w = GRID_W * 14;

					colorDisabled[] = {1, 1, 1, 0.6};
					colorDisabledSecondary[] = {1, 1, 1, 0.6};

					textureNoShortcut = "img\TeamManagement\Dice.paa";
					tooltip = "$STR_SAA_TMM_PICK_RANDOM_PLAYER_BUTTON_TOOLTIP";
					onLoad = "(_this # 0) ctrlEnable false;";
			
					class ShortcutPos {
						left = GRID_W * 4;
						top = GRID_H * 1.5;
						w = GRID_W * 6;
						h = GRID_H * 6;
					};
				};

				class NoSquad_Refresh_Button: NoSquad_PickRandom_Button {
					idc = 5440033;
					x = GRID_W * 3 * 3 + GRID_W * 48 * 2 * 2 + GRID_W * 33 + GRID_W * 14 + GRID_W;
					w = GRID_W * 14;

					textureNoShortcut = "img\TeamManagement\Refresh.paa";
					tooltip = "$STR_SAA_TMM_REFRESH_BUTTON_TOOLTIP";
					onLoad = "";

					class ShortcutPos {
						left = GRID_W * 4;
						top = GRID_H * 1.5;
						w = GRID_W * 6;
						h = GRID_H * 6;
					};
				};

				class NoSquad_Combo_Filter: OthersSquads_Combo {
					idc = 5440032;
					x = GRID_W * 3 * 5 + GRID_W * 48 * 2 * 2 + GRID_W * 48 + GRID_W * 22 - GRID_W * 13;
					w = GRID_W * 22;
				};

				class NoSquad_Counter_BG: MySquad_Counter_BG {
					idc = 5440038;
					x = GRID_W * 3 * 5 + GRID_W * 48 * 2 * 2 + GRID_W * 48 + GRID_W * 22 - GRID_H - GRID_W * 10 + GRID_W * 20 + GRID_W;
				};

				class NoSquad_Counter_Text: MySquad_Counter_Text {
					idc = 5440039;
					x = GRID_W * 3 * 5 + GRID_W * 48 * 2 * 2 + GRID_W * 48 + GRID_W * 22 - GRID_H - GRID_W * 10 + GRID_W * 20 + GRID_W;
				};

				class NoSquad_ListNBox_BG: OthersSquads_ListNBox_BG {
					idc = 5440035;
					x = GRID_W * 48 * 2 * 2 + GRID_W * 3 * 3;
					y = GRID_H * 3 + GRID_H * 8 * 1 + GRID_H * 2 * 1;
					h = GRID_H * 80 * 2 - GRID_H * 3 * 4 - GRID_H * 8 * 2 + GRID_H * 2;
				};

				class NoSquad_ListNBox: MySquad_ListNBox {
					idc = 5440034;
					x = GRID_W * 48 * 2 * 2 + GRID_W * 3 * 3;
					y = GRID_H * 3 + GRID_H * 8 * 1 + GRID_H * 2 * 1 + GRID_H * 2 * 1;
					h = GRID_H * 80 * 2 - GRID_H * 3 * 4 - GRID_H * 8 * 3 + GRID_H * 2 * 2;
					tooltipPerColumn = true;
				};
			};
		};

		class Close: RscButtonMenu {
			idc = 5440100;
			x = CENTER_X - GRID_W * 48 + GRID_W * 8 + GRID_W;
			y = CENTER_Y + GRID_H * 80 - GRID_H * 3 - GRID_H * 8;
			w = GRID_W * 48 * 2 - GRID_W * 8 - GRID_W;
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

		class Disband: Close {
			idc = 5440101;
			x = CENTER_X - GRID_W * 48;
			w = GRID_W * 8;

			text = "";
			default = 0;

			colorText[] = {1, 1, 1, 1};
			color2[] = {1, 1, 1, 1};
			colorFocused[] = {0, 0, 0, 1};
			colorBackground[] = {0, 0, 0, 0.6};
			colorBackgroundFocused[] = {1, 0, 0, 1};
			colorBackground2[] = {1, 0, 0, 1}; // Focused 2
			
			textureNoShortcut = "img\TeamManagement\Disband.paa";
			tooltip = "$STR_SAA_TMM_DISBAND_BUTTON_TOOLTIP";

			class ShortcutPos {
				left = GRID_W;
				top = GRID_H;
				w = GRID_W * 6;
				h = GRID_H * 6;
			};
		};
	};
};