class Renter {
  final String usrId;
  final String fName;
  final String lName;
  final String nationalId;
  final String phoneNumber;
  final String buildingNumber;
  final String apartmentNumber;
  final String monthlyRent;
  final String startingDate;

  Renter({
    required this.usrId,
    required this.fName,
    required this.lName,
    required this.nationalId,
    required this.phoneNumber,
    required this.buildingNumber,
    required this.apartmentNumber,
    required this.monthlyRent,
    required this.startingDate,
  });

  /// - Use `fromJson` method to convert supabase response to [UserModel] ...
  factory Renter.fromJson(Map<String, dynamic> json) {
    return Renter(
      usrId: json['usrId'],
      fName: json['fName'],
      lName: json['lName'],
      nationalId: json['nationalId'],
      phoneNumber: json['phoneNumber'],
      buildingNumber: json['buildingNumber'],
      apartmentNumber: json['apartmentNumber'],
      monthlyRent: json['monthlyRent'],
      startingDate: json['startingDate'],
    );
  }

  /// - Use `toJson` method to convert [UserModel] to json for update request ...

  Map<String, dynamic> toJson() {
    return {
      'usrId': usrId,
      'fName': fName,
      'lName': lName,
      'nationalId': nationalId,
      'phoneNumber': phoneNumber,
      'buildingNumber': buildingNumber,
      'apartmentNumber': apartmentNumber,
      'monthlyRent': monthlyRent,
      'startingDate': startingDate,
    };
  }
}
