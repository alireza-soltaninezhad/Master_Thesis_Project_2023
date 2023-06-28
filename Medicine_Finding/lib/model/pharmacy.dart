class Pharmacy {

  final int id;
  final String name;
  final String address;
  final String? phoneNumber;
  final double latitude;
  final double longitude;

  Pharmacy(
      {required this.id,
      required this.name,
      required this.address,
      this.phoneNumber,
      required this.latitude,
      required this.longitude});
}
