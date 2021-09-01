class DriverModel {
  final String driverAvatarUrl;
  final String firstname;
  final String lastname;
  final String email;
  final String language;
  final String postcode;
  final String ort;
  final String city;
  final String carname;
  final String carbrand;
  final String licensePlate;
  final bool doHelp;
  final double startPrice;
  final int trips;
  final double ratings;
  final bool isDarkMode;
  const DriverModel({
    required this.driverAvatarUrl,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.language,
    required this.postcode,
    required this.ort,
    required this.city,
    required this.carname,
    required this.carbrand,
    required this.licensePlate,
    required this.doHelp,
    required this.startPrice,
    required this.trips,
    required this.ratings,
    required this.isDarkMode,
  });
}
