class EndPoints {
  static const String baseUrl = "https://api.example.com/"; // Placeholder

  static const _Unit unit = _Unit();
  static const _Auth auth = _Auth();
}

class _Auth {
  const _Auth();
  final String login = "auth/login";
}

class _Unit {
  const _Unit();
  final String createUnit = "unit/create";
  final String updateUnit = "unit/update";
  final String deleteUnit = "unit/delete";
  final String getAllUnits = "unit/all";
  final String getUnitById = "unit/get";
}
