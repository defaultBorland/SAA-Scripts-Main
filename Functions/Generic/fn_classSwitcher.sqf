params["_class", "_lang"];

_convertedClass = "";

switch (_class) do {
	case "Rifleman";
	case "Стрелок": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Стрелок"} else {_convertedClass = "Rifleman"};
	};
	case "Nurse";
	case "Медбрат": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Медбрат"} else {_convertedClass = "Nurse"};
	};
	case "Machinegunner";
	case "Machine Gunner";
	case "Пулемётчик": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Пулемётчик"} else {_convertedClass = "Machinegunner"};
	};
	case "Grenadier";
	case "Гренадёр": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Гренадёр"} else {_convertedClass = "Grenadier"};
	};
	case "Engineer";
	case "Сапёр-Инженер": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Сапер-инженер"} else {_convertedClass = "Engineer"};
	};
	case "ATSpec";
	case "AT/AA-Specialist";
	case "ПТ/ПВО-Специалист": {
		if (_lang isEqualTo "RU") then {_convertedClass = "ПТ/ПВО-Специалист"} else {_convertedClass = "ATSpec"};
	};
	case "Pointer";
	case "Наводчик": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Наводчик"} else {_convertedClass = "Pointer"};
	};
	case "Medic";
	case "Медик": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Медик"} else {_convertedClass = "Medic"};
	};
	case "Marksman";
	case "Марксман": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Марксман"} else {_convertedClass = "Marksman"};
	};
	case "Sniper";
	case "Снайпер": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Снайпер"} else {_convertedClass = "Sniper"};
	};
	case "N/A";
	case "Недоступно": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Недоступно"} else {_convertedClass = "N/A"};
	};
	default {_convertedClass = "N/A"};
};

//return
_convertedClass