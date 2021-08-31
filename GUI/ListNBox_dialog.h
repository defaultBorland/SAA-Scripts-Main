class dialog_ListNBox {
	idd = 1000;
	onLoad = "_this ExecVM 'GUI\ListNBox.sqf'";
	
	class ControlsBackground {
		class BG {
			type = 0;
			idc = 1001;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.22569445;
			w = safeZoneW * 0.41210938;
			h = safeZoneH * 0.55034723;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0.7961,0.2941,0.051,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
	};
	class Controls {
		class Header {
			type = 0;
			idc = 1002;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.22569445;
			w = safeZoneW * 0.41210938;
			h = safeZoneH * 0.03125;
			style = 2;
			text = "Некоторые предметы из вашего хранилища были удалены";
			colorBackground[] = {0.1294,0.5333,0.2118,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			shadow = 0;
		};
		class MainBlock_BG {
			type = 0;
			idc = 1003;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.25694445;
			w = safeZoneW * 0.41210938;
			h = safeZoneH * 0.48784723;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.0353,0.5255,0.4627,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CHeader_Name {
			type = 1;
			idc = 1011;
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.26215278;
			w = safeZoneW * 0.13250367;
			h = safeZoneH * 0.02256945;
			style = 0+2;
			text = "NAME";
			borderSize = 0;
			colorBackground[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,1};
			colorFocused[] = {0,0,0,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {0.1294,0.5333,0.2118,1};
			font = "TahomaB";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
		};
		class CHeader_Count: CHeader_Name {
			idc = 1012;
			x = safeZoneX + safeZoneW * 0.47510981;
			y = safeZoneY + safeZoneH * 0.26203704;
			w = safeZoneW * 0.02781845;
			h = safeZoneH * 0.02222223;
			text = "#";
		};
		class CHeader_Type: CHeader_Name {
			idc = 1013;
			x = safeZoneX + safeZoneW * 0.50366033;
			y = safeZoneY + safeZoneH * 0.26203704;
			w = safeZoneW * 0.0658858;
			h = safeZoneH * 0.02222223;
			text = "TYPE";
		};
		class CHeader_Classname: CHeader_Name {
			idc = 1014;
			x = safeZoneX + safeZoneW * 0.57027819;
			y = safeZoneY + safeZoneH * 0.26203704;
			w = safeZoneW * 0.1017716;
			h = safeZoneH * 0.02222223;
			text = "CLASSNAME";
		};

		class RscListNBox {
			type = 102;
			access = 0;
			idc = 1010;
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.28703704;
			w = safeZoneW * 0.4015625;
			h = safeZoneH * 0.44907408;
			style = 16;
			font = "PuristaMedium"; 
			sizeEx = 0.04; 
			autoScrollSpeed = -1; 
			autoScrollDelay = 5; 
			autoScrollRewind = 0; 
			arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)"; 
			arrowFull = "#(argb,8,8,3)color(1,1,1,1)"; 
			columns[] = {0, 0.07, 0.43, 0.5, 0.65};
			disableOverflow = 1;
			color[] = {1, 1, 1, 1}; 
			colorScrollbar[] = {1, 1, 1, 1};
			colorText[] = {0.1294,0.5333,0.2118,1};
			colorSelect[] = {1,0,0,1}; 
			colorSelect2[] = {1, 1, 1, 1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorBackground[] = {0.2,0.2,0.2,1};
			colorSelectBackground[] = {0, 0, 0, 1}; 
			colorSelectBackground2[] = {0.8784, 0.8471, 0.651, 1}; 
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};
			colorPictureDisabled[] = {0,0,0,1};
			drawSideArrows = 0; 
			idcLeft = -1; 
			idcRight = -1; 
			maxHistoryDelay = 1; 
			rowHeight = 0; 
			soundSelect[] = {"", 0.1, 1}; 
			period = 1; 
			shadow = 2;

			class ScrollBar	{
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
			};

			class ListScrollBar: ScrollBar {};
		};
		class Button_Hide {
			type = 1;
			idc = 1070;
			x = safeZoneX + safeZoneW * 0.57128907;
			y = safeZoneY + safeZoneH * 0.74305556;
			w = safeZoneW * 0.06640625;
			h = safeZoneH * 0.03125;
			style = 0+2;
			text = "СВЕРНУТЬ";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorBackgroundActive[] = {0,0,0,0.8};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBorder[] = {0,0,0,0.5};
			colorDisabled[] = {0,0,0,0.5};
			colorFocused[] = {0,0,0,0.5};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0;
			offsetPressedY = 0;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			colorFocused2[] = {0,0,0,0.5};
		};
		class Button_Help: Button_Hide {
			idc = 1080;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.74305556;
			w = safeZoneW * 0.06640625;
			h = safeZoneH * 0.03125;
			text = "ПОМОЩЬ";
		};
		class Button_Close: Button_Hide	{
			idc = 1090;
			x = safeZoneX + safeZoneW * 0.63964844;
			y = safeZoneY + safeZoneH * 0.74305556;
			w = safeZoneW * 0.06640625;
			h = safeZoneH * 0.03125;
			text = "ЗАКРЫТЬ";
		};
	};
};

class Helper {
	idd = 1100;

	class ControlsBackground {
		class BG {
			type = 0;
			idc = 1101;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.22569445;
			w = safeZoneW * 0.41210938;
			h = safeZoneH * 0.55034723;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.7961,0.2941,0.051,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
	};
	class Controls {
		class Edit_InfoBox
		{
			type = 2;
			idc = 1110;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.22569445;
			w = safeZoneW * 0.41210938;
			h = safeZoneH * 0.50134723;
			style = 16;
			text = "EDIT BOX";
			autocomplete = "";
			colorBackground[] = {0.2,0.2,0.2,0};
			colorDisabled[] = {0.2,0.2,0.2,0.8};
			colorSelection[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			access = 2;
			canModify = false;
			forceDrawCaret = false;
			
		};
		class Button_Close {
			type = 1;
			idc = 1190;
			x = safeZoneX + safeZoneW * 0.63964844;
			y = safeZoneY + safeZoneH * 0.74305556;
			w = safeZoneW * 0.06640625;
			h = safeZoneH * 0.03125;
			text = "ЗАКРЫТЬ";
			style = 0+2;
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorBackgroundActive[] = {0,0,0,0.8};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBorder[] = {0,0,0,0.5};
			colorDisabled[] = {0,0,0,0.5};
			colorFocused[] = {0,0,0,0.5};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			colorFocused2[] = {0,0,0,0.5};
		};
	};
};