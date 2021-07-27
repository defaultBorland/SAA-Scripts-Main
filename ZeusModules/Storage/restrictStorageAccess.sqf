//

[localize "SAA_ZEUS_MODULES_CATEGORIES_STORAGE", localize "SAA_ZEUS_MODULES_STORAGE_RESTRICTSTORAGEACCESS_MODULENAME",
{
	// Get all the passed parameters
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

	// All players exclude curators and alive ones
	private _players = ["all", "object"] call Shadec_fnc_usersIDs;

	if (count _players < 1) exitWith {
		[objNull, localize "SAA_ZEUS_MESSAGES_ERRORNONONZEUSPLAYERS"] call bis_fnc_showCuratorFeedbackMessage;
	};

	if (!(isNull _objectUnderCursor) and !(_objectUnderCursor in _players)) exitWith {
		[objNull, localize "SAA_ZEUS_MESSAGES_ERRORMUSTBEANONZEUSPLAYER"] call bis_fnc_showCuratorFeedbackMessage;
	};

	private _returnValues = [_players];
	_returnValues append _players;
	private _displayValues = [localize "SAA_GENERAL_EACH"];
	_displayValues append (_players apply {name _x});

	private _targetIndex = 0;

	if (!isNull _objectUnderCursor) then {
		_targetIndex = _returnValues find _objectUnderCursor;
		if (_targetIndex < 0) then {_targetIndex = 0};
	};

	[localize "SAA_ZEUS_MODULES_STORAGE_RESTRICTSTORAGEACCESS_DIALOG_HEADER",
		[
			["COMBO", [localize "SAA_ZEUS_MODULES_STORAGE_RESTRICTSTORAGEACCESS_DIALOG_SHOWHINT_DISPLAYNAME", localize "SAA_ZEUS_MODULES_STORAGE_RESTRICTSTORAGEACCESS_DIALOG_SHOWHINT_TOOLTIP"],
				[
					_returnValues,
					[
						_displayValues
					],
					_targetIndex
				]
			],
			["CHECKBOX", [localize "SAA_ZEUS_MODULES_STORAGE_RESTRICTSTORAGEACCESS_DIALOG_RESTRICT_DISPLAYNAME", localize "SAA_ZEUS_MODULES_STORAGE_RESTRICTSTORAGEACCESS_DIALOG_RESTRICT_TOOLTIP"],
				true
			],
			["CHECKBOX", [localize "SAA_ZEUS_MODULES_STORAGE_RESTRICTSTORAGEACCESS_DIALOG_SHOWHINT_DISPLAYNAME", localize "SAA_ZEUS_MODULES_STORAGE_RESTRICTSTORAGEACCESS_DIALOG_SHOWHINT_TOOLTIP"],
				true
			]
		],
		{ // On Confirmation
			params ["_dialogResult", "_args"];
			_dialogResult params ["_target", "_isRestricted", "_showInfo"];
			
			[[_target, _isRestricted, _showInfo], Shadec_fnc_restrictStorageAccess] remoteExec ["call", 2];

			if (_target isEqualType []) then {
				_target = localize "SAA_GENERAL_EACH" + " " + toLower localize "SAA_GENERAL_PLAYER";
			} else {
				_target = name _target;
			};

			[localize "SAA_GENERAL_SUCCESS", _target + " " + [localize "SAA_ZEUS_MODULES_STORAGE_RESTRICTSTORAGEACCESS_ZEUSMESSAGE_GRANTED", localize "SAA_ZEUS_MODULES_STORAGE_RESTRICTSTORAGEACCESS_ZEUSMESSAGE_RESTRICTED"] select _isRestricted, 3] call BIS_fnc_curatorHint;
		},
		{},
		[]
	] call zen_dialog_fnc_create;
}, "img\SAA_logo_256.paa"] call zen_custom_modules_fnc_register;