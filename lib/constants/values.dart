const String apiUrl = "http://localhost:8081";

class AppValues {
  static const appName = "Usug";

  static const List<String> alphabet = [
    "А",
    "Б",
    "В",
    "Г",
    "Д",
    "Е",
    "Ё",
    "Ж",
    "З",
    "И",
    "Й",
    "К",
    "Л",
    "М",
    "Н",
    "О",
    "Ө",
    "П",
    "Р",
    "С",
    "Т",
    "У",
    "Ү",
    "Ф",
    "Х",
    "Ц",
    "Ч",
    "Ш",
    "Щ",
    "Ъ",
    "Ы",
    "Ь",
    "Э",
    "Ю",
    "Я"
  ];

  AppRole role = AppRole.consumer;
}

enum AppRole { consumer, org, staff }

class SetAble {
  AppRole role;

  SetAble(this.role);

  void setRole(AppRole currentRole) {
    role = currentRole;
  }
}
