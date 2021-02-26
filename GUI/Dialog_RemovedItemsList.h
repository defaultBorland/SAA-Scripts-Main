//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)

#include "CustomControlClasses.h"
class Dialog_RemovedItemsList
{
	idd = 100;
	movingEnable = true;
	
	class ControlsBackground
	{
		class Background_Static
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29635417;
			y = safeZoneY + safeZoneH * 0.22962963;
			w = safeZoneW * 0.40833334;
			h = safeZoneH * 0.53981482;
			style = 0;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,0.7};
			colorText[] = {0.451,0.1804,0.5059,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			moving = true;
			
		};
		
	};
	class Controls
	{
		class Background_Top
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.29635417;
			y = safeZoneY + safeZoneH * 0.22962963;
			w = safeZoneW * 0.40833334;
			h = safeZoneH * 0.0712963;
			style = 0;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {0.8157,0.3922,0.3922,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Background_Bottom
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.29635417;
			y = safeZoneY + safeZoneH * 0.69814815;
			w = safeZoneW * 0.40833334;
			h = safeZoneH * 0.07407408;
			style = 0;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {0.8157,0.3922,0.3922,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class Control_ListBoxOutline
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3078125;
			y = safeZoneY + safeZoneH * 0.70185186;
			w = safeZoneW * 0.38854167;
			h = safeZoneH * 0.00092593;
			style = 0;
			text = "";
			colorBackground[] = {1,1,1,1};
			colorText[] = {0.5137,0.7608,0.4941,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Control_ListBox
		{
			type = 5;
			idc = 101;
			x = safeZoneX + safeZoneW * 0.30520834;
			y = safeZoneY + safeZoneH * 0.30185186;
			w = safeZoneW * 0.39166667;
			h = safeZoneH * 0.39351852;
			style = 16;
			colorBackground[] = {0.102,0.102,0.102,0};
			colorDisabled[] = {0.102,0.102,0.102,0};
			colorSelect[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};
			colorPictureDisabled[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0.07;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			access = 2;
			onLBDblClick = "_line = ((_this select 0) lbData (_this select 1)); [format['> Server: %1 highlights removed item: %2', name player, _line]] remoteExec ['systemChat']; [format['ITEM HIGHLIGHT: %1 | Player: %2', _line, name player]] remoteExec ['diag_log', 2]; copyToClipboard _line; false";
			onLBDrag = "false";
			onLBDragging = "false";
			onLBDrop = "false";
			onLBSelChanged = "false";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class Control_DescriptionOutline
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3078125;
			y = safeZoneY + safeZoneH * 0.25648149;
			w = safeZoneW * 0.38645834;
			h = safeZoneH * 0.03703704;
			style = 0;
			text = "";
			colorBackground[] = {1,1,1,1};
			colorText[] = {0.5137,0.7608,0.4941,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Control_Description
		{
			type = 0;
			idc = 103;
			x = safeZoneX + safeZoneW * 0.30833334;
			y = safeZoneY + safeZoneH * 0.25740741;
			w = safeZoneW * 0.38541667;
			h = safeZoneH * 0.03518519;
			style = 2;
			text = "Since your last visit some of your equipment from Storage were removed due to your class restrictions.";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			
		};
		class Control_Header
		{
			type = 0;
			idc = 102;
			x = safeZoneX + safeZoneW * 0.45625;
			y = safeZoneY + safeZoneH * 0.24074075;
			w = safeZoneW * 0.090625;
			h = safeZoneH * 0.02407408;
			style = 2;
			text = "Removed Equipment";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			access = 2;
			
		};
		class Control_Button_Hide
		{
			type = 16;
			idc = 106;
			x = safeZoneX + safeZoneW * 0.61041667;
			y = safeZoneY + safeZoneH * 0.73796297;
			w = safeZoneW * 0.02864584;
			h = safeZoneH * 0.02222223;
			style = 2+192;
			text = "Hide";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			color[] = {1,1,1,1};
			color2[] = {0.6,0,0,1};
			colorBackground[] = {0.102,0.102,0.102,1};
			colorBackground2[] = {0.102,0.102,0.102,1};
			colorBackgroundFocused[] = {0.600,0.600,0.600,1};
			colorDisabled[] = {0.102,0.102,0.102,1};
			colorFocused[] = {1,1,1,1};
			font = "PuristaMedium";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
			textureNoShortcut = "";
			action = "closeDialog 0";
			periodFocus = 1.2;
			periodOver = 0.8;
			onVideoStopped = "";
			class HitZone
			{
				top = 0;
				right = 0;
				bottom = 0;
				left = 0;
				
			};
			class ShortcutPos
			{
				top = 0;
				left = 0;
				w = 0;
				h = 0;
				
			};
			class TextPos
			{
				top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
				right = 0.005;
				bottom = 0;
				left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
				
			};
			
		};
		class Control_Button_OK
		{
			type = 16;
			idc = 105;
			x = safeZoneX + safeZoneW * 0.66041667;
			y = safeZoneY + safeZoneH * 0.73796297;
			w = safeZoneW * 0.02864584;
			h = safeZoneH * 0.02222223;
			style = 2+192;
			text = "OK";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			color[] = {1,1,1,1};
			color2[] = {0.6,0,0,1};
			colorBackground[] = {0.102,0.102,0.102,1};
			colorBackground2[] = {0.102,0.102,0.102,1};
			colorBackgroundFocused[] = {0.600,0.600,0.600,1};
			colorDisabled[] = {0.102,0.102,0.102,1};
			colorFocused[] = {1,1,1,1};
			font = "PuristaMedium";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
			textureNoShortcut = "";
			action = "closeDialog 0; removeAllActions player";
			periodFocus = 1.2;
			periodOver = 0.8;
			onVideoStopped = "";
			class HitZone
			{
				top = 0;
				right = 0;
				bottom = 0;
				left = 0;
				
			};
			class ShortcutPos
			{
				top = 0;
				left = 0;
				w = 0;
				h = 0;
				
			};
			class TextPos
			{
				top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
				right = 0.005;
				bottom = 0;
				left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
				
			};
			
		};
		class Control_Description_Hint
		{
			type = 0;
			idc = 104;
			x = safeZoneX + safeZoneW * 0.30885417;
			y = safeZoneY + safeZoneH * 0.70740741;
			w = safeZoneW * 0.384375;
			h = safeZoneH * 0.01666667;
			style = 2;
			text = "Double click on position to post line in global chat and send classname to server.";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.70);
			
		};
		
	};
	
};
