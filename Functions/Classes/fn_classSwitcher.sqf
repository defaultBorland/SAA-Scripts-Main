params["_class", "_lang"];

_convertedClass = "";

switch (_class) do {
	case "Rifleman";
	case "Стрелок": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Стрелок"};
		if (_lang isEqualTo "EN") then {_convertedClass = "Rifleman"};
		if (_lang isEqualTo "LS") then {_convertedClass = "SAA_CLASSES_RIFLEMAN"};
	};
	case "Nurse";
	case "Медбрат": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Медбрат"};
		if (_lang isEqualTo "EN") then {_convertedClass = "Nurse"};
		if (_lang isEqualTo "LS") then {_convertedClass = "SAA_CLASSES_NURSE"};
	};
	case "Machinegunner";
	case "Machine Gunner";
	case "Пулемётчик": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Пулемётчик"};
		if (_lang isEqualTo "EN") then {_convertedClass = "Machinegunner"};
		if (_lang isEqualTo "LS") then {_convertedClass = "SAA_CLASSES_MACHINEGUNNER"};
	};
	case "Grenadier";
	case "Гренадёр": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Гренадёр"};
		if (_lang isEqualTo "EN") then {_convertedClass = "Grenadier"};
		if (_lang isEqualTo "LS") then {_convertedClass = "SAA_CLASSES_GRENADIER"};
	};
	case "Engineer";
	case "Сапёр-Инженер": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Сапёр-Инженер"};
		if (_lang isEqualTo "EN") then {_convertedClass = "Engineer"};
		if (_lang isEqualTo "LS") then {_convertedClass = "SAA_CLASSES_ENGINEER"};
	};
	case "ATSpec";
	case "AT/AA-Specialist";
	case "ПТ/ПВО-Специалист": {
		if (_lang isEqualTo "RU") then {_convertedClass = "ПТ/ПВО-Специалист"};
		if (_lang isEqualTo "EN") then {_convertedClass = "ATSpec"};
		if (_lang isEqualTo "LS") then {_convertedClass = "SAA_CLASSES_ATSPEC"};
	};
	case "Medic";
	case "Медик": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Медик"};
		if (_lang isEqualTo "EN") then {_convertedClass = "Medic"};
		if (_lang isEqualTo "LS") then {_convertedClass = "SAA_CLASSES_MEDIC"};
	};
	case "Marksman";
	case "Марксман": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Марксман"};
		if (_lang isEqualTo "EN") then {_convertedClass = "Marksman"};
		if (_lang isEqualTo "LS") then {_convertedClass = "SAA_CLASSES_MARKSMAN"};
	};
	case "Sniper";
	case "Снайпер": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Снайпер"};
		if (_lang isEqualTo "EN") then {_convertedClass = "Sniper"};
		if (_lang isEqualTo "LS") then {_convertedClass = "SAA_CLASSES_SNIPER"};
	};
	case "N/A";
	case "Недоступно": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Недоступно"};
		if (_lang isEqualTo "EN") then {_convertedClass = "N/A"};
		if (_lang isEqualTo "LS") then {_convertedClass = "SAA_CLASSES_NA"};
	};
	case "None";
	case "Отсутствует": {
		if (_lang isEqualTo "RU") then {_convertedClass = "Отсутствует"};
		if (_lang isEqualTo "EN") then {_convertedClass = "None"};
		if (_lang isEqualTo "LS") then {_convertedClass = "SAA_CLASSES_NONE"};
	};
	default {_convertedClass = "N/A"};
};

//return
_convertedClass