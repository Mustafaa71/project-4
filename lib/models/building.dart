class Building {
  final String buildingNumber;
  final String floorNumber;
  final String appartmentNumber;
  final String deservedMoney;
  final String lastMaintance;
  final String isReady;

  Building({
    required this.buildingNumber,
    required this.floorNumber,
    required this.appartmentNumber,
    required this.deservedMoney,
    required this.lastMaintance,
    required this.isReady,
  });
}

class BuildingData {
  /// Building 1 ...
  static final List<Building> building_1 = [];
}
