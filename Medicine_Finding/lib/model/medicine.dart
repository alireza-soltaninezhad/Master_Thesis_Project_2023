class Medicine {
  final int id;
  final String name;
  final String? commercialName;
  final String type;
  final double price;
  final String date;

  Medicine(
      {required this.id,
      required this.name,
      this.commercialName,
      required this.type,
      required this.date,
      required this.price});
}
