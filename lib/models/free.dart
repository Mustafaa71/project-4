class Free {
  final String floorNumb;
  final String appartmentNumb;
  final String deservedMoney;
  final String lastMaintain;
  final String isReady;

  Free({
    required this.floorNumb,
    required this.appartmentNumb,
    required this.deservedMoney,
    required this.lastMaintain,
    required this.isReady,
  });

  factory Free.fromJson(Map<String, dynamic> json) {
    return Free(
      floorNumb: json['floorNumb'],
      appartmentNumb: json['appartmentNumb'],
      deservedMoney: json['deservedMoney'],
      lastMaintain: json['lastMaintain'],
      isReady: json['isReady'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'floorNumb': floorNumb,
      'appartmentNumb': appartmentNumb,
      'deservedMoney': deservedMoney,
      'lastMaintain': lastMaintain,
      'isReady': isReady,
    };
  }
}
